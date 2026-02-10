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
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool value = false;
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
              SizedBox(height: drGap(1, context)),
              Image.asset("icon".png, height: 60, width: 60),
              SizedBox(height: drGap(1, context)),
              Text(
                "Sign Up",
                style: AppTextStyles.heading1.copyWith(fontSize: 20),
              ),
              Center(
                child: Text(
                  "Fill information below to create an account",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bodyHint.copyWith(fontSize: 14),
                ),
              ),
              SizedBox(height: drGap(1, context)),
              CustomTextField(text: "Full Name", hint: "Enter your full name"),
              CustomTextField(text: "Email", hint: "Enter your email"),
              CustomTextField(
                text: "Phone Number",
                hint: "Enter your phone number",
              ),
              PassTextField(text: "Password", hint: "Enter your password"),
              Align(
                alignment: Alignment.centerLeft,
                child: CheckboxListTile(
                  value: value,
                  visualDensity: VisualDensity.compact,
                  contentPadding: EdgeInsets.zero,
                  controlAffinity: ListTileControlAffinity.leading,
                  onChanged: (s) {
                    setState(() {
                      value = s ?? false;
                    });
                  },
                  title: RichText(
                    text: TextSpan(
                      text: "I agree to the ",
                      style: AppTextStyles.bodyHint.copyWith(fontSize: 14),
                      children: [
                        TextSpan(
                          text: "Terms ",
                          style: AppTextStyles.heading1.copyWith(fontSize: 16),
                        ),
                        TextSpan(
                          text: "& ",
                          style: AppTextStyles.bodyHint.copyWith(fontSize: 14),
                        ),
                        TextSpan(
                          text: "Privacy Policy",
                          style: AppTextStyles.heading1.copyWith(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: drGap(1, context)),
              LongButton(
                text: "Sign Up",
                onTap: () {
                  context.router.pushPath("/set-transact-pin");
                },
              ),

              RichText(
                text: TextSpan(
                  text: "Already have an account? ",
                  style: AppTextStyles.bodyHint.copyWith(fontSize: 14),
                  children: [
                    TextSpan(
                      text: "Log In",
                      style: AppTextStyles.heading1.copyWith(fontSize: 14),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          context.router.pushPath("/sign-in");
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
