// ignore_for_file: non_constant_identifier_names, prefer_interpolation_to_compose_strings, no_leading_underscores_for_local_identifiers, unnecessary_brace_in_string_interps

import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

Codec<String, String> stringToBase64 = utf8.fuse(base64);

Future request_virtual_account(String bank, Map<String, String> customer, List<Map<String, dynamic>> items) async {
  Map<String, dynamic> _body_request = {
    "transaction_details": {
      "gross_amount": items[0]["price"],
      "order_id": "SANGKAR-${DateTime.now().millisecondsSinceEpoch}"
    },
    "customer_details": customer,
    "item_details": items,
    "bank_transfer": {
      "bank": bank,
      "free_text": {
        "inquiry": [
          {
            "id": "Pembelian hewan ternak",
            "en": "Purchase of livestock"
          }
        ],
        "payment": [
          {
            "id": "Pembelian hewan ternak",
            "en": "Purchase of livestock"
          }
        ]
      }
    }
  };

  if (bank == "mandiri") {
    _body_request["payment_type"] = "echannel";
    _body_request["echannel"] = {"bill_info1" : "Purchase Sangkar", "bill_info2" : "App"};
  } else {
    _body_request["payment_type"] = "bank_transfer";
    _body_request["bank_transfer"] = {
      "bank": bank,
      "free_text": {
        "inquiry": [
          {
            "id": "Pembelian hewan ternak",
            "en": "Purchase of livestock"
          }
        ],
        "payment": [
          {
            "id": "Pembelian hewan ternak",
            "en": "Purchase of livestock"
          }
        ]
      }
    };
  }

  final request = await http.post(
    Uri.parse("${dotenv.env["MIDTRANS_API"]}/v2/charge"),
    headers: <String, String> {
      "accept": "application/json",
      "content-type": "application/json; charset=UTF-8",
      "authorization": "Basic " + stringToBase64.encode("${dotenv.env["MIDTRANS_SERVER_KEY"]}:")
    },
    body: jsonEncode(_body_request)
  );

  if (request.statusCode == 200) {
    Map<String, dynamic> response = json.decode(request.body);
    return <String, dynamic> {
      "status": true,
      "data": response
    };
  } else {
    Map<String, dynamic> response = json.decode(request.body);
    return <String, dynamic> {
      "status": false,
      "data": response
    };
  }
}

Future get_transaction_status(String order_id) async {
  final request = await http.get(
    Uri.parse(("${dotenv.env["MIDTRANS_API"]}/v2/${order_id}/status")),
    headers: <String, String> {
      "accept": "application/json",
      "content-type": "application/json; charset=UTF-8",
      "authorization": "Basic " + stringToBase64.encode("${dotenv.env["MIDTRANS_SERVER_KEY"]}:")
    }
  );

  if (request.statusCode == 200) {
    Map<String, dynamic> response = json.decode(request.body);
    if (["200", "201"].contains(response["status_code"])) {
      return <String, dynamic> {
        "status": "200",
        "data": {
          "transaction_status": response["transaction_status"],
          "order_id": response["order_id"]
        }
      };
    } else {
      return <String, dynamic> {
        "status": response["status_code"],
        "message": response["status_message"]
      };
    }
  } else {
    Map<String, dynamic> response = json.decode(request.body);
    return <String, dynamic> {
      "data": response
    };
  }
}