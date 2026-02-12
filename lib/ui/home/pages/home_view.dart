import 'package:auto_route/auto_route.dart';
import 'package:drbills_exchange/config/constants/size_config.dart';
import 'package:drbills_exchange/ui/home/widgets/balance_card.dart';
import 'package:drbills_exchange/ui/home/widgets/crypto_list_tile.dart';
import 'package:drbills_exchange/ui/home/widgets/header_section.dart';
import 'package:drbills_exchange/ui/home/widgets/kyc_banner.dart';
import 'package:drbills_exchange/ui/start/pages/bill_card.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomeViewPage extends StatelessWidget {
  const HomeViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Header Section
            const HeaderSection(),
            SizedBox(height: drGap(4, context)),

            // 2. Main Balance Card
            const BalanceCard(),
            SizedBox(height: drGap(4, context)),

            // 3. KYC Banner
            const KycBanner(),
            SizedBox(height: drGap(4, context)),

            // 4. Crypto Assets List
            const SectionTitle(title: "Crypto assets"),
            const SizedBox(height: 10),
            CryptoListTile(
              icon: "btc",
              name: "0.023455 BTC",
              fiatValue: "₦700,000",
            ),
            CryptoListTile(icon: "trx", name: "0.00 TRX", fiatValue: "₦0.00"),
            CryptoListTile(icon: "sol", name: "0.00 SOL", fiatValue: "₦0.00"),
            CryptoListTile(
              icon: "tether",
              name: "0.00 USDT",
              fiatValue: "₦0.00",
            ),
            SizedBox(height: drGap(4, context)),

            // 5. Bills Section
            const SectionTitle(title: "Bills"),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BillCard(
                  icon: Icons.phone_android,
                  label: "Airtime or Data",
                  color: Colors.lightBlue,
                ),
                BillCard(
                  icon: Icons.lightbulb_outline,
                  label: "Electricity",
                  color: Colors.redAccent,
                ),
                BillCard(
                  icon: Icons.tv,
                  label: "Cable TV",
                  color: Colors.indigo,
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
