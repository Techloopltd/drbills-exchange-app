import 'package:auto_route/auto_route.dart';
import 'package:drbills_exchange/config/constants/doubles_config.dart';
import 'package:drbills_exchange/config/constants/size_config.dart';
import 'package:drbills_exchange/config/constants/text_styles.dart';
import 'package:drbills_exchange/config/extensions/string_extensions.dart';
import 'package:drbills_exchange/config/widgets/app_buttons.dart';
import 'package:drbills_exchange/config/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: kPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: drGap(1, context),
            children: [
              Align(alignment: Alignment.centerLeft, child: CustomBack()),
              SizedBox(height: drGap(1, context)),
              Image.asset("icon".png, height: 60, width: 60),
              SizedBox(height: drGap(1, context)),
              Text(
                "Reset Password",
                style: AppTextStyles.heading1.copyWith(fontSize: 20),
              ),
              Center(
                child: Text(
                  "Kindly type in something you will remember",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bodyHint.copyWith(fontSize: 14),
                ),
              ),
              SizedBox(height: drGap(4, context)),
              PassTextField(
                text: "New Password",
                hint: "Enter your new password",
              ),
              PassTextField(
                text: "Confirm Password",
                hint: "Confirm your new password",
              ),
              SizedBox(height: drGap(3, context)),
              LongButton(
                text: "Reset Password",
                onTap: () {
                  context.router.pushPath("/sign-in");
                },
              ),
              SizedBox(height: drGap(1, context)),
            ],
          ),
        ),
      ),
    );
  }
}
