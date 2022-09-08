import 'package:alsanaferbookshop/CategoriesAllProducts/CategoryAllProducts.dart';
import 'package:alsanaferbookshop/NavBarWidgets/HomePage/3.BackToSchool.dart';
import 'package:alsanaferbookshop/NavBarWidgets/HomePage/5.RececentlyAdded.dart';
import 'package:alsanaferbookshop/configs/colors.dart';
import 'package:flutter/material.dart';

import '../../products.dart';

class Favorites extends StatelessWidget {
  const Favorites({Key? key}) : super(key: key);
  double height(BuildContext context) =>
      MediaQuery.of(context).size.height * .45;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      //height: height(context),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  'Favorites',
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: kPrimaryColor,
                      fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child:
                ElevatedButton(onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (c) =>
                              CategoryAllProducts('Favorites')));
                }, child: Text('See More')),
              )
            ],
          ),
          Divider(
            color: Colors.grey,
          ),
          GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                crossAxisCount: 2,
                crossAxisSpacing: 2,
                mainAxisSpacing: 5,
                height: MediaQuery.of(context).size.height*.37,
              ),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,padding: EdgeInsets.all(0),
              itemCount: 4,
              itemBuilder: (c, i) {
                return Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: SingleProduct(products[i]),
                );
              })
        ],
      ),
    );
  }
}
/**/