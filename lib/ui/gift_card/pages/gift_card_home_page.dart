import 'package:auto_route/auto_route.dart';
import 'package:drbills_exchange/config/constants/app_colors.dart';
import 'package:drbills_exchange/config/constants/size_config.dart';
import 'package:drbills_exchange/config/constants/text_styles.dart';
import 'package:drbills_exchange/ui/gift_card/widgets/gift_card_grid_tile.dart';
import 'package:drbills_exchange/ui/gift_card/widgets/gift_promo_banner.dart';
import 'package:flutter/material.dart';

@RoutePage()
class GiftCardHomePage extends StatefulWidget {
  const GiftCardHomePage({super.key});

  @override
  State<GiftCardHomePage> createState() => _GiftCardHomePageState();
}

class _GiftCardHomePageState extends State<GiftCardHomePage> {
  int _selectedTypeIndex = 0;
  final List<String> _cardTypes = ["Physical Card", "E-Code Card"];

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
              "Giftcards",
              style: AppTextStyles.heading1.copyWith(fontSize: 28),
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
                  const Icon(Icons.search, color: AppColors.black, size: 24),
                  SizedBox(width: drGap(1.5, context)),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search gift cards",
                        hintStyle: AppTextStyles.bodyHint.copyWith(
                          fontSize: 16,
                        ),
                        border: InputBorder.none,
                        isDense: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: drGap(3, context)),

            // Promo Banner
            GiftPromoBanner(),
            SizedBox(height: drGap(3, context)),

            // Card Type Switcher
            Center(
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: _cardTypes.asMap().entries.map((entry) {
                    int idx = entry.key;
                    String label = entry.value;
                    bool isSelected = _selectedTypeIndex == idx;

                    return GestureDetector(
                      onTap: () => setState(() => _selectedTypeIndex = idx),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          // color: ,
                          borderRadius: BorderRadius.circular(8),
                          gradient: isSelected
                              ? LinearGradient(
                                  colors: [
                                    AppColors.primary,
                                    AppColors.secondary,
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                )
                              : null,
                        ),
                        child: Text(
                          label,
                          style: AppTextStyles.bodyMedium.copyWith(
                            fontWeight: FontWeight.w500,
                            color: isSelected ? Colors.white : AppColors.black,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(height: drGap(3, context)),

            // Gift Card Grid
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 0.85,
              children: const [
                GiftCardGridTile(
                  title: "Apple / iTunes",
                  imagePath: "assets/icons/tether.svg", // Placeholder
                  backgroundColor: Colors.blueAccent,
                ),
                GiftCardGridTile(
                  title: "Macys",
                  imagePath: "assets/icons/tether.svg", // Placeholder
                  backgroundColor: Colors.redAccent,
                ),
                GiftCardGridTile(
                  title: "Macys",
                  imagePath: "assets/icons/tether.svg", // Placeholder
                  backgroundColor: Colors.red,
                ),
                GiftCardGridTile(
                  title: "Apple / iTunes",
                  imagePath: "assets/icons/tether.svg", // Placeholder
                  backgroundColor: Colors.orange,
                ),
              ],
            ),
            SizedBox(height: drGap(2.5, context)),
          ],
        ),
      ),
    );
  }
}
