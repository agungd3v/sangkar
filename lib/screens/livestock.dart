// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sangkar/components/livestock/livestock_cost.dart';
import 'package:sangkar/components/livestock/livestock_report.dart';
import 'package:sangkar/components/livestock/livestock_sell.dart';

class LiveStockScreen extends StatefulWidget {
  const LiveStockScreen({super.key});

  @override
  State<LiveStockScreen> createState() => _LiveStockScreenState();
}

class _LiveStockScreenState extends State<LiveStockScreen> {
  int tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          backgroundColor: HexColor("#00AA13"),
          automaticallyImplyLeading: false,
        )
      ),
      body: DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            bottom: TabBar(
              indicatorColor: HexColor("#00AA13"),
              indicatorSize: TabBarIndicatorSize.tab,
              overlayColor: MaterialStateColor.resolveWith((states) => Colors.white),
              onTap: (index) {
                setState(() {
                  tabIndex = index;
                });
              },
              tabs: [
                Tab(child: Text(
                  "Biaya Ternak",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: tabIndex == 0 ? HexColor("#00AA13") : HexColor("#292929")
                  )
                )),
                Tab(child: Text(
                  "Jual Ternak",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: tabIndex == 1 ? HexColor("#00AA13") : HexColor("#292929")
                  )
                )),
                Tab(child: Text(
                  "Laporan",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: tabIndex == 2 ? HexColor("#00AA13") : HexColor("#292929")
                  )
                ))
              ]
            ),
            toolbarHeight: 0,
            backgroundColor: Colors.white
          ),
          body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              LivestockCost(),
              LivestockSell(),
              LivestockReport()
            ]
          )
        )
      ),
    );
  }
}