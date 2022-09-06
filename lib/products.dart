import 'package:faker/faker.dart';

final faker = Faker();
List<Product> products = [
  Product(
      faker.person.name(),
      '2',
      'https://admin.alsanaferbookshop.com//Resources/3/Ecommerce/ItemImage/24876-1.jpg',
      3,
      19.99,25.00),
  Product(
      faker.company.name(),
      '2',
      'https://admin.alsanaferbookshop.com//Resources/3/Ecommerce/ItemImage/74360-1-%D9%82%D9%84%D9%85-%D8%AD%D8%A8%D8%B1-%D8%B2%D9%8A%D8%A8%D8%B1%D8%A7.jpg',
      3,
      16.5,20.00),
  Product(
      faker.person.name(),
      '2',
      'https://admin.alsanaferbookshop.com//Resources/3/Ecommerce/ItemImage/77277-1-1.jpg',
      3,
      2.5,4.00),
  Product(
      faker.sport.name(),
      '2',
      'https://admin.alsanaferbookshop.com//Resources/3/Ecommerce/ItemImage/77469-1-C1327.jpg',
      3,
      .36,1),
  Product(
      faker.company.name(),
      '2',
      'https://admin.alsanaferbookshop.com//Resources/3/Ecommerce/ItemImage/73211-1.jpg',
      3,
      22.00,28),
];

class Product {
  String name, id, imageUrl;
  double newPrice,oldPrice;
  int quantity;
  Product(this.name, this.id, this.imageUrl, this.quantity, this.newPrice,this.oldPrice);
}