import 'package:chattie/common/utils/customAssets.dart';
import 'package:chattie/common/utils/custom_color.dart';
import 'package:chattie/common/utils/custom_sizes.dart';
import 'package:chattie/common/utils/styles/custom_text_styles.dart';
import 'package:chattie/common/utils/theme/custom_theme.dart';
import 'package:chattie/common/widgets/rounded_button.dart';
import 'package:chattie/features/login/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "login_screen";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final AuthProvider authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      body: Container(
        decoration:
            BoxDecoration(gradient: CustomTheme.getGredintColor(context)),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SafeArea(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Sizes.instance.spaceBetweenTitles(height: 80),
              Text(
                "Welcome to Chattie",
                style: CustomTextStyles.instance
                    .xLgText(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    )
                    .copyWith(fontSize: 28),
              ),
              Sizes.instance.spaceBetweenTitles(height: 70),
              Image.asset(CustomAssets.loginPage),
              Sizes.instance.spaceBetweenTitles(height: 60),
              Text(
                "Login to Continue",
                style: CustomTextStyles.instance.xLgText(),
              ),
              Sizes.instance.spaceBetweenTitles(height: 30),
              RoundedButton(
                text: "",
                buttonHeight: 45,
                onTap: () async {
                  await authProvider.signInWithGoogle();
                },
                // color: CustomColors.orange,

                prefixIcon: Row(
                  children: [
                    Image.asset(
                      CustomAssets.google,
                      height: 30,
                      width: 30,
                    ),
                    const SizedBox(width: 20),
                    Text(
                      "Sign in with Google",
                      style: CustomTextStyles.instance.normalText(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                // borderColor: ,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
