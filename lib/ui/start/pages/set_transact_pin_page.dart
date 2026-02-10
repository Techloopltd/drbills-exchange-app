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
class SetTransactPinPage extends StatelessWidget {
  const SetTransactPinPage({super.key});

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
              // Align(alignment: Alignment.centerLeft, child: CustomBack()),
              SizedBox(height: drGap(1, context)),
              Image.asset("icon".png, height: 60, width: 60),
              SizedBox(height: drGap(1, context)),
              Text(
                "Set Transaction Pin",
                style: AppTextStyles.heading1.copyWith(fontSize: 20),
              ),
              Center(
                child: Text(
                  "Enter a 4 digit pin you will be using for your transactions",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bodyHint.copyWith(fontSize: 14),
                ),
              ),
              SizedBox(height: drGap(4, context)),
              PinBox(onChanged: (e) {}),
              Spacer(),
              LongButton(text: "Next", onTap: () {}),
              SizedBox(height: drGap(1, context)),
            ],
          ),
        ),
      ),
    );
  }
}

@RoutePage()
class CompleteTransactPinPage extends StatelessWidget {
  const CompleteTransactPinPage({super.key});

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
              // Align(alignment: Alignment.centerLeft, child: CustomBack()),
              SizedBox(height: drGap(1, context)),
              Image.asset("icon".png, height: 60, width: 60),
              SizedBox(height: drGap(1, context)),
              Text(
                "Set Transaction Pin",
                style: AppTextStyles.heading1.copyWith(fontSize: 20),
              ),
              Center(
                child: Text(
                  "Enter a 4 digit pin you will be using for your transactions",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bodyHint.copyWith(fontSize: 14),
                ),
              ),
              SizedBox(height: drGap(4, context)),
              PinBox(onChanged: (e) {}),
              Spacer(),
              LongButton(
                text: "Next",
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
