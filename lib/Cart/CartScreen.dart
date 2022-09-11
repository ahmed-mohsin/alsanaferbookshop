import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        title: Text('cart'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade900,
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
            const Divider(height: 4, color: Colors.black),
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
    var itemNameStyle = Theme.of(context).textTheme.headline6;
    // This gets the current state of CartModel and also tells Flutter
    // to rebuild this widget when CartModel notifies listeners (in other words,
    // when it changes).
    // var cart = context.watch<CartModel>();
    var cartProvider = context.watch<CartProvider>();

    return ListView.builder(
      itemCount: cartProvider.flutterCart.cartItem.length,
      itemBuilder: (context, index) => ListTile(
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
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var hugeStyle =
        Theme.of(context).textTheme.headline1!.copyWith(fontSize: 48);
    return SizedBox(
      height: 200,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<CartProvider>(
                builder: (context, cart, child) => Text(
                    '\$${cart.getTotalAmount().toString()}',
                    style: hugeStyle)),
            const SizedBox(width: 24),
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Buying not supported yet.')));
              },
              style: TextButton.styleFrom(primary: Colors.white),
              child: const Text('BUY'),
            ),
          ],
        ),
      ),
    );
  }
}
