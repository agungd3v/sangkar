// ignore_for_file: non_constant_identifier_names, avoid_init_to_null, prefer_final_fields, unused_field

import 'package:flutter/material.dart';

class PaymentProvider extends ChangeNotifier {
  String _selected_bank = "";
  dynamic _payment = null;

  dynamic get payment => _payment;
  dynamic get selected_bank => _selected_bank;

  set set_payment(dynamic param) {
    _payment = param;
    notifyListeners();
  }

  set set_selected_bank(String param) {
    _selected_bank = param;
    notifyListeners();
  }

  reset() {
    _selected_bank = "";
  }
}