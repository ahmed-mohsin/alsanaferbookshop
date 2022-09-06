import 'package:alsanaferbookshop/NavBarWidgets/HomePage/2.Categories.dart';
import 'package:alsanaferbookshop/NavBarWidgets/HomePage/1.HomePageSlider.dart';
import 'package:alsanaferbookshop/NavBarWidgets/HomePage/3.BackToSchool.dart';
import 'package:alsanaferbookshop/NavBarWidgets/HomePage/4.Deals.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(children:  [
        const SizedBox(height: 8,),
        const HomePageSlider(),
        const SizedBox(height: 8,),
        Deals(),
        const SizedBox(height: 8,),
        Categories(),
        const SizedBox(height: 8,),
         BackToSchool(),
        const SizedBox(height: 8,),
        RecentlyAdded(),
        const SizedBox(height: 8,),
        MostSell(),
        const SizedBox(height: 8,),
        Favorites()
      ]),
    );
  }
}








class RecentlyAdded extends StatelessWidget {
  const RecentlyAdded({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class MostSell extends StatelessWidget {
  const MostSell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Favorites extends StatelessWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
