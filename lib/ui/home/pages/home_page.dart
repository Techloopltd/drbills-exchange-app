import 'package:auto_route/auto_route.dart';
import 'package:drbills_exchange/config/constants/app_colors.dart';
import 'package:drbills_exchange/router/dr_router.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: [
        const HomeViewRoute(),
        const CryptoHomeRoute(),
        const VirtualCardHomeRoute(),
        const GiftCardHomeRoute(),
        const TransactHomeRoute(),
      ],
      builder: (context, child) {
        final router = AutoTabsRouter.of(context);

        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: router.activeIndex,
            onTap: (i) => router.setActiveIndex(i),
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.secondary,
            unselectedItemColor: AppColors.grey,
            showUnselectedLabels: true,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.rocket_launch),
                label: "Crypto",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.credit_card),
                label: "Virtual card",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.card_giftcard),
                label: "Gift cards",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.receipt_long),
                label: "Transactions",
              ),
            ],
          ),
        );
      },
    );
  }
}
