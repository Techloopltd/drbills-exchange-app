import 'package:drbills_exchange/config/constants/app_colors.dart';
import 'package:drbills_exchange/config/constants/text_styles.dart';
import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title, style: AppTextStyles.heading1.copyWith(fontSize: 18));
  }
}

class CryptoListTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String name;
  final String fiatValue;

  const CryptoListTile({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.name,
    required this.fiatValue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: iconColor, shape: BoxShape.circle),
            child: Icon(icon, color: Colors.white, size: 20),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: AppTextStyles.heading1.copyWith(fontSize: 14)),
              const SizedBox(height: 4),
              Text(
                fiatValue,
                style: AppTextStyles.bodyHint.copyWith(fontSize: 12),
              ),
            ],
          ),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios, size: 20, color: AppColors.black),
        ],
      ),
    );
  }
}
