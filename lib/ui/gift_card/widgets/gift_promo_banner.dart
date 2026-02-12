import 'package:drbills_exchange/config/constants/app_colors.dart';
import 'package:drbills_exchange/config/constants/doubles_config.dart';
import 'package:drbills_exchange/config/constants/text_styles.dart';
import 'package:drbills_exchange/config/extensions/string_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GiftPromoBanner extends StatelessWidget {
  const GiftPromoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: kPadding,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Trade at best rates",
                  style: AppTextStyles.heading1.copyWith(fontSize: 18),
                ),
                const SizedBox(height: 8),
                Text(
                  "Turn your gift cards into instant cash in your wallet at the best rate possible",
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.grey,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          SvgPicture.asset("gift".svg, height: 80, width: 80),
        ],
      ),
    );
  }
}
