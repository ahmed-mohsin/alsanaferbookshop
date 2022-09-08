import 'package:alsanaferbookshop/CategoriesAllProducts/CategoryAllProducts.dart';
import 'package:alsanaferbookshop/ProductFullProfile/ProductFullProfile.dart';
import 'package:alsanaferbookshop/configs/colors.dart';
import 'package:alsanaferbookshop/products.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:faker/faker.dart';
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
                    ElevatedButton(onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (c) =>
                                  CategoryAllProducts('Back To School')));
                    }, child: Text('See More')),
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
                itemCount: products.length,
                itemBuilder: (c, i) {
                  return Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: SingleProduct(products[i]),
                  );
                }),
          )
        ],
      ),
    );
  }

  double height(BuildContext context) =>
      MediaQuery.of(context).size.height * .45;
}

class SingleProduct extends StatefulWidget {
  Product product;

  SingleProduct(this.product);

  @override
  State<SingleProduct> createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  String dropdownvalue = 'Piece (1)';

  var items = [
    'Piece (1)',"Packet (10)"
  ];
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
              GestureDetector(onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (c)=>ProductFullProfile(widget.product)));
              },
                child: Column(
                  children: [
                    CachedNetworkImage(
                      imageUrl: widget.product.imageUrl,
                      fit: BoxFit.fill,
                      height: MediaQuery.of(context).size.height * .45 / 2,
                      placeholder: (context, url) => Container(
                          height: 20, width: 20, child: Container()),
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
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 8, right: 8, top: 4, bottom: 4),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                          color: kPrimaryColor, width: 1)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 4),
                    child: Container(
                      height: 25,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(style: TextStyle(color: kPrimaryColor),
                          elevation: 0,
                          value: dropdownvalue,
                          icon: Icon(Icons.keyboard_arrow_down),
                          items:items.map((String items) {
                            return DropdownMenuItem(
                                value: items,
                                child: Text(items)
                            );
                          }
                          ).toList(),
                          onChanged: (String? newValue){
                            setState(() {
                              dropdownvalue = newValue!;
                            });
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
                  padding:
                  const EdgeInsets.symmetric(horizontal: 2),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 4, right: 4),
                        child: Text(
                          widget.product.newPrice.toString(),
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
                      Text('1'),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                              Icons.add_shopping_cart_outlined))
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}

class PieceOrPacket{
  String name;
  int num;

  PieceOrPacket(this.name,this.num);
}