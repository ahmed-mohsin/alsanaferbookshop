import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartScreenRoute extends CupertinoPageRoute {
  CartScreenRoute()
      : super(builder: (BuildContext context) => new CartScreen());


  // OPTIONAL IF YOU WISH TO HAVE SOME EXTRA ANIMATION WHILE ROUTING
  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return new FadeTransition(opacity: animation, child: new CartScreen());
  }
}

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => new _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Second Page'),
      ),
      body: new Center(
        child: new Text('This is the second page'),
      ),
    );
  }
}