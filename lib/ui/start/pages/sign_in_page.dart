import 'package:auto_route/auto_route.dart';
import 'package:drbills_exchange/config/constants/app_colors.dart';
import 'package:drbills_exchange/config/constants/doubles_config.dart';
import 'package:drbills_exchange/config/constants/size_config.dart';
import 'package:drbills_exchange/config/constants/text_styles.dart';
import 'package:drbills_exchange/config/extensions/string_extensions.dart';
import 'package:drbills_exchange/config/widgets/app_buttons.dart';
import 'package:drbills_exchange/config/widgets/custom_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: kPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: drGap(1, context),
            children: [
              Align(alignment: Alignment.centerLeft, child: CustomBack()),
              SizedBox(height: drGap(1, context)),
              Image.asset("icon".png, height: 60, width: 60),
              SizedBox(height: drGap(1, context)),
              Text(
                "Welcome back",
                style: AppTextStyles.heading1.copyWith(fontSize: 20),
              ),
              Center(
                child: Text(
                  "Log in to manage your finances.",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bodyHint.copyWith(fontSize: 14),
                ),
              ),
              SizedBox(height: drGap(4, context)),
              CustomTextField(text: "Email", hint: "Enter your email"),
              PassTextField(text: "Password", hint: "Enter your password"),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    context.router.pushPath("/forgot-pass");
                  },
                  child: Text(
                    "Forgot Password?",
                    style: AppTextStyles.heading1.copyWith(
                      fontSize: 12,
                      color: AppColors.secondary,
                    ),
                  ),
                ),
              ),
              SizedBox(height: drGap(4, context)),
              LongButton(
                text: "Log In",
                onTap: () {
                  context.router.pushPath("/home");
                },
              ),
              SizedBox(height: drGap(1, context)),
              RichText(
                text: TextSpan(
                  text: "Don't have an account? ",
                  style: AppTextStyles.bodyHint.copyWith(fontSize: 14),
                  children: [
                    TextSpan(
                      text: "Sign Up",
                      style: AppTextStyles.heading1.copyWith(
                        fontSize: 14,
                        color: AppColors.secondary,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          context.router.pushPath("/sign-up");
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
