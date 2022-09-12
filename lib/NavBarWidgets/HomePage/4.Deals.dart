import 'package:alsanaferbookshop/CategoriesAllProducts/CategoryAllProducts.dart';
import 'package:alsanaferbookshop/constants/colors.dart';
import 'package:alsanaferbookshop/products.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import '../../hh.dart';

class Deals extends StatefulWidget {
  @override
  _SwipperSectionState createState() => _SwipperSectionState();
}

class _SwipperSectionState extends State<Deals> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
          child: Text(
            'Limited Time Offers',
            style: TextStyle(
                fontWeight: FontWeight.w800,
                color: kPrimaryColor,
                fontSize: 18),
          ),
        ),
        Center(
          child: Container(color: Colors.white,
            child: FlipClock.countdown(
              duration: Duration(days: 3, minutes: 25),
              digitColor: Colors.white,
              backgroundColor: kPrimaryColor,
              digitSize: 30.0,
              borderRadius: const BorderRadius.all(Radius.circular(3.0)),
              onDone: () => print('ih'),
            ),
          ),
        ),
        Swiper(
          autoplay: true,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                print('clicked');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (c) =>
                            CategoryAllProducts("Hot Offers",BacktoScoolPoducts)));

              },
              child: Card(
                child: Stack(
                  children: <Widget>[
                    SizedBox.expand(
                      child: Material(
                        borderRadius: BorderRadius.circular(12.0),
                        child: CachedNetworkImage(
                          imageUrl: products[index].imageUrl,
                          fit: BoxFit.fill,
                          height: double.infinity,
                          width: double.infinity,
                          placeholder: (context, url) => Container(
                              height: 20,
                              width: 20,
                              child:  Container()),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ),
                    SizedBox.expand(
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Colors.transparent, Colors.black54],
                                begin: Alignment.center,
                                end: Alignment.bottomCenter)),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                         color: Colors.red
                        ,child: Padding(
                            padding: const EdgeInsets.only(left: 4,right: 4,top: 2,bottom: 2),
                            child: Text(
                                '${(products[index].oldPriceOfPiece / products[index].oldPriceOfPiece * 100).round()}% OFF',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Text(products[index].name,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w700)),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 4),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.black54,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text('you will save ',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.w400)),
                                        Text(
                                            '${(products[index].oldPriceOfPiece - products[index].oldPriceOfPiece).round()}' +
                                                ' KW',
                                            style: const TextStyle(
                                                color: Colors.amber,
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.w700)),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                    )
                  ],
                ),
              ),
            );
            /*formatDuration(productList[index]['willEnd']
                                        .difference(DateTime.now()))*/
          },
          itemCount: products.length,
          itemHeight: 250,
          itemWidth: 400,
          layout: SwiperLayout.TINDER,
        ),
      ],
    );
  }

  static String formatDuration(Duration d) {
    var seconds = d.inSeconds;
    final days = seconds ~/ Duration.secondsPerDay;
    seconds -= days * Duration.secondsPerDay;
    final hours = seconds ~/ Duration.secondsPerHour;
    seconds -= hours * Duration.secondsPerHour;
    final minutes = seconds ~/ Duration.secondsPerMinute;
    seconds -= minutes * Duration.secondsPerMinute;

    final List<String> tokens = [];
    if (days != 0) {
      tokens.add('${days}d');
    }
    if (tokens.isNotEmpty || hours != 0) {
      tokens.add('${hours}h');
    }
    if (tokens.isNotEmpty || minutes != 0) {
      tokens.add('${minutes}m');
    }
    tokens.add('${seconds}s');

    return tokens.join(':');
  }
}
