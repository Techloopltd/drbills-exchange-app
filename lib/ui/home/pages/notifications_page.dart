import 'package:auto_route/auto_route.dart';
import 'package:drbills_exchange/config/constants/app_colors.dart';
import 'package:drbills_exchange/config/constants/text_styles.dart';
import 'package:flutter/material.dart';

@RoutePage()
class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F5F7), // Light grey background
      body: SafeArea(
        child: Column(
          children: [
            // 1. Custom Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildCircleButton(Icons.arrow_back_ios_new_rounded, () {
                    // Navigator.pop(context);
                  }),
                  Text(
                    "Notifications",
                    style: AppTextStyles.heading1.copyWith(fontSize: 18),
                  ),
                  _buildCircleButton(Icons.more_horiz, () {}),
                ],
              ),
            ),

            // 2. Scrollable List of Notifications
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // --- Today Section ---
                    const SectionHeader(title: "Today"),

                    // Item 1: Unread Deposit
                    NotificationCard(
                      isUnread: true,
                      isDeposit: true,
                      time: "1hr ago",
                      content: RichText(
                        text: TextSpan(
                          style: AppTextStyles.bodyMedium.copyWith(
                            fontSize: 14,
                          ),
                          children: [
                            TextSpan(text: "Deposited "),
                            TextSpan(
                              text: "₦100,000",
                              style: AppTextStyles.heading1.copyWith(
                                fontSize: 14,
                              ),
                            ),
                            TextSpan(text: " into your NGN wallet"),
                          ],
                        ),
                      ),
                    ),

                    // Item 2: Sold
                    NotificationCard(
                      isUnread: false,
                      isDeposit: false,
                      time: "1hr ago",
                      content: RichText(
                        text: TextSpan(
                          style: AppTextStyles.bodyMedium.copyWith(
                            fontSize: 14,
                          ),
                          children: [
                            TextSpan(text: "You just sold "),
                            TextSpan(
                              text: "0.004565BTC",
                              style: AppTextStyles.heading1.copyWith(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),

                    // --- Yesterday Section ---
                    const SectionHeader(title: "Yesterday"),

                    NotificationCard(
                      isDeposit: true,
                      time: "1hr ago",
                      content: RichText(
                        text: TextSpan(
                          style: AppTextStyles.bodyMedium.copyWith(
                            fontSize: 14,
                          ),
                          children: [
                            TextSpan(text: "Deposited "),
                            TextSpan(
                              text: "₦100,000",
                              style: AppTextStyles.heading1.copyWith(
                                fontSize: 14,
                              ),
                            ),
                            TextSpan(text: " into your NGN wallet"),
                          ],
                        ),
                      ),
                    ),

                    NotificationCard(
                      isDeposit: false,
                      time: "1hr ago",
                      content: RichText(
                        text: TextSpan(
                          style: AppTextStyles.bodyMedium.copyWith(
                            fontSize: 14,
                          ),
                          children: [
                            TextSpan(text: "You just sold "),
                            TextSpan(
                              text: "0.004565BTC",
                              style: AppTextStyles.heading1.copyWith(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),

                    // --- Earlier Section ---
                    const SectionHeader(title: "Earlier"),

                    NotificationCard(
                      isDeposit: true,
                      time: "1hr ago",
                      content: RichText(
                        text: TextSpan(
                          style: AppTextStyles.bodyMedium.copyWith(
                            fontSize: 14,
                          ),
                          children: [
                            TextSpan(text: "Deposited "),
                            TextSpan(
                              text: "₦100,000",
                              style: AppTextStyles.heading1.copyWith(
                                fontSize: 14,
                              ),
                            ),
                            TextSpan(text: " into your NGN wallet"),
                          ],
                        ),
                      ),
                    ),

                    NotificationCard(
                      isDeposit: false,
                      time: "1hr ago",
                      content: RichText(
                        text: TextSpan(
                          style: AppTextStyles.bodyMedium.copyWith(
                            fontSize: 14,
                          ),
                          children: [
                            TextSpan(text: "You just sold "),
                            TextSpan(
                              text: "0.004565BTC",
                              style: AppTextStyles.heading1.copyWith(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCircleButton(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: CircleAvatar(
        backgroundColor: AppColors.white,
        radius: 22,
        child: Icon(icon, size: 20, color: AppColors.black),
      ),
    );
  }
}

// --- REUSABLE WIDGETS ---

class SectionHeader extends StatelessWidget {
  final String title;
  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12, left: 4),
      child: Text(title, style: AppTextStyles.bodyHint),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final bool isUnread;
  final bool isDeposit;
  final String time;
  final Widget content;

  const NotificationCard({
    super.key,
    this.isUnread = false,
    required this.isDeposit,
    required this.time,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 1. Unread Indicator
          if (isUnread) ...[
            Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: Color(0xFF0EA5E9), // Bright Blue
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 12),
          ],

          // 2. Icon (Green for deposit, Red for sold)
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: isDeposit
                  ? AppColors.green.withValues(alpha: .1)
                  : AppColors.error.withValues(
                      alpha: .1,
                    ), // Light Green or Light Red
              shape: BoxShape.circle,
            ),
            child: Icon(
              isDeposit ? Icons.south_west : Icons.north_east,
              color: isDeposit ? AppColors.green : AppColors.error,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),

          // 3. Text Content
          Expanded(child: content),
          const SizedBox(width: 8),

          // 4. Time
          Text(
            time,
            style: AppTextStyles.bodyHint.copyWith(
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
