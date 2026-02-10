import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:drbills_exchange/config/constants/app_colors.dart';
import 'package:drbills_exchange/config/constants/doubles_config.dart';
import 'package:drbills_exchange/config/constants/size_config.dart';
import 'package:drbills_exchange/config/constants/text_styles.dart';
import 'package:drbills_exchange/config/extensions/string_extensions.dart';
import 'package:drbills_exchange/config/widgets/app_buttons.dart';

import 'package:flutter/material.dart';

@RoutePage()
class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final List<Map<String, String>> onboarders = [
    {
      "image": 'onboard1',
      'title': 'Simple Crypto Transactions',
      "sub":
          "Send, receive, and exchange crypto with ease. Buy & sell Bitcoin, USDT, and more instantly.",
    },
    {
      "image": 'onboard2',
      'title': 'Fast Gift Card Exchange',
      "sub":
          "Convert your gift cards to cash. Upload, submit details, and get paid quickly.",
    },
    {
      "image": 'onboard3',
      'title': 'Instant Virtual USD Cards',
      "sub":
          "Create virtual dollar cards for online shopping. Fund instantly and shop globally.",
    },
    {
      "image": 'onboard4',
      'title': 'Global Payments, Made Easy',
      "sub":
          "Send money worldwide with ease. Track your transfers in real-time.",
    },
  ];

  int currentPage = 0;

  late PageController controller;

  late Timer _timer;

  @override
  void initState() {
    super.initState();

    controller = PageController()
      ..addListener(() {
        currentPage == controller.page!.toInt();
      });

    _timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      if (currentPage < onboarders.length - 1) {
        currentPage++;
      } else {
        currentPage = onboarders.length - 1;
      }
      controller.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.slowMiddle,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: kPadding,
        child: PageView.builder(
          controller: controller,
          itemCount: onboarders.length,
          physics: const AlwaysScrollableScrollPhysics(),
          onPageChanged: (i) {
            setState(() {
              currentPage = i;
            });
          },
          itemBuilder: (context, index) {
            var item = onboarders[index];

            return SafeArea(
              child: Column(
                spacing: drGap(2, context),
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Visibility(
                        visible: index != 0,
                        child: CustomBack(
                          onTap: () {
                            controller.animateToPage(
                              currentPage - 1,
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.easeOut,
                            );
                            setState(() {
                              currentPage--;
                            });
                          },
                        ),
                      ),
                      GestureDetector(
                        onTap: () => context.router.pushPath("/sign-up"),
                        child: Text(
                          "Skip",
                          style: AppTextStyles.bodyMedium.copyWith(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Image.asset(
                    item['image']!.png,
                    height: drHeight(context) * .4,
                  ),
                  SizedBox(height: drGap(1, context)),
                  OnboardDots(
                    length: onboarders.length,
                    currentPage: currentPage,
                  ),
                  SizedBox(),
                  FractionallySizedBox(
                    widthFactor: 0.8,
                    child: Text(
                      item['title']!,
                      style: AppTextStyles.heading1.copyWith(
                        height: 1.0,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  FractionallySizedBox(
                    widthFactor: 0.8,
                    child: Text(
                      item['sub']!,
                      style: AppTextStyles.bodyHint.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: LongButton(
                      onTap: () {
                        if (currentPage < 3) {
                          setState(() {
                            currentPage++;
                          });
                          controller.animateToPage(
                            currentPage,
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeIn,
                          );
                        } else {
                          context.router.pushPath("/sign-up");
                        }
                      },
                      text: "Next",
                    ),
                  ),
                  SizedBox(height: drGap(1, context)),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class OnboardDots extends StatelessWidget {
  const OnboardDots({
    super.key,
    required this.length,
    required this.currentPage,
  });

  final int length;
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(8),
      ),
      child: DotsIndicator(
        dotsCount: length,
        position: currentPage.toDouble(),
        decorator: DotsDecorator(
          color: AppColors.border,
          activeColor: AppColors.primary,
          spacing: EdgeInsets.symmetric(horizontal: 4),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          activeSize: const Size(24, 6),
          size: const Size(6, 6),
          shape: CircleBorder(),
        ),
      ),
    );
  }
}
