import 'package:alsanaferbookshop/NavBarWidgets/HomePage/2.Categories.dart';
import 'package:alsanaferbookshop/NavBarWidgets/HomePage/1.HomePageSlider.dart';
import 'package:alsanaferbookshop/NavBarWidgets/HomePage/3.BackToSchool.dart';
import 'package:alsanaferbookshop/NavBarWidgets/HomePage/4.Deals.dart';
import 'package:alsanaferbookshop/NavBarWidgets/HomePage/6.Favorites.dart';
import 'package:alsanaferbookshop/NavBarWidgets/HomePage/7.MostSelling.dart';
import 'package:flutter/material.dart';

import '5.RececentlyAdded.dart';

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
        //const SizedBox(height: 8,),
        //Deals(),
        const SizedBox(height: 8,),
        Categories(),
        const SizedBox(height: 8,),
         BackToSchool(),
        const SizedBox(height: 8,),
        RecentlyAdded(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 4,
            color: Colors.grey.shade100,
          ),
        ),
        MostSell(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 4,
            color: Colors.grey.shade100,
          ),
        ),
        Favorites()
      ]),
    );
  }
}












