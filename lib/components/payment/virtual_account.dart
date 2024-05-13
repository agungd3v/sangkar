// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:sangkar/provider/payment_provider.dart';

class VirtualAccount extends StatefulWidget {
  const VirtualAccount({super.key});

  @override
  State<VirtualAccount> createState() => _VirtualAccountState();
}

class _VirtualAccountState extends State<VirtualAccount> {
  late PaymentProvider payment_provider;

  void selected_method(String method) {
    payment_provider.set_selected_bank = method;
  }

  @override
  Widget build(BuildContext context) {
    payment_provider = Provider.of<PaymentProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Transfer Virtual Account",
          style: TextStyle(
            fontFamily: "Roboto",
            fontWeight: FontWeight.w700,
            fontSize: 15,
            color: HexColor("#292929")
          )
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () => selected_method("mandiri"),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1, color: HexColor("#EDEDED"))
              )
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/payment/mandiri.png", width: 40, height: 40),
                const SizedBox(width: 15),
                Text(
                  "Mandiri Virtual Account",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 12,
                    fontWeight: payment_provider.selected_bank == "mandiri" ? FontWeight.bold : FontWeight.normal,
                    color: payment_provider.selected_bank == "mandiri" ? HexColor("#00AA13") : HexColor("#292929")
                  )
                ),
                Expanded(child: Container()),
                Image.asset("assets/arrow_right_black.png", width: 24, height: 24)
              ]
            )
          )
        ),
        GestureDetector(
          onTap: () => selected_method("bca"),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1, color: HexColor("#EDEDED"))
              )
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/payment/bca.png", width: 40, height: 40),
                const SizedBox(width: 15),
                Text(
                  "BCA Virtual Account",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 12,
                    fontWeight: payment_provider.selected_bank == "bca" ? FontWeight.bold : FontWeight.normal,
                    color: payment_provider.selected_bank == "bca" ? HexColor("#00AA13") : HexColor("#292929")
                  )
                ),
                Expanded(child: Container()),
                Image.asset("assets/arrow_right_black.png", width: 24, height: 24)
              ]
            )
          )
        ),
        GestureDetector(
          onTap: () => selected_method("bri"),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1, color: HexColor("#EDEDED"))
              )
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/payment/briva.png", width: 40, height: 40),
                const SizedBox(width: 15),
                Text(
                  "BRI Virtual Account",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 12,
                    fontWeight: payment_provider.selected_bank == "bri" ? FontWeight.bold : FontWeight.normal,
                    color: payment_provider.selected_bank == "bri" ? HexColor("#00AA13") : HexColor("#292929")
                  )
                ),
                Expanded(child: Container()),
                Image.asset("assets/arrow_right_black.png", width: 24, height: 24)
              ]
            )
          )
        ),
        GestureDetector(
          onTap: () => selected_method("bni"),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1, color: HexColor("#EDEDED"))
              )
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/payment/bni.png", width: 40, height: 40),
                const SizedBox(width: 15),
                Text(
                  "BNI Virtual Account",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 12,
                    fontWeight: payment_provider.selected_bank == "bni" ? FontWeight.bold : FontWeight.normal,
                    color: payment_provider.selected_bank == "bni" ? HexColor("#00AA13") : HexColor("#292929")
                  )
                ),
                Expanded(child: Container()),
                Image.asset("assets/arrow_right_black.png", width: 24, height: 24)
              ]
            )
          )
        ),
        GestureDetector(
          onTap: () => selected_method("cimb"),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1, color: HexColor("#EDEDED"))
              )
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/payment/cimb_niaga.png", width: 40, height: 40),
                const SizedBox(width: 15),
                Text(
                  "CIMB Virtual Account",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 12,
                    fontWeight: payment_provider.selected_bank == "cimb" ? FontWeight.bold : FontWeight.normal,
                    color: payment_provider.selected_bank == "cimb" ? HexColor("#00AA13") : HexColor("#292929")
                  )
                ),
                Expanded(child: Container()),
                Image.asset("assets/arrow_right_black.png", width: 24, height: 24)
              ]
            )
          )
        ),
        GestureDetector(
          onTap: () => selected_method("permata"),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 40,
                  height: 40,
                  child: Center(
                    widthFactor: 40,
                    heightFactor: 40,
                    child: Image.asset("assets/payment/permata.png", width: 30, height: 30)
                  )
                ),
                const SizedBox(width: 15),
                Text(
                  "PERMATA Virtual Account",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 12,
                    fontWeight: payment_provider.selected_bank == "permata" ? FontWeight.bold : FontWeight.normal,
                    color: payment_provider.selected_bank == "permata" ? HexColor("#00AA13") : HexColor("#292929")
                  )
                ),
                Expanded(child: Container()),
                Image.asset("assets/arrow_right_black.png", width: 24, height: 24)
              ]
            )
          )
        )
      ]
    );
  }
}