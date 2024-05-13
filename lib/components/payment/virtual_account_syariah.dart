import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class VirtualAccountSyariah extends StatefulWidget {
  const VirtualAccountSyariah({super.key});

  @override
  State<VirtualAccountSyariah> createState() => _VirtualAccountSyariahState();
}

class _VirtualAccountSyariahState extends State<VirtualAccountSyariah> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Transfer Virtual Account Syariah",
          style: TextStyle(
            fontFamily: "Roboto",
            fontWeight: FontWeight.w700,
            fontSize: 15,
            color: HexColor("#292929")
          )
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () {},
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
                Image.asset("assets/payment/bsi.png", width: 40, height: 40),
                const SizedBox(width: 15),
                Text(
                  "Bank Syariah Indonesia",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 12,
                    color: HexColor("#292929")
                  )
                ),
                Expanded(child: Container()),
                Image.asset("assets/arrow_right_black.png", width: 24, height: 24)
              ]
            )
          )
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            // decoration: BoxDecoration(
            //   border: Border(
            //     bottom: BorderSide(width: 1, color: HexColor("#EDEDED"))
            //   )
            // ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/payment/muamalat.png", width: 40, height: 40),
                const SizedBox(width: 15),
                Text(
                  "Bank Muamalat",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 12,
                    color: HexColor("#292929")
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