import 'package:auto_route/auto_route.dart';
import 'package:drbills_exchange/config/constants/app_colors.dart';
import 'package:drbills_exchange/config/constants/size_config.dart';
import 'package:drbills_exchange/config/constants/text_styles.dart';
import 'package:drbills_exchange/ui/crypto/widgets/crypto_balance_card.dart';
import 'package:drbills_exchange/ui/home/widgets/crypto_list_tile.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CryptoHomePage extends StatelessWidget {
  const CryptoHomePage({super.key});

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
            Text(
              "Crypto Wallet",
              style: AppTextStyles.heading1.copyWith(fontSize: 24),
            ),
            SizedBox(height: drGap(2.5, context)),
            // Search Bar
            Container(
              height: 56,
              padding: EdgeInsets.symmetric(horizontal: drGap(2, context)),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.border),
              ),
              child: Row(
                children: [
                  const Icon(Icons.search, color: AppColors.grey),
                  SizedBox(width: drGap(1.5, context)),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search crypto assets",
                        hintStyle: AppTextStyles.bodyHint,
                        border: InputBorder.none,
                        isDense: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: drGap(3, context)),
            const CryptoBalanceCard(),
            SizedBox(height: drGap(3, context)),
            const SectionTitle(title: "Crypto assets"),
            SizedBox(height: drGap(2, context)),
            const CryptoListTile(
              icon: "btc",
              name: "0.023455 BTC",
              fiatValue: "₦700,000",
            ),
            const CryptoListTile(
              icon: "trx",
              name: "0.00 TRX",
              fiatValue: "₦0.00",
            ),
            const CryptoListTile(
              icon: "sol",
              name: "0.00 SOL",
              fiatValue: "₦0.00",
            ),
            const CryptoListTile(
              icon: 'tether',
              name: "0.00 USDT",
              fiatValue: "₦0.00",
            ),
            SizedBox(height: drGap(2.5, context)),
          ],
        ),
      ),
    );
  }
}
