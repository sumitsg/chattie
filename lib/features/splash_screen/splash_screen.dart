import 'package:chattie/common/utils/customAssets.dart';
import 'package:chattie/common/utils/custom_color.dart';
import 'package:chattie/common/utils/custom_sizes.dart';
import 'package:chattie/common/utils/styles/custom_text_styles.dart';
import 'package:chattie/common/utils/theme/custom_theme.dart';
import 'package:chattie/features/login/screens/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "/";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkSingInStatus();
  }

  checkSingInStatus() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        return Navigator.pushReplacementNamed(context, LoginScreen.routeName);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:
            BoxDecoration(gradient: CustomTheme.getGredintColor(context)),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome to Chattie",
                style: CustomTextStyles.instance.lgText(
                  color: CustomColors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Image.asset(
                CustomAssets.splash,
                width: 400,
                height: 400,
              ),
              Text(
                "A Simple Chat Application",
                style: CustomTextStyles.instance.lgText(
                  color: CustomColors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const CircularProgressIndicator(
                color: Colors.redAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
