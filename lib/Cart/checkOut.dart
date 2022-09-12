import 'dart:async';

import 'package:alsanaferbookshop/constants/colors.dart';
import 'package:alsanaferbookshop/main.dart';
import 'package:alsanaferbookshop/providers/cartProvider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/custom_card_type_icon.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:provider/provider.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../constants/AppIcons.dart';

class CheckOutScreenRoute extends CupertinoPageRoute {
  CheckOutScreenRoute() : super(builder: (BuildContext context) => CheckOut());

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return FadeTransition(opacity: animation, child: CheckOut());
  }
}

class CheckOut extends StatefulWidget {
  @override
  State<CheckOut> createState() => _CheckOutState();
}

enum DeliveryMethod { Delivery, Pickup }

enum Address { Address1, Adress2 }

enum PaymentMethod { Cash, Credit, GiftCard }

class _CheckOutState extends State<CheckOut> {
  DeliveryMethod deliveryMethod = DeliveryMethod.Pickup;
  Address add = Address.Address1;
  PaymentMethod payMethod = PaymentMethod.Cash;

  get isCvvFocused => null;

  get cvvCode => null;

  get cardHolderName => null;

  get expiryDate => null;

  get cardNumber => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        title: Text(
          'Check Out',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Order Items',
                        style: TextStyle(
                            color: kPrimaryColor, fontWeight: FontWeight.bold),
                      ),
                      _CartList(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 4,
                    color: Colors.grey.shade100,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Delivery Method',
                        style: TextStyle(
                            color: kPrimaryColor, fontWeight: FontWeight.bold),
                      ),
                      RadioListTile(
                        value: DeliveryMethod.Pickup,
                        groupValue: deliveryMethod,
                        title: const Text(
                          'Pick Up',
                          style: TextStyle(fontSize: 15),
                        ),
                        onChanged: (value) {
                          setState(() {
                            deliveryMethod = value!;
                          });
                        },
                      ),
                      RadioListTile(
                        value: DeliveryMethod.Delivery,
                        groupValue: deliveryMethod,
                        title: const Text(
                          'Delivery',
                          style: TextStyle(fontSize: 15),
                        ),
                        onChanged: (value) {
                          setState(() {
                            deliveryMethod = value!;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 4,
                    color: Colors.grey.shade100,
                  ),
                ),
                deliveryMethod != DeliveryMethod.Delivery
                    ? Container()
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Choose Address',
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            RadioListTile(
                              value: Address.Address1,
                              groupValue: add,
                              title: const Text(
                                'Adress1',
                                style: TextStyle(fontSize: 15),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  add = value!;
                                });
                              },
                            ),
                            RadioListTile(
                              value: Address.Adress2,
                              groupValue: add,
                              title: const Text(
                                'Adress2',
                                style: TextStyle(fontSize: 15),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  add = value!;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                deliveryMethod != DeliveryMethod.Delivery
                    ? Container()
                    :Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 4,
                    color: Colors.grey.shade100,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Payment Method',
                        style: TextStyle(
                            color: kPrimaryColor, fontWeight: FontWeight.bold),
                      ),
                      RadioListTile(
                        value: PaymentMethod.Cash,
                        groupValue: payMethod,
                        title: const Text(
                          'Cash',
                          style: TextStyle(fontSize: 15),
                        ),
                        onChanged: (value) {
                          setState(() {
                            payMethod = value!;
                          });
                        },
                      ),
                      RadioListTile(
                        value: PaymentMethod.GiftCard,
                        groupValue: payMethod,
                        title: const Text(
                          'GiftCard',
                          style: TextStyle(fontSize: 15),
                        ),
                        onChanged: (value) {
                          setState(() {
                            payMethod = value!;
                          });
                        },
                      ),
                      RadioListTile(
                        value: PaymentMethod.Credit,
                        groupValue: payMethod,
                        title: const Text(
                          'Credit Card',
                          style: TextStyle(fontSize: 15),
                        ),
                        onChanged: (value) {
                          setState(() {
                            payMethod = value!;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                payMethod != PaymentMethod.Credit ? Container() : CredCardWidget(),
                payMethod != PaymentMethod.GiftCard ? Container() : GiftCardWidget(),
                SizedBox(height: 100)
              ],
            ),
          ),
          Consumer<CartProvider>(
            builder: (context, consumer, child) {
              return Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: MediaQuery.of(context).size.width,height: 80,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                            top: BorderSide(
                                color: Colors.grey.shade300, width: 1))),
                    child: Center(
                      child: RoundedLoadingButton(
                        width: MediaQuery.of(context).size.width*.8 ,
                        color: Colors.deepOrange,
                        borderRadius: 20,
                        successIcon: Icons.check,
                        successColor: Colors.deepOrange,
                        failedIcon: Icons.add_circle_outline,
                        child: Text('Place Order',
                            style: TextStyle(color: Colors.white)),
                        controller: _btnController2,
                        onPressed: () async {
                          consumer.deleteAllCartProvider();
                          _btnController2.success();
                          Dialogs.bottomMaterialDialog(lottieBuilder: LottieBuilder.asset('assets/cong_example.json')
                              ,msg:
                              'Congratulation Your order Placed , have a nice day , and hope to see you again',
                              title: 'Congratulation',
                              context: context,
                              actions: [
                                IconsOutlineButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  text: 'My Orders',
                                  iconData: Icons.cancel_outlined,
                                  textStyle: TextStyle(color: Colors.grey),
                                  iconColor: Colors.grey,
                                ),
                                IconsButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(context, HomeScreenRoute());
                                  },
                                  text: 'Home',
                                  iconData: AppIcons.home,
                                  color: Colors.red,
                                  textStyle: TextStyle(color: Colors.white),
                                  iconColor: Colors.white,
                                ),
                              ]);
                          _btnController2.reset();
                        },
                      ),
                    ),
                  ));
            },
          )


        ],
      ),
    );
  }
  final RoundedLoadingButtonController _btnController2 =
  RoundedLoadingButtonController();
}
class GiftCardWidget extends StatefulWidget {
  const GiftCardWidget({Key? key}) : super(key: key);

  @override
  State<GiftCardWidget> createState() => _GiftCardWidgetState();
}

class _GiftCardWidgetState extends State<GiftCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Form(child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            keyboardType: TextInputType.text,
            autofocus: false,
            textAlign: TextAlign.start,
            textInputAction: TextInputAction.done,
            style: TextStyle(
                color: Colors.black87,
                fontSize: 18,
                fontWeight: FontWeight.w500),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(2.0),
                borderSide: BorderSide(
                  color: kPrimaryColor,
                  width: 1.0,
                ),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
              labelText: '   Gift Card Number',
              hintStyle: TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
              labelStyle: TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepOrange, width: 1)),
            ),
          ),
        )),

    );
  }
}

class CredCardWidget extends StatefulWidget {
  @override
  State<CredCardWidget> createState() => _CredCardWidgetState();
}

class _CredCardWidgetState extends State<CredCardWidget> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  OutlineInputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.7),
        width: 2.0,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // const SizedBox(
        //   height: 30,
        // ),
        CreditCardWidget(
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          bankName: 'ALSanafer Bank',
          showBackView: isCvvFocused,
          obscureCardNumber: true,
          obscureCardCvv: true,
          isHolderNameVisible: true,
          cardBgColor: Colors.black,
          backgroundImage:  'assets/images/card_bg.png',
          isSwipeGestureEnabled: true,
          onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
          customCardTypeIcons: <CustomCardTypeIcon>[
            CustomCardTypeIcon(
              cardType: CardType.mastercard,
              cardImage: Image.asset(
                'assets/images/mastercard.png',
                height: 48,
                width: 48,
              ),
            ),
          ],
        ),

        Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: CreditCardForm(
            formKey: formKey,
            obscureCvv: true,
            obscureNumber: true,
            cardNumber: cardNumber,
            cvvCode: cvvCode,
            isHolderNameVisible: true,
            isCardNumberVisible: true,
            isExpiryDateVisible: true,
            cardHolderName: cardHolderName,
            expiryDate: expiryDate,
            themeColor: kPrimaryColor,
            textColor: kPrimaryColor,
            cardNumberDecoration: InputDecoration(
              labelText: 'Number',
              hintText: 'XXXX XXXX XXXX XXXX',
              hintStyle: const TextStyle(color: kPrimaryColor),
              labelStyle: const TextStyle(color: kPrimaryColor),
              focusedBorder: border,
              enabledBorder: border,
            ),
            expiryDateDecoration: InputDecoration(
              hintStyle: const TextStyle(color: kPrimaryColor),
              labelStyle: const TextStyle(color: kPrimaryColor),
              focusedBorder: border,
              enabledBorder: border,
              labelText: 'Expired Date',
              hintText: 'XX/XX',
            ),
            cvvCodeDecoration: InputDecoration(
              hintStyle: const TextStyle(color: kPrimaryColor),
              labelStyle: const TextStyle(color: kPrimaryColor),
              focusedBorder: border,
              enabledBorder: border,
              labelText: 'CVV',
              hintText: 'XXX',
            ),
            cardHolderDecoration: InputDecoration(
              hintStyle: const TextStyle(color: kPrimaryColor),
              labelStyle: const TextStyle(color: kPrimaryColor),
              focusedBorder: border,
              enabledBorder: border,
              labelText: 'Card Holder',
            ),
            onCreditCardModelChange: onCreditCardModelChange,
          ),
        ),



      ],
    );
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
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
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: cartProvider.flutterCart.cartItem.length,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: CachedNetworkImage(
                              imageUrl: cartProvider
                                  .flutterCart.cartItem[index].productDetails,
                              fit: BoxFit.fill,
                              width: 70,
                              height: 70,
                              placeholder: (context, url) => Container(
                                  height: 20, width: 20, child: Container()),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(color: Colors.grey.shade300),
                              bottom: BorderSide(color: Colors.grey.shade300),
                              right: BorderSide(color: Colors.grey.shade300)),
                        ),
                        height: 50,
                        width: MediaQuery.of(context).size.width * .60,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cartProvider
                                    .flutterCart.cartItem[index].productName
                                    .toString(),
                                style: TextStyle(
                                    color: Colors.deepOrange,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                'Quantity :  ' +
                                    cartProvider
                                        .flutterCart.cartItem[index].quantity
                                        .toString(),
                                style: TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ));
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
