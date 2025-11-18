import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:nephroscan/base/app_common_widget/button/app_button.dart';
import 'package:nephroscan/base/assets/assets.dart';
import 'package:nephroscan/base/utils/app_text_styles.dart';
import 'package:nephroscan/base/utils/colors.dart';
import 'package:nephroscan/base/utils/ui_extension.dart';
import 'package:nephroscan/routes/auto_router.gr.dart';

@RoutePage()
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColoredBox(
        color: Theme.of(context).colorScheme.primary,
        child: Stack(
          children: [
            PageView.builder(
              controller: _controller,
              itemCount: 3,
              physics: ClampingScrollPhysics(),
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (BuildContext context, int index) {
                return index == 0
                    ? const CarouselScreenOne()
                    : index == 1
                    ? const CarouselScreenTwo()
                    : const CarouselScreenThree();
              },
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  3,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    width: currentIndex == index ? 14 : 10,
                    height: currentIndex == index ? 14 : 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: currentIndex == index
                          ? AppColors.tertiaryDark
                          : Colors.grey.withOpacity(0.5),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CarouselScreenOne extends StatelessWidget {
  const CarouselScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(PNGImages.doctors),
            60.verticalBox,
            Text(
              'Your Health, Our Priority',
              overflow: TextOverflow.visible,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: AppTextStyles.headlineLargeMontserrat.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CarouselScreenTwo extends StatelessWidget {
  const CarouselScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(PNGImages.doctors),
            60.verticalBox,
            Text(
              'We Care for You',
              overflow: TextOverflow.visible,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: AppTextStyles.headlineLargeMontserrat.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            10.verticalBox,
            Text(
              '''Easily monitor your kidney cysts and keep track of any changes over time Get clear insights into your progress and stay informed about your kidney health with helpful updates and reminders.''',
              overflow: TextOverflow.visible,
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyLargeMontserrat,
            ),
          ],
        ),
      ),
    );
  }
}

class CarouselScreenThree extends StatelessWidget {
  const CarouselScreenThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(PNGImages.convo_onboarding),
            60.verticalBox,
            Text(
              'Chat with Experts',
              overflow: TextOverflow.visible,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: AppTextStyles.headlineLargeMontserrat.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            10.verticalBox,
            Text(
              '''Connect with our team of kidney health specialists for personalized advice and support. Get answers to your questions and guidance on managing your condition effectively.''',
              overflow: TextOverflow.visible,
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyLargeMontserrat,
            ),
            30.verticalBox,
            AppButton(
              title: 'Join Now',
              onClick: () => AutoRouter.of(context).replace(SignInRoute()),
            ),
          ],
        ),
      ),
    );
  }
}
