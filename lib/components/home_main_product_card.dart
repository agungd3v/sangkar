// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sangkar/utils/function.dart';
import 'package:shimmer/shimmer.dart';

class HomeMainProductCard extends StatefulWidget {
  Map<String, dynamic> item;

  HomeMainProductCard({super.key,
    required this.item
  });

  @override
  State<HomeMainProductCard> createState() => _HomeMainProductCardState();
}

class _HomeMainProductCardState extends State<HomeMainProductCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
      child: GestureDetector(
        onTap: () {
          context.pushNamed("Detail");
        },
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(6)),
            boxShadow: [
              BoxShadow(
                color: HexColor("#9CA3AF").withOpacity(0.3),
                spreadRadius: 0.3,
                blurRadius: 0.8,
                offset: const Offset(0, 1)
              )
            ]
          ),
          child: Column(
            children: [
              Image.network(
                widget.item["image"],
                width: double.infinity,
                height: 140,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: HexColor("#00AA13").withOpacity(0.5),
                    child: Container(width: double.infinity, height: 140, color: Colors.white)
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: double.infinity,
                    height: 140,
                    color: Colors.grey.shade300,
                    child: Center(
                      widthFactor: 34,
                      heightFactor: 34,
                      child: Image.asset("assets/image_broken.png", width: 34, height: 34)
                    ),
                  );
                }
              ),
              Container(
                height: MediaQuery.of(context).size.aspectRatio + 80,
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: Text(
                      widget.item["label"],
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: HexColor("#292929")
                      )
                    )),
                    Text(
                      transformPrice(widget.item["price"]),
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: HexColor("#00AA13")
                      )
                    )
                  ]
                )
              )
            ]
          )
        )
      )
    );
  }
}