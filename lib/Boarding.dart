import 'package:alsanaferbookshop/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intro_screen_onboarding_flutter/introduction.dart';
import 'package:intro_screen_onboarding_flutter/introscreenonboarding.dart';

import 'NavBarWidgets/HomePage/0.HomePage.dart';
class OnBoardingScreenRoute extends CupertinoPageRoute {
  OnBoardingScreenRoute()
      : super(builder: (BuildContext context) => new OnBoardingScreen());

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return new FadeTransition(opacity: animation, child: new OnBoardingScreen());
  }
}
class OnBoardingScreen extends StatelessWidget {
  final List<Introduction> list = [
    Introduction(
      title: 'Buy',imageHeight: 250,
      subTitle: 'Browse the menu and order directly from the application',
      imageUrl: 'assets/images/logo.png',
    ),
    Introduction(
      title: 'Delivery',imageHeight: 250,
      subTitle: 'Your order will be immediately collected and',
      imageUrl: 'assets/images/2.png',
    ),
    Introduction(
      title: 'Receive Money',imageHeight: 250,
      subTitle: 'Pick up delivery at your door',
      imageUrl: 'assets/images/3.png',
    ),
    Introduction(
      title: 'Finish',imageHeight: 250,
      subTitle: 'Browse the menu and order directly from the application',
      imageUrl: 'assets/images/5.png',
    ),
    Introduction(
      title: 'save',imageHeight: 250,
      subTitle: 'Order Now your first order and get start discount up to 20 %',
      imageUrl: 'assets/images/6.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return IntroScreenOnboarding(backgroudColor: Colors.white,
      introductionList: list,
      onTapSkipButton: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Home(),
          ), //MaterialPageRoute
        );
      },
      // foregroundColor: Colors.red,
    );
  }
}

