import 'package:alsanaferbookshop/ProductFullProfile/ProductFullProfile.dart';
import 'package:alsanaferbookshop/products.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cart/model/cart_model.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../Cart/CartScreen.dart';
import '../constants/AppIcons.dart';
import '../constants/colors.dart';
import '../models/catelog.dart';
import '../providers/cartProvider.dart';

class SingleProduct extends StatefulWidget {
  Product product;

  SingleProduct(this.product);

  @override
  State<SingleProduct> createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  String dropdownvalue = 'Piece (1)';
  bool addedToCart = false;
  bool addedToFavorite = false;

  var items = ['Piece (1)', "Packet (10)"];
  double? currentPrice;
  late CartProvider _cartProvider;
  late CartItem? _cartItem;
  late int _isInCart;

  @override
  void initState() {
    super.initState();
    _cartProvider = Provider.of<CartProvider>(context, listen: false);
    currentPrice = widget.product.newPriceOfPiece;
    _isInCart = _checkItemisInCart();
    if(_isInCart!=0){
      addedToCart=true;
    }
  }

  int _checkItemisInCart() {
    _cartItem = _cartProvider.getSpecificItemFromCartProvider(widget.product.id);
    return _cartItem?.quantity ?? 0;

  }

  @override
  Widget build(BuildContext context) {
    _isInCart = _checkItemisInCart();
    print(_isInCart);
    return Container(
      width: MediaQuery.of(context).size.width * .48,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade100)),
      child: Center(
          child: Stack(
        children: [
          Column(
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
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(),
                        child: Text(
                          "KW",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                      Spacer(),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              addedToCart = !addedToCart;
                            });
                            if (addedToCart) {
                              _cartProvider.addToCart(Item(int.parse(widget.product.id),widget.product.name));
                              Dialogs.materialDialog(
                                color: Colors.white,
                                msg:
                                    '${widget.product.name} is now in your cart',
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
                              //_cartProvider.deleteItemFromCart(Item(int.parse(widget.product.id),widget.product.name));
                              Flushbar(
                                title: 'Removed From Cart',
                                message:
                                    '${widget.product.name} Removed From Cart',
                                duration: Duration(seconds: 2),
                              ).show(context);
                            }
                          },
                          icon: Icon(
                            AppIcons.addToCart,
                            color: _isInCart == 0
                                ? kPrimaryColor
                                : Colors.deepOrange
                            ,
                          ))
                    ],
                  ),
                ),
              )
            ],
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white60,
                    borderRadius: BorderRadius.circular(10)),
                child: IconButton(
                    onPressed: () {
                      setState(() {
                        addedToFavorite = !addedToFavorite;
                      });
                      if (addedToFavorite) {
                        Flushbar(
                          title: 'Added  To Favorites',
                          message: '${widget.product.name} Removed From Cart',
                          duration: Duration(seconds: 2),
                        ).show(context);
                      } else {
                        Flushbar(
                          title: 'Removed From Favorites',
                          message: '${widget.product.name} Removed From Cart',
                          duration: Duration(seconds: 2),
                        ).show(context);
                      }
                    },
                    icon: Icon(
                      addedToFavorite == true
                          ? AppIcons.addToFavoriteBold
                          : AppIcons.addToFavoriteLine,
                      color: addedToFavorite == true
                          ? Colors.deepOrange
                          : kPrimaryColor,
                    )),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white60,
                    borderRadius: BorderRadius.circular(10)),
                child: IconButton(
                    onPressed: () {
                      onShare(context);
                    },
                    icon: Icon(
                      AppIcons.share,
                      color: addedToCart == true
                          ? Colors.deepOrange
                          : kPrimaryColor,
                    )),
              ),
            ],
          ),
        ],
      )),
    );
  }

  void onShare(BuildContext context) async {
    // A builder is used to retrieve the context immediately
    // surrounding the ElevatedButton.
    //
    // The context's `findRenderObject` returns the first
    // RenderObject in its descendent tree when it's not
    // a RenderObjectWidget. The ElevatedButton's RenderObject
    // has its position and size after it's built.
    final box = context.findRenderObject() as RenderBox?;

    await Share.share(widget.product.name,
        subject: widget.product.name,
        sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
  }
}

class PieceOrPacket {
  String name;
  int num;

  PieceOrPacket(this.name, this.num);
}
