// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sangkar/provider/payment_provider.dart';
import 'package:sangkar/utils/function.dart';
import 'package:sangkar/utils/request_payment.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  late PaymentProvider payment_provider;
  bool check_status = true;

  String get_imageprefix(String prefix) {
    if (prefix == "mandiri") return "assets/payment/mandiri.png";
    if (prefix == "bri") return "assets/payment/briva.png";
    if (prefix == "bca") return "assets/payment/bca.png";
    if (prefix == "bni") return "assets/payment/bni.png";
    if (prefix == "cimb") return "assets/payment/cimb_niaga.png";
    if (prefix == "permata") return "assets/payment/permata.png";

    return "assets/payment/permata.png";
  }

  Future get_payment_status() async {
    final payment = await get_transaction_status(payment_provider.payment["order_id"]);

    if (payment["status"] == "200") {
      String message = "";

      if (payment["data"]["transaction_status"] == "pending") message = "Menunggu Pembayaran";
      if (payment["data"]["transaction_status"] == "settlement") message = "Pembayaran berhasil";
      if (payment["data"]["transaction_status"] == "expire") message = "Sesi pembayaran habis";
      if (payment["data"]["transaction_status"] == "deny") message = "Pembayaran di tolak oleh bank";
      if (payment["data"]["transaction_status"] == "cancel") message = "Pembayaran dibatalkan";

      if (["settlement", "expire", "deny", "cancel"].contains(payment["data"]["transaction_status"])) {
        setState(() => check_status = false);
      }

      return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            message,
            style: TextStyle(
              fontFamily: "Roboto",
              fontWeight: FontWeight.w700,
              color: HexColor("#FFFFFF"),
              fontSize: 12
            )
          ),
          backgroundColor: HexColor("#00AA13"),
        )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    payment_provider = Provider.of<PaymentProvider>(context);

    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: AppBar(
            backgroundColor: HexColor("#00AA13"),
            automaticallyImplyLeading: false
          )
        ),
        body: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                check_status ? "Selesaikan Pembayaran" : "Pembayaran Selesai",
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w700,
                  color: HexColor("#292929"),
                  fontSize: 16
                )
              ),
              if (check_status) TimerCountdown(
                format: CountDownTimerFormat.hoursMinutesSeconds,
                spacerWidth: 1,
                enableDescriptions: false,
                timeTextStyle: TextStyle(
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w700,
                  color: HexColor("#FF7F17"),
                  fontSize: 16
                ),
                colonsTextStyle: TextStyle(
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w700,
                  color: HexColor("#FF7F17"),
                  fontSize: 16
                ),
                endTime: check_status ? DateFormat('yyyy-MM-dd HH:mm').parse(payment_provider.payment["expiry_time"]) : DateTime.now(),
                onEnd: () {
                  debugPrint("countdown end");
                },
              ),
              if (check_status) const SizedBox(height: 12),
              if (check_status) Text(
                "Batas Akhir Pembayaran",
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w500,
                  color: HexColor("#6D7588"),
                  fontSize: 14
                )
              ),
              if (check_status) Text(
                transformDate(payment_provider.payment["expiry_time"]),
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w500,
                  color: HexColor("#292929"),
                  fontSize: 15
                )
              ),
              const SizedBox(height: 24),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: HexColor("#F0F3F7")),
                  borderRadius: const BorderRadius.all(Radius.circular(8))
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      child: Row(
                        children: [
                          Text(
                            payment_provider.payment["bank"].toUpperCase() + " Virtual Account",
                            style: TextStyle(
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w700,
                              color: HexColor("#292929")
                            )
                          ),
                          Expanded(child: Container()),
                          Image.asset(
                            get_imageprefix(payment_provider.payment["bank"]),
                            width: 40,
                            height: 40,
                          )
                        ]
                      )
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 1, color: HexColor("#F0F3F7"))
                        )
                      )
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Nomor Virtual Account",
                                    style: TextStyle(
                                      fontFamily: "Roboto",
                                      color: HexColor("#292929"),
                                      fontSize: 12
                                    )
                                  ),
                                  Text(
                                    payment_provider.payment["va_number"],
                                    style: TextStyle(
                                      fontFamily: "Roboto",
                                      fontWeight: FontWeight.w700,
                                      color: HexColor("#292929"),
                                      fontSize: 14
                                    )
                                  )
                                ]
                              ),
                              Expanded(child: Container()),
                              GestureDetector(
                                onTap: () async {
                                  await Clipboard.setData(ClipboardData(text: payment_provider.payment["va_number"]));
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      "Salin",
                                      style: TextStyle(
                                        fontFamily: "Roboto",
                                        fontWeight: FontWeight.w700,
                                        color: HexColor("#00AA13"),
                                        fontSize: 12
                                      )
                                    ),
                                    const SizedBox(width: 4),
                                    Image.asset("assets/clipboard.png", width: 15, height: 15)
                                  ]
                                )
                              )
                            ]
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Total Tagihan",
                                    style: TextStyle(
                                      fontFamily: "Roboto",
                                      color: HexColor("#292929"),
                                      fontSize: 12
                                    )
                                  ),
                                  Text(
                                    transformPrice(double.parse(payment_provider.payment["gross_amount"])),
                                    style: TextStyle(
                                      fontFamily: "Roboto",
                                      fontWeight: FontWeight.w700,
                                      color: HexColor("#292929"),
                                      fontSize: 14
                                    )
                                  )
                                ]
                              ),
                              Expanded(child: Container()),
                              GestureDetector(
                                onTap: () async {
                                  await Clipboard.setData(ClipboardData(text: payment_provider.payment["va_number"]));
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      "Salin",
                                      style: TextStyle(
                                        fontFamily: "Roboto",
                                        fontWeight: FontWeight.w700,
                                        color: HexColor("#00AA13"),
                                        fontSize: 12
                                      )
                                    ),
                                    const SizedBox(width: 4),
                                    Image.asset("assets/clipboard.png", width: 15, height: 15)
                                  ]
                                )
                              )
                            ]
                          )
                        ]
                      )
                    )
                  ]
                )
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  if (check_status) Expanded(child: GestureDetector(
                    onTap: () => get_payment_status(),
                    child: Container(
                      height: 34,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                        border: Border.all(width: 1, color: HexColor("#00AA13")),
                        color: Colors.white
                      ),
                      child: Text(
                        "Cek Status Pembayaran",
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w700,
                          color: HexColor("#00AA13"),
                          fontSize: 12
                        )
                      )
                    )
                  )),
                  if (check_status) const SizedBox(width: 12),
                  Expanded(child: GestureDetector(
                    onTap: () {
                      context.goNamed("Profile");
                    },
                    child: Container(
                      height: 34,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                        border: Border.all(width: 1, color: HexColor("#00AA13")),
                        color: HexColor("#00AA13")
                      ),
                      child: Text(
                        "Kembali ke Beranda",
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w700,
                          color: HexColor("#FFFFFF"),
                          fontSize: 12
                        )
                      )
                    )
                  ))
                ]
              )
            ]
          )
        )
      )
    );
  }
}