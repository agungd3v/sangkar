// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class LivestockSell extends StatefulWidget {
  const LivestockSell({super.key});

  @override
  State<LivestockSell> createState() => _LivestockSellState();
}

class _LivestockSellState extends State<LivestockSell> {
  List<Map<String, dynamic>> livestock_sell = [
    {
      "image": [
        "https://media.philstar.com/photos/2023/01/29/web-year-goat-pixabay-fitmum_2023-01-29_14-13-27.jpg",
        "https://media.philstar.com/photos/2023/01/29/web-year-goat-pixabay-fitmum_2023-01-29_14-13-27.jpg",
        "https://media.philstar.com/photos/2023/01/29/web-year-goat-pixabay-fitmum_2023-01-29_14-13-27.jpg",
        "https://media.philstar.com/photos/2023/01/29/web-year-goat-pixabay-fitmum_2023-01-29_14-13-27.jpg"
      ],
      "last_update": "01/01/2024"
    },
    {
      "image": [
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVI9tV9tOiRqdNPAoWA44Ad49ppIyFmNrH0CvC3vAapg&s",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVI9tV9tOiRqdNPAoWA44Ad49ppIyFmNrH0CvC3vAapg&s",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVI9tV9tOiRqdNPAoWA44Ad49ppIyFmNrH0CvC3vAapg&s",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVI9tV9tOiRqdNPAoWA44Ad49ppIyFmNrH0CvC3vAapg&s"
      ],
      "last_update": "07/01/2024"
    },
    {
      "image": [
        "https://i.ytimg.com/vi/8Kkybu9Xsoc/maxresdefault.jpg",
        "https://i.ytimg.com/vi/8Kkybu9Xsoc/maxresdefault.jpg",
        "https://i.ytimg.com/vi/8Kkybu9Xsoc/maxresdefault.jpg",
        "https://i.ytimg.com/vi/8Kkybu9Xsoc/maxresdefault.jpg",
      ],
      "last_update": "14/01/2024"
    },
    {
      "image": [
        "https://www.icimod.org/wp-content/uploads/2019/12/Animal_Husbandry-1.jpg",
        "https://www.icimod.org/wp-content/uploads/2019/12/Animal_Husbandry-1.jpg",
        "https://www.icimod.org/wp-content/uploads/2019/12/Animal_Husbandry-1.jpg",
        "https://www.icimod.org/wp-content/uploads/2019/12/Animal_Husbandry-1.jpg",
      ],
      "last_update": "21/01/2024"
    },
    {
      "image": [
        "https://media.philstar.com/photos/2023/01/29/web-year-goat-pixabay-fitmum_2023-01-29_14-13-27.jpg",
        "https://media.philstar.com/photos/2023/01/29/web-year-goat-pixabay-fitmum_2023-01-29_14-13-27.jpg",
        "https://media.philstar.com/photos/2023/01/29/web-year-goat-pixabay-fitmum_2023-01-29_14-13-27.jpg",
        "https://media.philstar.com/photos/2023/01/29/web-year-goat-pixabay-fitmum_2023-01-29_14-13-27.jpg"
      ],
      "last_update": "01/01/2024"
    },
    {
      "image": [
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVI9tV9tOiRqdNPAoWA44Ad49ppIyFmNrH0CvC3vAapg&s",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVI9tV9tOiRqdNPAoWA44Ad49ppIyFmNrH0CvC3vAapg&s",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVI9tV9tOiRqdNPAoWA44Ad49ppIyFmNrH0CvC3vAapg&s",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVI9tV9tOiRqdNPAoWA44Ad49ppIyFmNrH0CvC3vAapg&s"
      ],
      "last_update": "07/01/2024"
    },
    {
      "image": [
        "https://i.ytimg.com/vi/8Kkybu9Xsoc/maxresdefault.jpg",
        "https://i.ytimg.com/vi/8Kkybu9Xsoc/maxresdefault.jpg",
        "https://i.ytimg.com/vi/8Kkybu9Xsoc/maxresdefault.jpg",
        "https://i.ytimg.com/vi/8Kkybu9Xsoc/maxresdefault.jpg",
      ],
      "last_update": "14/01/2024"
    },
    {
      "image": [
        "https://www.icimod.org/wp-content/uploads/2019/12/Animal_Husbandry-1.jpg",
        "https://www.icimod.org/wp-content/uploads/2019/12/Animal_Husbandry-1.jpg",
        "https://www.icimod.org/wp-content/uploads/2019/12/Animal_Husbandry-1.jpg",
        "https://www.icimod.org/wp-content/uploads/2019/12/Animal_Husbandry-1.jpg",
      ],
      "last_update": "21/01/2024"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 54),
      child: SingleChildScrollView(
        child: Column(
          children: [
            for (var index = 0; index < livestock_sell.length; index++) Column(
              children: [
                const SizedBox(height: 12),
                if (index > 0) Container(width: double.infinity, height: 8, color: HexColor("#F0F3F7"), margin: const EdgeInsets.symmetric(vertical: 6)),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (index > 0) const SizedBox(height: 8),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                color: HexColor("#00AA13"),
                                borderRadius: const BorderRadius.all(Radius.circular(6))
                              ),
                              alignment: Alignment.center,
                              height: 28,
                              width: 68,
                              child: const Text(
                                "Jual",
                                style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12,
                                  color: Colors.white
                                )
                              )
                            )
                          ),
                          const SizedBox(width: 6),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                color: HexColor("#00AA13"),
                                borderRadius: const BorderRadius.all(Radius.circular(6))
                              ),
                              alignment: Alignment.center,
                              height: 28,
                              width: 88,
                              child: const Text(
                                "Ternakan",
                                style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12,
                                  color: Colors.white
                                )
                              )
                            )
                          )
                        ]
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          for (var child = 0; child < livestock_sell[index]["image"].length; child++) Container(
                            width: MediaQuery.of(context).size.width / 4 - 15.4,
                            // width: 80,
                            height: 80,
                            clipBehavior: Clip.hardEdge,
                            margin: child < 1 ? const EdgeInsets.only(left: 0) : const EdgeInsets.only(left: 12),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(6))
                            ),
                            child: Image.network(livestock_sell[index]["image"][child], width: 80, height: 80, fit: BoxFit.cover)
                          )
                        ]
                      )
                    ]
                  )
                )
              ]
            ),
            const SizedBox(height: 30)
          ]
        )
      )
    );
  }
}