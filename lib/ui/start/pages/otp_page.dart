import 'package:auto_route/auto_route.dart';
import 'package:drbills_exchange/config/constants/app_colors.dart';
import 'package:drbills_exchange/config/constants/doubles_config.dart';
import 'package:drbills_exchange/config/constants/size_config.dart';
import 'package:drbills_exchange/config/constants/text_styles.dart';
import 'package:drbills_exchange/config/extensions/string_extensions.dart';
import 'package:drbills_exchange/config/widgets/app_buttons.dart';
import 'package:drbills_exchange/config/widgets/pin_box.dart';
import 'package:flutter/material.dart';

@RoutePage()
class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
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
                "Please Check Your Email",
                style: AppTextStyles.heading1.copyWith(fontSize: 20),
              ),
              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "A code has been sent to",
                    style: AppTextStyles.bodyHint.copyWith(fontSize: 14),
                    children: [
                      TextSpan(
                        text: " Davidmat22@gmail.com",
                        style: AppTextStyles.heading1.copyWith(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: drGap(4, context)),
              PinBox(onChanged: (e) {}),
              SizedBox(height: drGap(8, context)),
              LongButton(
                text: "Verify",
                onTap: () {
                  context.router.pushPath("/reset-password");
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
