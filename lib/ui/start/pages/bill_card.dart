import 'package:drbills_exchange/config/constants/size_config.dart';
import 'package:drbills_exchange/config/constants/text_styles.dart';
import 'package:flutter/material.dart';

class BillCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const BillCard({
    super.key,
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 105, // Fixed width for uniformity
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: color,
            radius: 22,
            child: Icon(icon, color: Colors.white, size: 20),
          ),
          SizedBox(height: drGap(1, context)),
          Text(
            label,
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyLarge.copyWith(
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
