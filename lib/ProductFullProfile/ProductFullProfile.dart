import 'dart:async';

import 'package:alsanaferbookshop/configs/colors.dart';
import 'package:alsanaferbookshop/products.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:quantity_input/quantity_input.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class ProductFullProfile extends StatefulWidget {
  Product product;

  ProductFullProfile(this.product);

  @override
  State<ProductFullProfile> createState() => _ProductFullProfileState();
}

class _ProductFullProfileState extends State<ProductFullProfile> {
  int simpleIntInput = 1;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.product.name), centerTitle: true),
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CachedNetworkImage(
                      imageUrl: widget.product.imageUrl,
                      fit: BoxFit.fill,
                      height: MediaQuery.of(context).size.height * .3,
                      placeholder: (context, url) =>
                          Container(height: 20, width: 20, child: Container()),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                  //Divider(color: kPrimaryColor,),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: SizedBox(width: MediaQuery.of(context).size.width*.60,
                          child: Text(
                            widget.product.name,
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                color: kPrimaryColor,
                                fontSize: 18),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.green, width: 1),
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'IN Stock',
                              style: TextStyle(color: Colors.green),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          widget.product.oldPriceOfPiece.toString() + ' KW ',
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey,
                              decorationStyle: TextDecorationStyle.solid,
                              fontSize: 16),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              widget.product.newPriceOfPiece.toString() + ' KW ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  color: kPrimaryColor,
                                  fontSize: 18),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              'you will save ${(widget.product.oldPriceOfPiece - widget.product.newPriceOfPiece).round()}' +
                                  ' KW',
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  color: Colors.deepOrange,
                                  fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 4,
                          color: Colors.grey.shade100,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          "Description",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: kPrimaryColor,
                              fontSize: 18),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: ExpandableText(
                          'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.',
                          expandText: 'show more',
                          collapseText: 'show less',
                          maxLines: 5,
                          linkColor:Colors.deepOrange,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 4,
                          color: Colors.grey.shade100,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          "Details",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: kPrimaryColor,
                              fontSize: 18),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: ExpandableText(
                            'Website # 39120 \n Product # C10895',
                          expandText: 'show more',
                          collapseText: 'show less',
                          maxLines: 5,
                          linkColor: kPrimaryColor,
                        ),
                      ),
                      SizedBox(height: 80,)
                    ],
                  ),
                ],
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                          top: BorderSide(
                              color: Colors.grey.shade300, width: 1))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Spacer(),
                        QuantityInput(
                            decoration: InputDecoration(counter: Text(' '),
                                border: InputBorder.none,
                                labelStyle: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.deepOrange),
                                counterStyle: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.deepOrange)),
                            iconColor: Colors.white,
                            minValue: 1,
                            acceptsZero: false,
                            //label: ' ',
                            value: simpleIntInput,
                            onChanged: (value) => setState(() =>
                                simpleIntInput =
                                    int.parse(value.replaceAll(',', '')))),
                        Spacer(),
                        SizedBox(width:MediaQuery.of(context).size.width*.4 ,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:  RoundedLoadingButton(width:
                              MediaQuery.of(context).size.width*.4,color: Colors.deepOrange,borderRadius: 20,
                              successIcon: Icons.check,successColor: Colors.deepOrange,
                              failedIcon: Icons.add_circle_outline,
                              child: Text('ADD TO CART', style: TextStyle(color: Colors.white)),
                              controller: _btnController2,
                              onPressed: () => _doSomething(_btnController2),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
  final RoundedLoadingButtonController _btnController2 =
  RoundedLoadingButtonController();

  void _doSomething(RoundedLoadingButtonController controller) async {
    Timer(Duration(seconds: 1), () {
      controller.success();
    });
  }
}
