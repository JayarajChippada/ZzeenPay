import 'package:flutter/material.dart';
import 'package:zzeenpay/common/bottom_bar.dart';
import 'package:zzeenpay/features/auth/screens/auth_screen.dart';
import 'package:zzeenpay/features/auth/screens/forget_password_screen.dart';
import 'package:zzeenpay/features/auth/screens/login_screen.dart';
import 'package:zzeenpay/features/auth/screens/otp_screen.dart';
import 'package:zzeenpay/features/auth/screens/reset_password_screen.dart';
import 'package:zzeenpay/features/home/screens/expenses_screen.dart';
import 'package:zzeenpay/features/services/screens/add_new_card.dart';
import 'package:zzeenpay/features/services/screens/services_screen.dart';
import 'package:zzeenpay/features/splash/screens/welcome_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case WelcomeScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const WelcomeScreen(),
      );

    case SignUpScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const SignUpScreen(),
      );

    case LoginScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const LoginScreen(),
      );

    case ForgetPasswordScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const ForgetPasswordScreen(),
      );

    case OtpScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const OtpScreen(),
      );

    case ResetPasswordScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const ResetPasswordScreen(),
      );

    case MyBottomBar.routeName:
      return MaterialPageRoute(
        builder: (_) => const MyBottomBar(),
      );

    case ExpensesScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const ExpensesScreen(),
      );

    case ServicesScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const ServicesScreen(),
      );

    case AddNewCard.routeName:
      return MaterialPageRoute(
        builder: (_) => const AddNewCard(),
      );


    // case SearchScreen.routeName:
    //   var searchQuery = routeSettings.arguments as String;
    //   return MaterialPageRoute(
    //       settings: routeSettings,
    //       builder: (_) => SearchScreen(
    //             searchQuery: searchQuery,
    //           ));

    

    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen does not exist'),
          ),
        ),
      );
  }
}