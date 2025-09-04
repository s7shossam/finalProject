import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:patient_appointment/core/routes/pages_route.dart';
import 'package:patient_appointment/core/services/shared_preferences_singleton.dart';
import 'package:patient_appointment/core/utils/colors.dart';
import 'package:patient_appointment/core/utils/constants.dart';
import 'package:patient_appointment/core/utils/extentions.dart';
import 'package:patient_appointment/core/widgets/primary_elevated_button.dart';
import 'package:patient_appointment/core/widgets/secondary_elevated_button.dart';
import 'package:patient_appointment/features/on_boarding/domain/entities/page_view_item_entity.dart';
import 'package:patient_appointment/features/on_boarding/presentation/view/widgets/page_view_body.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.toInt();
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: PageViewBody(pageController: _pageController)),

        DotsIndicator(
          decorator: DotsDecorator(activeColor: AppColors.primaryColor),
          dotsCount: pgaeViewItemList.length,
          position: _currentPage.toDouble(),
        ),

        SizedBox(height: context.responsiveHeight(57)),

        Row(
          spacing: context.responsiveWidth(15),
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SecondaryElevatedButton(
              text: 'Skip',
              onTap: () {
                Prefs.setBool(kOnBoardingViewed, true);
              },
            ),
            PrimaryElevatedButton(
              text: 'Next',
              onTap: () {
                if (_currentPage < pgaeViewItemList.length - 1) {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                } else {
                  Prefs.setBool(kOnBoardingViewed, true);
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    PagesRoutes.authView,
                    (route) => false,
                  );
                }
              },
            ),
          ],
        ),

        SizedBox(height: context.responsiveHeight(62)),
      ],
    );
  }
}
