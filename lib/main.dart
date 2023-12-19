import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zzeenpay/constants/global_variables.dart';
import 'package:zzeenpay/constants/utils.dart';
import 'package:zzeenpay/features/splash/screens/splash_screen.dart';
import 'package:zzeenpay/providers/card_provider.dart';
import 'package:zzeenpay/routes.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CardProvider(),
      child: const MyApp(),
    )
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: rootScaffoldMessengerKey,
      debugShowCheckedModeBanner: false,
      title: 'ZZeenPay',
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
      ),
      onGenerateRoute: ((settings) => generateRoute(settings)),
      home: const SplashScreen(),
    );
  }
}
