// ignore_for_file: non_constant_identifier_names

import 'package:intl/intl.dart';

String transformPrice(num price) {
  final transform = NumberFormat.currency(
    locale: "id_ID",
    symbol: "Rp ",
    decimalDigits: 0
  ).format(price);

  return transform;
}

String transformDate(String dateString) {
  final local_date = DateTime.parse(dateString).toLocal();

  final input_format = DateFormat('yyyy-MM-dd HH:mm');
  final input_date = input_format.parse(local_date.toString());

  final output_format = DateFormat('EEEE, dd MMMM yyyy HH:mm', "id");
  final output_date = output_format.format(input_date);

  return output_date.toString();
}