import 'package:faker/faker.dart';

final faker = Faker();
List<Product> products = [
  Product(
      faker.person.name(),
      '2',
      'https://admin.alsanaferbookshop.com//Resources/3/Ecommerce/ItemImage/24876-1.jpg',
      3,
      19.99,25.00,23,26),
  Product(
      faker.company.name(),
      '2',
      'https://admin.alsanaferbookshop.com//Resources/3/Ecommerce/ItemImage/74360-1-%D9%82%D9%84%D9%85-%D8%AD%D8%A8%D8%B1-%D8%B2%D9%8A%D8%A8%D8%B1%D8%A7.jpg',
      3,
      16.5,20.00,23,36),
  Product(
      faker.person.name(),
      '2',
      'https://admin.alsanaferbookshop.com//Resources/3/Ecommerce/ItemImage/77277-1-1.jpg',
      3,
      2.5,4.00,8,15),
  Product(
      faker.sport.name(),
      '2',
      'https://admin.alsanaferbookshop.com//Resources/3/Ecommerce/ItemImage/77469-1-C1327.jpg',
      3,
      .36,1,10,20),
  Product(
      faker.company.name(),
      '2',
      'https://admin.alsanaferbookshop.com//Resources/3/Ecommerce/ItemImage/73211-1.jpg',
      3,
      22.00,28,50,60),
];
List<Product> BacktoScoolPoducts = [
  Product(
      faker.person.name(),
      '2',
      'https://admin.alsanaferbookshop.com//Resources/3/Ecommerce/ItemImage/68564-1.jpg',
      3,
      19.99,25.00,23,26),
  Product(
      faker.company.name(),
      '2',
      'https://admin.alsanaferbookshop.com//Resources/3/Ecommerce/CategoryImage/366.png',
      3,
      16.5,20.00,23,36),
  Product(
      faker.person.name(),
      '2',
      'https://admin.alsanaferbookshop.com//Resources/3/Ecommerce/CategoryImage/364.png',
      3,
      2.5,4.00,8,15),
  Product(
      faker.sport.name(),
      '2',
      'https://admin.alsanaferbookshop.com//Resources/3/Ecommerce/CategoryImage/365.png',
      3,
      .36,1,10,20),
  Product(
      faker.company.name(),
      '2',
      'https://admin.alsanaferbookshop.com//Resources/3/Ecommerce/ItemImage/73211-1.jpg',
      3,
      22.00,28,50,60),


  Product(
      faker.person.name(),
      '2','https://admin.alsanaferbookshop.com//Resources/3/Ecommerce/ItemImage/77508-1-needle-threaders.jpg',
      3,
      19.99,25.00,23,26),
  Product(
      faker.company.name(),
      '2',
      'https://admin.alsanaferbookshop.com//Resources/3/Ecommerce/ItemImage/56342-1.jpg',
      3,
      16.5,20.00,23,36),
  Product(
      faker.person.name(),
      '2',
      'https://admin.alsanaferbookshop.com//Resources/3/Ecommerce/ItemImage/18326-1.jpg',
      3,
      2.5,4.00,8,15),
  Product(
      faker.sport.name(),
      '2',
      'https://admin.alsanaferbookshop.com//Resources/3/Ecommerce/ItemImage/70937-1.jpg',
      3,
      .36,1,10,20),
  Product(
      faker.company.name(),
      '2',
      'https://admin.alsanaferbookshop.com//Resources/3/Ecommerce/ItemImage/70943-1.png',
      3,
      22.00,28,50,60),
];

List<Product> favoriteProducts = [
  Product(
      faker.person.name(),
      '2',
      'https://admin.alsanaferbookshop.com//Resources/3/Ecommerce/ItemImage/18595-1.jpg',
      3,
      19.99,25.00,23,26),
  Product(
      faker.company.name(),
      '2',
      'https://admin.alsanaferbookshop.com//Resources/3/Ecommerce/ItemImage/68543-1.jpg',
      3,
      16.5,20.00,23,36),
  Product(
      faker.person.name(),
      '2',
      'https://admin.alsanaferbookshop.com//Resources/3/Ecommerce/ItemImage/77277-1-1.jpg',
      3,
      2.5,4.00,8,15),
  Product(
      faker.sport.name(),
      '2',
      'https://admin.alsanaferbookshop.com//Resources/3/Ecommerce/ItemImage/77469-1-C1327.jpg',
      3,
      .36,1,10,20),
  Product(
      faker.company.name(),
      '2',
      'https://admin.alsanaferbookshop.com//Resources/3/Ecommerce/ItemImage/73211-1.jpg',
      3,
      22.00,28,50,60),
];

class Product {
  String name, id, imageUrl;
  double newPriceOfPiece,oldPriceOfPiece;
  double newPriceOfPaket,oldPriceOfPacket;
  int quantity;
  Product(this.name, this.id, this.imageUrl, this.quantity, this.newPriceOfPiece,this.oldPriceOfPiece,this.newPriceOfPaket,this.oldPriceOfPacket);
}