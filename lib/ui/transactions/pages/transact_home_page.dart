import 'package:auto_route/auto_route.dart';
import 'package:drbills_exchange/config/constants/app_colors.dart';
import 'package:drbills_exchange/config/constants/size_config.dart';
import 'package:drbills_exchange/config/constants/text_styles.dart';
import 'package:drbills_exchange/ui/transactions/widgets/transaction_list_tile.dart';
import 'package:flutter/material.dart';

@RoutePage()
class TransactHomePage extends StatefulWidget {
  const TransactHomePage({super.key});

  @override
  State<TransactHomePage> createState() => _TransactHomePageState();
}

class _TransactHomePageState extends State<TransactHomePage> {
  int _selectedTabIndex = 0;
  final List<String> _tabs = ["Fiat", "Bills", "Crypto", "Gift cards"];

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
              "Transactions",
              style: AppTextStyles.heading1.copyWith(fontSize: 28),
            ),
            SizedBox(height: drGap(3, context)),

            // Tab Switcher
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: _tabs.asMap().entries.map((entry) {
                  int idx = entry.key;
                  String label = entry.value;
                  bool isSelected = _selectedTabIndex == idx;

                  return Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => _selectedTabIndex = idx),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          gradient: isSelected
                              ? LinearGradient(
                                  colors: [
                                    AppColors.primary,
                                    AppColors.secondary,
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                )
                              : null,
                        ),
                        child: Center(
                          child: Text(
                            label,
                            style: AppTextStyles.bodyMedium.copyWith(
                              fontWeight: FontWeight.w500,
                              color: isSelected ? Colors.white : AppColors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: drGap(2, context)),

            // Filter Dropdown
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.border),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "All",
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Icon(Icons.keyboard_arrow_down, color: AppColors.black),
                ],
              ),
            ),
            SizedBox(height: drGap(3, context)),

            // Date Header
            Text(
              "Today",
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: drGap(2, context)),

            // Transactions List
            TransactionListTile(
              title: "Deposit",
              date: "26 Jan, 2026",
              amount: "+₦102,000",
              status: TransactionStatus.completed,
              icon: Icons.south_west,
              iconBackgroundColor: const Color(0xFFE8F5E9),
              iconColor: AppColors.green,
            ),
            TransactionListTile(
              title: "Withdraw",
              date: "26 Jan, 2026",
              amount: "-₦12,000",
              status: TransactionStatus.pending,
              icon: Icons.access_time_filled_rounded,
              iconBackgroundColor: const Color(0xFFFFF8E1),
              iconColor: Colors.orange,
            ),
            TransactionListTile(
              title: "Withdraw",
              date: "26 Jan, 2026",
              amount: "-₦10,000",
              status: TransactionStatus.failed,
              icon: Icons.north_east_rounded,
              iconBackgroundColor: const Color(0xFFFFEBEE),
              iconColor: AppColors.error,
            ),
            SizedBox(height: drGap(2.5, context)),
          ],
        ),
      ),
    );
  }
}
