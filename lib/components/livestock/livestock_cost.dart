// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shimmer/shimmer.dart';

class LivestockCost extends StatefulWidget {
  const LivestockCost({super.key});

  @override
  State<LivestockCost> createState() => _LivestockCostState();
}

class _LivestockCostState extends State<LivestockCost> {
  List<Map<String, dynamic>> livestock_costs = [
    {
      "image": "https://media.philstar.com/photos/2023/01/29/web-year-goat-pixabay-fitmum_2023-01-29_14-13-27.jpg",
      "estimate": "2 Bulan 3 Hari"
    },
    {
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVI9tV9tOiRqdNPAoWA44Ad49ppIyFmNrH0CvC3vAapg&s",
      "estimate": "2 Bulan"
    },
    {
      "image": "https://i.ytimg.com/vi/8Kkybu9Xsoc/maxresdefault.jpg",
      "estimate": "1 Bulan 29 Hari"
    },
    {
      "image": "https://www.icimod.org/wp-content/uploads/2019/12/Animal_Husbandry-1.jpg",
      "estimate": "28 Hari"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 54),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var index = 0; index < livestock_costs.length; index++) Column(
              children: [
                if (index > 0) Container(width: double.infinity, height: 8, color: HexColor("#F0F3F7")),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 80,
                          height: 80,
                          clipBehavior: Clip.hardEdge,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(6))
                          ),
                          child: Image.network(
                            livestock_costs[index]["image"],
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Shimmer.fromColors(
                                baseColor: Colors.grey.shade300,
                                highlightColor: HexColor("#00AA13").withOpacity(0.5),
                                child: Container(width: 80, height: 80, color: Colors.white)
                              );
                            },
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                width: 80,
                                height: 80,
                                color: Colors.grey.shade300,
                                child: Center(
                                  widthFactor: 34,
                                  heightFactor: 34,
                                  child: Image.asset("assets/image_broken.png", width: 34, height: 34)
                                )
                              );
                            }
                          )
                        )
                      ),
                      Expanded(
                        child: Container(
                          height: 100,
                          margin: const EdgeInsets.only(left: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Estimasi berkembang biak dalam",
                                    style: TextStyle(
                                      fontFamily: "Roboto",
                                      color: HexColor("#292929"),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12
                                    )
                                  ),
                                  Text(
                                    livestock_costs[index]["estimate"],
                                    style: TextStyle(
                                      fontFamily: "Roboto",
                                      color: HexColor("#00AA13"),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13
                                    )
                                  )
                                ]
                              )),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 14),
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                                    color: HexColor("#00AA13")
                                  ),
                                  child: const Text(
                                    "Bayar",
                                    style: TextStyle(
                                      fontFamily: "Roboto",
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                      fontSize: 12
                                    )
                                  )
                                )
                              ),
                              const SizedBox(height: 2),
                              Text(
                                "*Biaya akan ditagih setiap bulan pada tanggal 5",
                                style: TextStyle(
                                  fontFamily: "Roboto",
                                  color: HexColor("#292929").withOpacity(0.5),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10
                                )
                              )
                            ]
                          )
                        )
                      )
                    ]
                  )
                )
              ]
            ),
            const SizedBox(height: 16)
          ]
        )
      )
    );
  }
}