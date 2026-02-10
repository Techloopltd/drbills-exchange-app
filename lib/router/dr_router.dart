import 'package:auto_route/auto_route.dart';
import 'package:drbills_exchange/ui/crypto/pages/crypto_home_page.dart';
import 'package:drbills_exchange/ui/gift_card/pages/gift_card_home_page.dart';
import 'package:drbills_exchange/ui/home/pages/home_page.dart';
import 'package:drbills_exchange/ui/home/pages/home_view.dart';
import 'package:drbills_exchange/ui/home/pages/notifications_page.dart';
import 'package:drbills_exchange/ui/start/pages/forgot_pass_page.dart';
import 'package:drbills_exchange/ui/start/pages/onboarding_page.dart';
import 'package:drbills_exchange/ui/start/pages/otp_page.dart';
import 'package:drbills_exchange/ui/start/pages/reset_password_page.dart';
import 'package:drbills_exchange/ui/start/pages/set_transact_pin_page.dart';
import 'package:drbills_exchange/ui/start/pages/sign_in_page.dart';
import 'package:drbills_exchange/ui/start/pages/sign_up_page.dart';
import 'package:drbills_exchange/ui/transactions/pages/transact_home_page.dart';
import 'package:drbills_exchange/ui/virtual_card/pages/virtual_card_home_page.dart';

part 'dr_router.gr.dart';

@AutoRouterConfig()
class DrRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: OnboardingRoute.page, initial: true, path: '/onboarding'),
    AutoRoute(page: SignInRoute.page, path: '/sign-in'),
    AutoRoute(page: SignUpRoute.page, path: '/sign-up'),
    AutoRoute(page: ForgotPassRoute.page, path: '/forgot-pass'),
    AutoRoute(page: OtpRoute.page, path: '/otp'),
    AutoRoute(page: SetTransactPinRoute.page, path: '/set-transact-pin'),
    AutoRoute(page: ResetPasswordRoute.page, path: '/reset-password'),
    AutoRoute(
      page: CompleteTransactPinRoute.page,
      path: '/complete-transact-pin',
    ),
    AutoRoute(
      page: HomeRoute.page,
      path: '/home',
      children: [
        AutoRoute(page: HomeViewRoute.page, path: 'home-view'),
        AutoRoute(page: CryptoHomeRoute.page, path: 'crypto-home'),
        AutoRoute(page: VirtualCardHomeRoute.page, path: 'virtual-card-home'),
        AutoRoute(page: GiftCardHomeRoute.page, path: 'gift-card-home'),
        AutoRoute(page: TransactHomeRoute.page, path: 'transact-home'),
      ],
    ),
    AutoRoute(page: NotificationRoute.page, path: '/notifications'),
  ];
}
