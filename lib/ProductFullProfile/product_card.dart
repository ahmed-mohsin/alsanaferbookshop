import 'package:alsanaferbookshop/ProductFullProfile/ProductFullProfile.dart';
import 'package:alsanaferbookshop/products.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';

import '../Cart/CartScreen.dart';
import '../configs/colors.dart';

class SingleProduct extends StatefulWidget {
  Product product;

  SingleProduct(this.product);

  @override
  State<SingleProduct> createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  String dropdownvalue = 'Piece (1)';
  bool addedToCart = false;

  var items = ['Piece (1)', "Packet (10)"];
  double? currentPrice;

  @override
  void initState() {
    super.initState();
    currentPrice = widget.product.newPriceOfPiece;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .48,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade100)),
      child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (c) => ProductFullProfile(widget.product)));
                },
                child: Column(
                  children: [
                    CachedNetworkImage(
                      imageUrl: widget.product.imageUrl,
                      fit: BoxFit.fill,
                      height: MediaQuery.of(context).size.height * .45 / 2,
                      placeholder: (context, url) =>
                          Container(height: 20, width: 20, child: Container()),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4, bottom: 2),
                      child: Text(
                        widget.product.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: kPrimaryColor, fontWeight: FontWeight.w800),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: kPrimaryColor, width: 1)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Container(
                      height: 25,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          style: TextStyle(color: kPrimaryColor),
                          elevation: 0,
                          value: dropdownvalue,
                          icon: Icon(Icons.keyboard_arrow_down),
                          items: items.map((String items) {
                            return DropdownMenuItem(
                                value: items, child: Text(items));
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvalue = newValue!;
                            });
                            if (newValue == 'Piece (1)') {
                              setState(() {
                                currentPrice = widget.product.newPriceOfPiece;
                              });
                            } else {
                              setState(() {
                                currentPrice = widget.product.newPriceOfPaket;
                              });
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 4, right: 4),
                        child: Text(
                          currentPrice.toString(),
                          style: TextStyle(
                              color: kPrimaryColor, fontWeight: FontWeight.w900),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(),
                        child: Text(
                          "KW",
                          style: TextStyle(
                              color: kPrimaryColor, fontWeight: FontWeight.w900),
                        ),
                      ),
                      Spacer(),
                      Text('1'),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              addedToCart = !addedToCart;
                            });
                            if (addedToCart) {
                              Dialogs.materialDialog(
                                color: Colors.white,
                                msg: '${widget.product.name} is now in your cart',
                                title: 'Congratulations',
                                lottieBuilder: Lottie.asset(
                                  'assets/cong_example.json',
                                  fit: BoxFit.contain,
                                ),
                                dialogWidth: kIsWeb ? 0.3 : null,
                                context: context,
                                actions: [
                                  IconsButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    text: 'Continue Shopping',
                                    color: kPrimaryColor,
                                    textStyle: TextStyle(color: Colors.white),
                                    iconColor: Colors.white,
                                  ),
                                  IconsButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      Navigator.of(context)
                                          .push(new CartScreenRoute());

                                    },
                                    text: 'Go To Cart',
                                    color: Colors.deepOrange,
                                    textStyle: TextStyle(color: Colors.white),
                                    iconColor: Colors.white,
                                  ),
                                ],
                              );
                            } else {
                              Flushbar(
                                title: 'Removed From Cart',
                                message: '${widget.product.name} Removed From Cart',
                                duration: Duration(seconds: 2),
                              ).show(context);
                            }
                          },
                          icon: Icon(
                            Icons.add_shopping_cart_outlined,
                            color: addedToCart == true
                                ? Colors.deepOrange
                                : kPrimaryColor,
                          ))
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}

class PieceOrPacket {
  String name;
  int num;

  PieceOrPacket(this.name, this.num);
}
