import 'package:amicons/amicons.dart';
import 'package:auto_route/auto_route.dart';
import 'package:drbills_exchange/config/constants/app_colors.dart';
import 'package:drbills_exchange/config/constants/text_styles.dart';
import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 22,
          backgroundImage: NetworkImage(
            'https://i.pravatar.cc/150?img=11',
          ), // Placeholder avatar
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello David",
              style: AppTextStyles.heading1.copyWith(fontSize: 16),
            ),
            Text(
              "Welcome back",
              style: AppTextStyles.bodyHint.copyWith(fontSize: 12),
            ),
          ],
        ),
        const Spacer(),
        HomeIcon(
          icon: Amicons.lucide_bell,
          onTap: () {
            context.router.pushPath("/notifications");
          },
        ),
        const SizedBox(width: 10),
        HomeIcon(icon: Amicons.lucide_ellucidepsis, onTap: () {}),
      ],
    );
  }
}

class HomeIcon extends StatelessWidget {
  const HomeIcon({super.key, required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: AppColors.grey.withValues(alpha: .1),
              blurRadius: 5,
            ),
          ],
        ),
        child: Icon(icon, size: 18),
      ),
    );
  }
}
