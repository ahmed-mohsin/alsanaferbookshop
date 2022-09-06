import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePageSlider extends StatelessWidget {
  const HomePageSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselWithIndicatorDemo();
  }
}

class CarouselWithIndicatorDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Container(color: const Color(0xFFF7F7F7),
      height: 200,
      child: Column(children: [
        Expanded(
          child: CarouselSlider(
            items: imageSliders,
            carouselController: _controller,
            options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 6.0,
                height: 6.0,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
      ]),
    );
  }
}

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: CachedNetworkImage(
                  imageUrl: item,fit: BoxFit.fill,height: double.infinity, width: double.infinity,
                  placeholder: (context, url) =>
                  Container(height: 20,width: 20,child: Container()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                )),
          ),
        ))
    .toList();

final List<String> imgList = [
  'https://admin.alsanaferbookshop.com//Resources/3/Ecommerce/BannerImage/57_3.jpg',
  'https://admin.alsanaferbookshop.com//Resources/3/Ecommerce/BannerImage/59_3.jpg',
  'https://admin.alsanaferbookshop.com//Resources/3/Ecommerce/BannerImage/61_3.jpg',
  'https://admin.alsanaferbookshop.com//Resources/3/Ecommerce/BannerImage/62_3.jpg',
  'https://admin.alsanaferbookshop.com//Resources/3/Ecommerce/BannerImage/66_3.jpg',
  'https://admin.alsanaferbookshop.com//Resources/3/Ecommerce/BannerImage/50_3.jpg',
];
