import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:hexcolor/hexcolor.dart";
import "package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart";

class TabIndex extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  const TabIndex({super.key,
    required this.navigationShell
  });

  @override
  State<TabIndex> createState() => _TabIndexState();
}

class _TabIndexState extends State<TabIndex> {
  @override
  Widget build(BuildContext context) {
    return PersistentTabView.router(
      onTabChanged: (index) {
        debugPrint("change to tab $index");
      },
      tabs: [
        PersistentRouterTabConfig(
          item: ItemConfig(
            icon: Image.asset("assets/store.png", width: 22, height: 22),
            inactiveIcon: Image.asset("assets/store_outline.png", width: 22, height: 22),
            activeForegroundColor: HexColor("#00AA13"),
            title: "Beranda",
            textStyle: const TextStyle(
              fontFamily: "Roboto",
              fontSize: 11,
              fontWeight: FontWeight.w500
            )
          )
        ),
        PersistentRouterTabConfig(
          item: ItemConfig(
            icon: Image.asset("assets/livestock.png", width: 30, height: 30),
            activeForegroundColor: HexColor("#00AA13"),
            title: "Ternak Saya",
            textStyle: const TextStyle(
              fontFamily: "Roboto",
              fontSize: 11,
              fontWeight: FontWeight.w500,
              height: 0.7
            )
          )
        ),
        PersistentRouterTabConfig(
          item: ItemConfig(
            icon: Image.asset("assets/profile.png", width: 22, height: 22),
            inactiveIcon: Image.asset("assets/profile_outline.png", width: 22, height: 22),
            activeForegroundColor: HexColor("#00AA13"),
            title: "Profile",
            textStyle: const TextStyle(
              fontFamily: "Roboto",
              fontSize: 11,
              fontWeight: FontWeight.w500
            )
          )
        )
      ],
      backgroundColor: Colors.white,
      navBarBuilder: (navBarConfig) => Style13BottomNavBar(
        navBarConfig: navBarConfig,
        navBarDecoration: NavBarDecoration(
          border: Border.all(color: HexColor("#EDEDED"), width: 1)
        )
      ),
      navigationShell: widget.navigationShell
    );
  }
}
