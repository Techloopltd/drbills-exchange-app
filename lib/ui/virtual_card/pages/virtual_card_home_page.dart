import 'package:auto_route/auto_route.dart';
import 'package:drbills_exchange/config/constants/size_config.dart';
import 'package:drbills_exchange/config/constants/text_styles.dart';
import 'package:drbills_exchange/config/extensions/string_extensions.dart';
import 'package:drbills_exchange/config/widgets/app_buttons.dart';
import 'package:flutter/material.dart';

@RoutePage()
class VirtualCardHomePage extends StatelessWidget {
  const VirtualCardHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: drGap(2.5, context),
          vertical: drGap(2.5, context),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Cards", style: AppTextStyles.heading1.copyWith(fontSize: 28)),
            SizedBox(height: drGap(8, context)),

            Center(
              child: Image.asset(
                "virtual-cards".png,
                height: drBox(224, context),
              ),
            ),
            SizedBox(height: drGap(10, context)),
            // Information Section
            Center(
              child: Column(
                children: [
                  Text(
                    "Virtual USD Card",
                    style: AppTextStyles.heading1.copyWith(fontSize: 24),
                  ),
                  SizedBox(height: drGap(1, context)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Secure virtual dollar card for online payments, subscriptions, and international purchases",
                      textAlign: TextAlign.center,
                      style: AppTextStyles.bodyHint.copyWith(
                        fontSize: 14,
                        height: 1.5,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: drGap(6, context)),
            LongButton(text: "Create card", onTap: () {}),
          ],
        ),
      ),
    );
  }
}
