// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sangkar/utils/function.dart';
import 'package:shimmer/shimmer.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  Map<String, dynamic> data = {
    "name": "Kambing Peternakan Berstandar: Jaminan Kualitas",
    "description": "Lorem ipsum, atau ringkasnya lipsum, adalah teks standar yang ditempatkan untuk mendemostrasikan elemen grafis atau presentasi visual seperti font, tipografi, dan tata letak.",
    "image": "https://media.philstar.com/photos/2023/01/29/web-year-goat-pixabay-fitmum_2023-01-29_14-13-27.jpg",
    "price": 3500000
  };

  dynamic selectedType;

  List<Map<String, dynamic>> types = [
    {
      "label": "Ternakan",
      "value": 1
    },
    {
      "label": "Qurbankan",
      "value": 2
    },
    {
      "label": "Aqiqahkan",
      "value": 3
    }
  ];

  Object _goCheckout() {
    if (selectedType != null) return context.pushNamed("Checkout");

    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Pilih tujuan pembelian terlebih dahulu",
          style: TextStyle(
            fontFamily: "Roboto",
            fontWeight: FontWeight.w700,
            color: Colors.white,
            fontSize: 12
          )
        ),
        backgroundColor: Colors.red,
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          backgroundColor: HexColor("#00AA13"),
          automaticallyImplyLeading: false
        )
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              color: HexColor("#00AA13"),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset("assets/arrow_back.png", width: 28, height: 28)
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      data["name"],
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: "Roboto",
                        color: HexColor("#FFFFFF"),
                        fontWeight: FontWeight.w700,
                        fontSize: 15
                      )
                    )
                  )
                ]
              )
            ),
            SingleChildScrollView(
              child: Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 260,
                      child: Image.network(
                        data["image"],
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Shimmer.fromColors(
                            baseColor: Colors.grey.shade300,
                            highlightColor: HexColor("#00AA13").withOpacity(0.5),
                            child: Container(width: double.infinity, height: double.infinity, color: Colors.white)
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: double.infinity,
                            height: double.infinity,
                            color: Colors.grey.shade300,
                            child: Center(
                              widthFactor: 44,
                              heightFactor: 44,
                              child: Image.asset("assets/image_broken.png", width: 44, height: 44)
                            )
                          );
                        }
                      )
                    ),
                    Container(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            transformPrice(data["price"]),
                            style: TextStyle(
                              fontFamily: "Roboto",
                              color: HexColor("#00AA13"),
                              fontWeight: FontWeight.w700,
                              fontSize: 24
                            )
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "Deskripsi",
                            style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 14,
                              color: HexColor("#292929"),
                              fontWeight: FontWeight.w600
                            )
                          ),
                          const SizedBox(height: 8),
                          Text(
                            data["description"],
                            style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 12,
                              color: HexColor("#9CA3AF"),
                              fontWeight: FontWeight.w400
                            )
                          ),
                          const SizedBox(height: 40),
                          Row(
                            children: [
                              for (var index = 0; index < types.length; index++) Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedType = types[index]["value"];
                                    });
                                  },
                                  child: Container(
                                    margin: index == 0 ? const EdgeInsets.only(left: 0) : const EdgeInsets.only(left: 8),
                                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 1, color: HexColor("#00AA13")),
                                      borderRadius: const BorderRadius.all(Radius.circular(6)),
                                      color: HexColor("#00AA13").withOpacity(0.05)
                                    ),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Transform.scale(
                                          scale: 0.8,
                                          child: Radio(
                                            visualDensity: const VisualDensity(
                                              horizontal: VisualDensity.minimumDensity,
                                              vertical: VisualDensity.minimumDensity,
                                            ),
                                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                            fillColor: MaterialStateColor.resolveWith((states) => HexColor("#00AA13")),
                                            activeColor: HexColor("#00AA13"),
                                            value: types[index]["value"],
                                            groupValue: selectedType,
                                            onChanged: (value) {
                                              setState(() {
                                                selectedType = value;
                                              });
                                            }
                                          )
                                        ),
                                        const SizedBox(width: 3),
                                        Expanded(child: Text(
                                          types[index]["label"],
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontFamily: "Roboto",
                                            color: HexColor("#00AA13"),
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12
                                          )
                                        ))
                                      ]
                                    )
                                  )
                                )
                              )
                            ]
                          ),
                          const SizedBox(height: 15),
                          GestureDetector(
                            onTap: () => _goCheckout(),
                            child: Container(
                              width: double.infinity,
                              height: 40,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: HexColor("#00AA13"),
                                border: Border.all(color: HexColor("#00AA13"), width: 1),
                                borderRadius: const BorderRadius.all(Radius.circular(6))
                              ),
                              child: const Text(
                                "Beli",
                                style: TextStyle(
                                  fontFamily: "Roboto",
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16
                                )
                              )
                            )
                          )
                        ]
                      )
                    )
                  ]
                )
              )
            )
          ]
        )
      )
    );
  }
}