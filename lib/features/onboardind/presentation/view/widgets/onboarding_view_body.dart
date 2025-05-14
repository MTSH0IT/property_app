import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:property_app/core/server/shared_preferences_singleton.dart';
import 'package:property_app/core/utils/images.dart';
import 'package:property_app/core/widgets/custom_button.dart';
import 'package:property_app/features/auth/presentation/views/login_view.dart';
import 'package:property_app/features/onboardind/presentation/view/widgets/page_indicator.dart';
import 'package:property_app/features/onboardind/presentation/view/widgets/page_view_item.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  int currentIndex = 0;
  PageController pageController = PageController();
  @override
  void initState() {
    super.initState();

    pageController.addListener(() {
      setState(() {
        currentIndex = pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView(
            controller: pageController,
            children: [
              PageViewItem(
                imagePath: Assets.assetsImagesHouseSearchingAmico,
                title: "onboarding.page1.title".tr(),
                subTitle: "onboarding.page1.subtitle".tr(),
              ),
              PageViewItem(
                imagePath: Assets.assetsImagesHouseSearchingCuate,
                title: "onboarding.page2.title".tr(),
                subTitle: "onboarding.page2.subtitle".tr(),
              ),
              PageViewItem(
                imagePath: Assets.assetsImagesHouseSearchingBro,
                title: "onboarding.page3.title".tr(),
                subTitle: "onboarding.page3.subtitle".tr(),
              ),
            ],
          ),
        ),
        PageIndicator(pageController: pageController),
        const SizedBox(height: 25),

        Visibility(
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          visible: currentIndex == 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomButton(
              text: "common.get_started".tr(),
              ontap: () async {
                await Prefs.setBool("isOnboarded", true);

                Navigator.pushReplacementNamed(context, LoginView.routeName);
              },
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
