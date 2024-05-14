// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
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
    return CupertinoApp.router(
      title: "Sangkar App",
      debugShowCheckedModeBanner: false,
      routerConfig: AppNavigator.router,
      localizationsDelegates: [
        DefaultMaterialLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ]
    );
  }
}
