// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sangkar/routes/tab_index.dart';
import 'package:sangkar/screens/checkout.dart';
import 'package:sangkar/screens/detail.dart';
import 'package:sangkar/screens/home.dart';
import 'package:sangkar/screens/livestock.dart';
import 'package:sangkar/screens/payment.dart';
import 'package:sangkar/screens/profile.dart';

class AppNavigator {
  AppNavigator._();

  static String initRoute = "/home";

  static final _rootKey = GlobalKey<NavigatorState>();
  static final _rootKeyHome = GlobalKey<NavigatorState>(debugLabel: "shellHome");
  static final _rootKeyLivestock = GlobalKey<NavigatorState>(debugLabel: "shellLivestock");
  static final _rootKeyProfile = GlobalKey<NavigatorState>(debugLabel: "shellProfile");

  static final GoRouter router = GoRouter(
    initialLocation: initRoute,
    navigatorKey: _rootKey,
    debugLogDiagnostics: true,
    routes: [
      StatefulShellRoute.indexedStack(
        pageBuilder: (context, state, navigationShell) => CustomTransitionPage(
          child: TabIndex(navigationShell: navigationShell),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(begin: Offset(-1, 0), end: Offset.zero).animate(CurvedAnimation(parent: animation, curve: Curves.easeInSine)),
              transformHitTests: true,
              child: child,
            );
          }
        ),
        // builder: (context, state, navigationShell) {
        //   return TabIndex(navigationShell: navigationShell);
        // },
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            navigatorKey: _rootKeyHome,
            routes: <RouteBase>[
              GoRoute(
                path: "/home",
                name: "Home",
                builder: (BuildContext context, GoRouterState state) {
                  return HomeScreen();
                }
              )
            ]
          ),
          StatefulShellBranch(
            navigatorKey: _rootKeyLivestock,
            routes: <RouteBase>[
              GoRoute(
                path: "/livestock",
                name: "Livestock",
                builder: (BuildContext context, GoRouterState state) {
                  return LiveStockScreen();
                }
              )
            ]
          ),
          StatefulShellBranch(
            navigatorKey: _rootKeyProfile,
            routes: <RouteBase>[
              GoRoute(
                path: "/profile",
                name: "Profile",
                builder: (BuildContext context, GoRouterState state) {
                  return ProfileScreen();
                }
              )
            ]
          )
        ]
      ),
      GoRoute(
        parentNavigatorKey: _rootKey,
        path: "/detail",
        name: "Detail",
        builder: (BuildContext context, GoRouterState state) {
          return DetailScreen(key: state.pageKey);
        }
        // pageBuilder: (context, state) => CustomTransitionPage(
        //   key: state.pageKey,
        //   child: DetailScreen(key: state.pageKey),
        //   transitionsBuilder: (context, animation, secondaryAnimation, child) {
        //     return SlideTransition(
        //       position: Tween<Offset>(begin: Offset(1, 0), end: Offset.zero).animate(CurvedAnimation(parent: animation, curve: Curves.fastOutSlowIn)),
        //       transformHitTests: true,
        //       child: child
        //     );
        //   }
        // )
      ),
      GoRoute(
        parentNavigatorKey: _rootKey,
        path: "/checkout",
        name: "Checkout",
        builder: (BuildContext context, GoRouterState state) {
          return CheckoutScreen(key: state.pageKey);
        }
      ),
      GoRoute(
        parentNavigatorKey: _rootKey,
        path: "/payment",
        name: "Payment",
        builder: (BuildContext context, GoRouterState state) {
          return PaymentScreen(key: state.pageKey);
        }
      ),
    ]
  );
}
