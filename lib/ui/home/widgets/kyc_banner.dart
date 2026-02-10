import 'package:drbills_exchange/config/constants/app_colors.dart';
import 'package:drbills_exchange/config/constants/size_config.dart';
import 'package:drbills_exchange/config/constants/text_styles.dart';
import 'package:flutter/material.dart';

class KycBanner extends StatelessWidget {
  const KycBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            AppColors.tertiary,
            AppColors.primary,
            AppColors.secondary,
          ], // Blue gradient
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Complete your kyc set up",
                  style: AppTextStyles.heading1.copyWith(
                    fontSize: 14,
                    color: AppColors.white,
                  ),
                ),
                SizedBox(height: drGap(0.5, context)),
                Text(
                  "Verify your identity to unlock full access and keep your account secure.",
                  style: AppTextStyles.bodyHint.copyWith(
                    fontSize: 12,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: drSpace(2, context)),
          Container(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              "Get Started",
              style: AppTextStyles.heading1.copyWith(
                fontSize: 10,
                color: AppColors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
