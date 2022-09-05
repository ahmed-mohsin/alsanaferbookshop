import 'package:alsanaferbookshop/configs/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

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
                child:
                    ElevatedButton(onPressed: () {}, child: Text('See More')),
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
                itemCount: 4,
                itemBuilder: (c, i) {
                  return Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * .45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey.shade100)),
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CachedNetworkImage(
                            imageUrl:
                                'https://admin.alsanaferbookshop.com//Resources/3/Ecommerce/ItemImage/34030-1.jpg',
                            fit: BoxFit.fill,
                            height: height(context)/2,
                            placeholder: (context, url) => Container(
                                height: 20,
                                width: 20,
                                child: const CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                          Text(
                            'Minnie wood clip',
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w800),
                          ),
                          Container()
                        ],
                      )),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }

  double height(BuildContext context) =>
      MediaQuery.of(context).size.height * .4;
}
