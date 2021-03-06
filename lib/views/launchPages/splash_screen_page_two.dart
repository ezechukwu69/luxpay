import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:luxpay/utils/constants.dart';
import 'package:luxpay/views/authPages/login_page.dart';
import 'package:luxpay/views/launchPages/welcome_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenTwo extends StatefulWidget {
  static const String path = "/splash";
  const SplashScreenTwo({Key? key}) : super(key: key);

  @override
  State<SplashScreenTwo> createState() => _SplashScreenTwoState();
}

class _SplashScreenTwoState extends State<SplashScreenTwo> {
  @override
  void initState() {
    super.initState();
    openNextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
          SafeArea(child: Center(child: Image.asset("assets/moreToLife.png"))),
    );
  }

  Future<void> openNextPage() async {
    await Future.delayed(const Duration(seconds: 1));
    var prefs = await SharedPreferences.getInstance();
    if (await prefs.getString(authToken) == null) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(WelcomePage.path, (route) => false);
    } else {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(LoginPage.path, (route) => false);
    }
  }
}
