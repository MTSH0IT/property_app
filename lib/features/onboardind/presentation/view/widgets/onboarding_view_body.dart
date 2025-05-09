import 'package:flutter/material.dart';
import 'package:property_app/core/utils/images.dart';
import 'package:property_app/core/widgets/custom_button.dart';
import 'package:property_app/features/auth/presentation/views/login_view.dart';
import 'package:property_app/features/onboardind/presentation/view/widgets/page_view_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
                title: 'جد عقارك المثالي',
                subTitle:
                    'ابحث عن عقارك المثالي من بين العديد من الخيارات المتاحة',
              ),
              PageViewItem(
                imagePath: Assets.assetsImagesHouseSearchingCuate,
                title: 'استمتع بتجربة فريدة',
                subTitle: 'نظام فلترة متقدم يساعدك في العثور على ما تبحث عنه',
              ),
              PageViewItem(
                imagePath: Assets.assetsImagesHouseSearchingBro,
                title: 'تعرف على عقارك الجديد',
                subTitle:
                    'عرض معلومات تفصيلية وصور عالية الجودة للعقارات المتاحة',
              ),
            ],
          ),
        ),
        SmoothPageIndicator(
          controller: pageController,
          count: 3,
          effect: const WormEffect(
            dotHeight: 15,
            dotWidth: 15,
            activeDotColor: Colors.blueAccent,
            dotColor: Color.fromARGB(183, 215, 221, 224),
          ),
          onDotClicked: (index) {
            pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          },
        ),
        const SizedBox(height: 25),

        Visibility(
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          visible: currentIndex == 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomButton(
              text: 'ابدأ الآن',
              ontap: () {
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
