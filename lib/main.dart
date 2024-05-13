// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sangkar/app_navigator.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sangkar/provider/payment_provider.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (create) => PaymentProvider())
      ],
      builder: (context, child) {
        initializeDateFormatting();
        return MyApp();
      }
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Sangkar App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        // colorScheme: ColorScheme.fromSeed(seedColor: HexColor("#FFFFFF")),
        scaffoldBackgroundColor: Colors.white
      ),
      routerConfig: AppNavigator.router,
    );
  }
}
