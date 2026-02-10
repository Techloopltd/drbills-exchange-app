import 'package:amicons/amicons.dart';
import 'package:auto_route/auto_route.dart';
import 'package:drbills_exchange/config/constants/app_colors.dart';
import 'package:drbills_exchange/config/constants/doubles_config.dart';
import 'package:drbills_exchange/config/constants/size_config.dart';
import 'package:drbills_exchange/config/constants/text_styles.dart';
import 'package:flutter/material.dart';

class LongButton extends StatelessWidget {
  const LongButton({super.key, required this.text, this.onTap});

  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: drWidth(context),
        height: drBox(50, context),
        padding: kPadding,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: kBigBorderRadius,
          gradient: LinearGradient(
            colors: [
              AppColors.primary,
              AppColors.secondary,
              AppColors.tertiary,
            ],
          ),
        ),
        child: Text(text, style: AppTextStyles.button),
      ),
    );
  }
}

class CustomBack extends StatelessWidget {
  const CustomBack({super.key, this.color, this.onTap});

  final Color? color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () => context.router.pop(),
      child: CircleAvatar(
        radius: 24,
        backgroundColor: color ?? AppColors.background,
        child: Icon(Amicons.lucide_arrow_left, color: AppColors.black),
      ),
    );
  }
}
