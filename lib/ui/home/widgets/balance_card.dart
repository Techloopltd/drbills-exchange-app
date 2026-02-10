import 'package:drbills_exchange/config/constants/app_colors.dart';
import 'package:drbills_exchange/config/constants/text_styles.dart';
import 'package:flutter/material.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          // Currency Selector
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.grey.withValues(alpha: .15),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(
                  Icons.flag,
                  color: Colors.green,
                  size: 16,
                ), // Use a real image asset for Nigeria flag
                SizedBox(width: 5),
                Text(
                  "NGN",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),
                Icon(Icons.keyboard_arrow_down, size: 16),
              ],
            ),
          ),
          const SizedBox(height: 15),

          // Balance Text
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                "₦700,000",
                style: AppTextStyles.heading1.copyWith(fontSize: 24),
              ),
              Text(
                ".00",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.grey.withValues(alpha: .5),
                ),
              ),
              const SizedBox(width: 10),
              const Icon(
                Icons.visibility_outlined,
                color: AppColors.grey,
                size: 20,
              ),
            ],
          ),
          const SizedBox(height: 25),

          // Action Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              ActionButton(icon: Icons.add, label: "Deposit"),
              ActionButton(icon: Icons.north_east, label: "Withdraw"),
              ActionButton(icon: Icons.sync, label: "Convert"),
            ],
          ),
        ],
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const ActionButton({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Icon(icon, size: 20, color: AppColors.black),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: AppTextStyles.bodyLarge.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
