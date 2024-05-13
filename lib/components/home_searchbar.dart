import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeSearchBar extends StatefulWidget {
  const HomeSearchBar({super.key});

  @override
  State<HomeSearchBar> createState() => _HomeSearchBarState();
}

class _HomeSearchBarState extends State<HomeSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: HexColor("#00AA13"),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        children: [
          Expanded(child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(6))
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/search.png", width: 18, height: 18),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      hintText: "Cari di Sangkar",
                      hintStyle: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 14,
                        color: Colors.black12,
                      ),
                      isDense: true,
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(bottom: 2)
                    ),
                    style: TextStyle(
                      fontFamily: "Roboto",
                      fontSize: 14,
                      color: HexColor("#292929")
                    ),
                    onTapOutside: (event) {
                      FocusScope.of(context).unfocus();
                    }
                  )
                )
              ]
            )
          )),
          const SizedBox(width: 12),
          GestureDetector(
            onTap: () {
              debugPrint("open notification");
            },
            child: Image.asset("assets/notification.png", width: 22, height: 22),
          )
        ]
      )
    );
  }
}