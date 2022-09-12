import 'dart:async';

import 'package:alsanaferbookshop/Cart/checkOut.dart';
import 'package:alsanaferbookshop/constants/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:provider/provider.dart';
import 'package:quantity_input/quantity_input.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../providers/cartProvider.dart';

class CartScreenRoute extends CupertinoPageRoute {
  CartScreenRoute()
      : super(builder: (BuildContext context) => new CartScreen());

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return new FadeTransition(opacity: animation, child: new CartScreen());
  }
}

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ELSANAFER CART',
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
        ),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: _CartList(),
              ),
            ),
            _CartTotal()
          ],
        ),
      ),
    );
  }
}

class _CartList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // This gets the current state of CartModel and also tells Flutter
    // to rebuild this widget when CartModel notifies listeners (in other words,
    // when it changes).
    // var cart = context.watch<CartModel>();
    var cartProvider = context.watch<CartProvider>();
    return ListView.separated(
      itemCount: cartProvider.flutterCart.cartItem.length,
      itemBuilder: (context, index) {
        return Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * .55,
                      child: Text(
                        cartProvider.flutterCart.cartItem[index].productName
                            .toString(),
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'unit Price : ',
                          style: TextStyle(color: kPrimaryColor),
                        ),
                        Text(cartProvider.flutterCart.cartItem[index].unitPrice
                                .toString() +
                            ' KW '),
                      ],
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  cartProvider
                                      .incrementItemToCartProvider(index);
                                },
                                icon: Icon(
                                  Icons.add_circle,
                                  size: 20,
                                  color: Colors.deepOrange,
                                )),
                            Text(
                              cartProvider.flutterCart.cartItem[index].quantity
                                  .toString(),
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w900),
                            ),
                            IconButton(
                                onPressed: () {


                                  cartProvider
                                      .decrementItemFromCartProvider(index);
                                },
                                icon: Icon(
                                  Icons.remove_circle,
                                  size: 20,
                                  color: Colors.deepOrange,
                                ))
                          ],
                        ),
                        IconButton(
                            onPressed: () {
                              Dialogs.bottomMaterialDialog(
                                  msg:
                                      'Are you sure? you can\'t undo this action',
                                  title: 'Delete',
                                  context: context,
                                  actions: [
                                    IconsOutlineButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      text: 'Cancel',
                                      iconData: Icons.cancel_outlined,
                                      textStyle: TextStyle(color: Colors.grey),
                                      iconColor: Colors.grey,
                                    ),
                                    IconsButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        cartProvider.deleteItemFromCart(index);
                                      },
                                      text: 'Delete',
                                      iconData: Icons.delete,
                                      color: Colors.red,
                                      textStyle: TextStyle(color: Colors.white),
                                      iconColor: Colors.white,
                                    ),
                                  ]);
                            },
                            icon: Icon(
                              Icons.delete_outline_rounded,
                              size: 20,
                              color: Colors.deepOrange,
                            ))
                      ],
                    )
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: CachedNetworkImage(
                        imageUrl: cartProvider
                            .flutterCart.cartItem[index].productDetails,
                        fit: BoxFit.fill,
                        width: MediaQuery.of(context).size.width * .25,
                        height: MediaQuery.of(context).size.height * .10,
                        placeholder: (context, url) => Container(
                            height: 20, width: 20, child: Container()),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ),
                )
              ],
            ));
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider();
      },
    );
  }
/*ListTile(
        //leading: const Icon(Icons.done),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            cartProvider.decrementItemFromCartProvider(index);
          },
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cartProvider.flutterCart.cartItem[index].productName.toString(),
              style: itemNameStyle,
            ),
            Text(
              cartProvider.flutterCart.cartItem[index].quantity.toString(),
              style: itemNameStyle,
            ),
          ],
        ),
      )*/
}

class _CartTotal extends StatefulWidget {
  @override
  State<_CartTotal> createState() => _CartTotalState();
}

class _CartTotalState extends State<_CartTotal> {

  @override
  Widget build(BuildContext context) {
    var hugeStyle =
        Theme.of(context).textTheme.headline1!.copyWith(fontSize: 20);
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white,
          border:
              Border(top: BorderSide(color: Colors.grey.shade300, width: 1))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Consumer<CartProvider>(
                builder: (context, cart, child) => Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            'Total Price',
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                        Text(
                            '${cart.getTotalAmount().ceilToDouble().toString()} KW',
                            style: hugeStyle),
                      ],
                    )),
            Spacer(),
            SizedBox(
              width: MediaQuery.of(context).size.width * .4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RoundedLoadingButton(
                  width: MediaQuery.of(context).size.width * .4,
                  color: Colors.deepOrange,
                  borderRadius: 10,
                  successIcon: Icons.check,
                  successColor: Colors.deepOrange,
                  failedIcon: Icons.add_circle_outline,
                  child: Text('PROCEED TO BUY',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600)),
                  controller: _btnController2,
                  onPressed: () {
                    Timer(Duration(milliseconds: 3), () {
                      _btnController2.reset();
                      Navigator.push(context, CheckOutScreenRoute());
                      _btnController2.reset();
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  final RoundedLoadingButtonController _btnController2 =
      RoundedLoadingButtonController();

  @override
  void dispose() {
    _btnController2.reset();
    super.dispose();
  }
}
