import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:response/models/OnboardingModel.dart';
import 'package:response/utilities/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatefulWidget {
  static String id = '/Onboarding2';

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();
  final OnboardingPage onboard = OnboardingPage();

  List<PageViewModel> pagesList() {
    List<PageViewModel> list = [];
    for (int i = 0; i < OnboardingPage.getNumOfPages(); i++) {
      list.add(PageViewModel(
        title: onboard.getTitle(i),
        body: onboard.getInfo(i),
        image: Image.asset(onboard.getImage(i)),
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      width: 375.0,
      height: 667.0,
      allowFontScaling: true,
    );

    return IntroductionScreen(
      key: introKey,
      pages: pagesList(),
      onDone: () => Navigator.pop(context),
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: Text(
        'Skip',
        style: TextStyle(
          fontFamily: 'Merriweather',
        ),
      ),
      next: Icon(Icons.arrow_forward),
      done: Text(
        'Done',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontFamily: 'Merriweather',
        ),
      ),
      dotsDecorator: DotsDecorator(
        size: Size(10.0.w, 10.0.w),
        color: kLightPinkColor,
        activeColor: kDarkPinkRedColor,
        activeSize: Size(22.0.w, 10.0.w),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0.w)),
        ),
      ),
    );
  }
}
