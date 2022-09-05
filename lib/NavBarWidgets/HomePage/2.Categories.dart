import 'package:alsanaferbookshop/configs/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  List<Category> categories = [
    Category(
        'Stationary',
        'https://admin.alsanaferbookshop.com//Resources/3/Ecommerce/CategoryImage/7.jpg',
        Colors.indigo.shade900),
    Category(
        'School Bags',
        'https://admin.alsanaferbookshop.com//Resources/3/Ecommerce/CategoryImage/9.jpg',
        Colors.deepOrange),
    Category(
        'Engineering Kit',
        'https://admin.alsanaferbookshop.com//Resources/3/Ecommerce/CategoryImage/12.jpg',
        Color(0xFFae7e26)),
    Category(
        'Education',
        'https://admin.alsanaferbookshop.com//Resources/3/Ecommerce/CategoryImage/8.jpg',
        Colors.greenAccent.shade700),
    Category(
        'Sewing Kit',
        'https://admin.alsanaferbookshop.com//Resources/3/Ecommerce/CategoryImage/13.jpg',
        Colors.lightGreenAccent),


    Category(
        'Art & Craft',
        'https://admin.alsanaferbookshop.com//Resources/3/Ecommerce/CategoryImage/6.jpg',
        Colors.red.shade900),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .20,
      width: MediaQuery.of(context).size.width,
      color: const Color(0xFFF7F7F7),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: categories.length,
          itemBuilder: (c, i) {
            return Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                width: MediaQuery.of(context).size.width * .28,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      minRadius: MediaQuery.of(context).size.width * .12,
                      backgroundColor: categories[i].color,
                      child: CachedNetworkImage(
                        imageUrl: categories[i].image,
                        fit: BoxFit.fill,
                        height: 50,
                        width: 50,
                        placeholder: (context, url) => Container(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4, bottom: 4),
                      child: Text(
                        categories[i].name,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: categories[i].color),
                      ),
                    )
                  ],
                )),
              ),
            );
          }),
    );
  }
}

class Category {
  String name;

  String image;

  Color color;

  Category(this.name, this.image, this.color);
}
