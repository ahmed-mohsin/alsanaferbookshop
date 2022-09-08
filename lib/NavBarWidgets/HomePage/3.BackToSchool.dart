import 'package:alsanaferbookshop/CategoriesAllProducts/CategoryAllProducts.dart';
import 'package:alsanaferbookshop/ProductFullProfile/ProductFullProfile.dart';
import 'package:alsanaferbookshop/configs/colors.dart';
import 'package:alsanaferbookshop/products.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:faker/faker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';

import '../../Cart/CartScreen.dart';
import '../../ProductFullProfile/product_card.dart';

class BackToSchool extends StatelessWidget {
  const BackToSchool({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      height: height(context),
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
                  'Back To School',
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: kPrimaryColor,
                      fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (c) =>
                                  CategoryAllProducts('Back To School',BacktoScoolPoducts)));
                    },
                    child: Text('See More')),
              )
            ],
          ),
          Divider(
            color: Colors.grey,
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: BacktoScoolPoducts.length,
                itemBuilder: (c, i) {
                  return Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: SingleProduct(BacktoScoolPoducts[i]),
                  );
                }),
          )
        ],
      ),
    );
  }

  double height(BuildContext context) =>
      MediaQuery.of(context).size.height * .45;
}

