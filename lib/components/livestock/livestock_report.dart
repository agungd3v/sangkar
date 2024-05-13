// ignore_for_file: non_constant_identifier_names, avoid_unnecessary_containers, sized_box_for_whitespace, collection_methods_unrelated_type

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class LivestockReport extends StatefulWidget {
  const LivestockReport({super.key});

  @override
  State<LivestockReport> createState() => _LivestockReportState();
}

class _LivestockReportState extends State<LivestockReport> {
  List<Map<String, dynamic>> livestock_reports = [
    {
      "image": "https://media.philstar.com/photos/2023/01/29/web-year-goat-pixabay-fitmum_2023-01-29_14-13-27.jpg",
      "last_update": "01/01/2024",
      "last_update_image": [
        "https://media.philstar.com/photos/2023/01/29/web-year-goat-pixabay-fitmum_2023-01-29_14-13-27.jpg",
        "https://media.philstar.com/photos/2023/01/29/web-year-goat-pixabay-fitmum_2023-01-29_14-13-27.jpg",
        "https://media.philstar.com/photos/2023/01/29/web-year-goat-pixabay-fitmum_2023-01-29_14-13-27.jpg",
        "https://media.philstar.com/photos/2023/01/29/web-year-goat-pixabay-fitmum_2023-01-29_14-13-27.jpg"
      ]
    },
    {
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVI9tV9tOiRqdNPAoWA44Ad49ppIyFmNrH0CvC3vAapg&s",
      "last_update": "07/01/2024",
      "last_update_image": [
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVI9tV9tOiRqdNPAoWA44Ad49ppIyFmNrH0CvC3vAapg&s",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVI9tV9tOiRqdNPAoWA44Ad49ppIyFmNrH0CvC3vAapg&s",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVI9tV9tOiRqdNPAoWA44Ad49ppIyFmNrH0CvC3vAapg&s",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVI9tV9tOiRqdNPAoWA44Ad49ppIyFmNrH0CvC3vAapg&s",
      ]
    },
    {
      "image": "https://i.ytimg.com/vi/8Kkybu9Xsoc/maxresdefault.jpg",
      "last_update": "14/01/2024",
      "last_update_image": [
        "https://i.ytimg.com/vi/8Kkybu9Xsoc/maxresdefault.jpg",
        "https://i.ytimg.com/vi/8Kkybu9Xsoc/maxresdefault.jpg",
        "https://i.ytimg.com/vi/8Kkybu9Xsoc/maxresdefault.jpg",
        "https://i.ytimg.com/vi/8Kkybu9Xsoc/maxresdefault.jpg",
      ]
    },
    {
      "image": "https://www.icimod.org/wp-content/uploads/2019/12/Animal_Husbandry-1.jpg",
      "last_update": "21/01/2024",
      "last_update_image": [
        "https://www.icimod.org/wp-content/uploads/2019/12/Animal_Husbandry-1.jpg",
        "https://www.icimod.org/wp-content/uploads/2019/12/Animal_Husbandry-1.jpg",
        "https://www.icimod.org/wp-content/uploads/2019/12/Animal_Husbandry-1.jpg",
        "https://www.icimod.org/wp-content/uploads/2019/12/Animal_Husbandry-1.jpg",
      ]
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
            for (var index = 0; index < livestock_reports.length; index++) Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (index > 0) Container(width: double.infinity, height: 8, color: HexColor("#F0F3F7")),
                Container(
                  padding: const EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 9),
                  child: Row(
                    children: [
                      Text(
                        "Terahir diupdate, ",
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w700,
                          fontSize: 11,
                          color: HexColor("#292929")
                        )
                      ),
                      Text(
                        livestock_reports[index]["last_update"],
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w700,
                          fontSize: 11,
                          color: HexColor("#00AA13")
                        )
                      )
                    ]
                  )
                ),
                Container(
                  padding: const EdgeInsets.only(left: 12, right: 12, bottom: 18),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        clipBehavior: Clip.hardEdge,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(6))
                        ),
                        child: Image.network(livestock_reports[index]["image"], width: double.infinity, height: double.infinity, fit: BoxFit.cover)
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                for (var child = 0; child < livestock_reports[index]["last_update_image"].length; child++) Container(
                                  width: 50,
                                  height: 50,
                                  clipBehavior: Clip.hardEdge,
                                  margin: child > 0 ? const EdgeInsets.only(left: 12) : const EdgeInsets.only(left: 0),
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(6))
                                  ),
                                  child: Image.network(livestock_reports[index]["last_update_image"][child], width: 50, height: 50, fit: BoxFit.cover),
                                )
                              ]
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "*Tekan salah satu gambar untuk melihat keseluruhan",
                              style: TextStyle(
                                fontFamily: "Roboto",
                                color: HexColor("#6D7588"),
                                fontSize: 10
                              ),
                            )
                          ]
                        )
                      )
                    ]
                  )
                )
              ]
            )
          ]
        )
      )
    );
  }
}