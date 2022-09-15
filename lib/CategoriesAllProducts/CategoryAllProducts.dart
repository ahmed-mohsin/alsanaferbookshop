import 'package:alsanaferbookshop/NavBarWidgets/HomePage/5.RececentlyAdded.dart';
import 'package:alsanaferbookshop/ProductFullProfile/product_card.dart';
import 'package:alsanaferbookshop/constants/colors.dart';
import 'package:alsanaferbookshop/products.dart';
import 'package:flutter/material.dart';

import '../NavBarWidgets/HomePage/3.BackToSchool.dart';

class CategoryAllProducts extends StatelessWidget {
  String categoryTitle;
  List<Product> list ;
  CategoryAllProducts(this.categoryTitle,this.list);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,centerTitle: true,
        title: Text(categoryTitle,style: TextStyle(color: Colors.white),),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
              crossAxisCount: 2,
              crossAxisSpacing: 2,
              mainAxisSpacing: 5,
              height: 240,
            ),
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.all(0),
            itemCount: favoriteProducts.length,
            itemBuilder: (c, i) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: SingleProduct(favoriteProducts[i]),
                ),
              );
            }),
      ),
    );
  }
}
