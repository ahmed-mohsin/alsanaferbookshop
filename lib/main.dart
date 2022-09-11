import 'package:alsanaferbookshop/Boarding.dart';
import 'package:alsanaferbookshop/constants/colors.dart';
import 'package:alsanaferbookshop/coustomRoute.dart';
import 'package:alsanaferbookshop/models/catelog.dart';
import 'package:alsanaferbookshop/navbar.dart';
import 'package:alsanaferbookshop/products.dart';
import 'package:alsanaferbookshop/providers/cartProvider.dart';
import 'package:badges/badges.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:textfield_search/textfield_search.dart';

import 'Cart/CartScreen.dart';
import 'NavBarWidgets/HomePage/0.HomePage.dart';
import 'constants/AppIcons.dart';
import 'models/cart.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  //FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
  // DevicePreview(
  //   enabled: !kReleaseMode,
  //   builder: (context) => MyApp(), // Wrap your app
  // );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // In this sample app, CatalogModel never changes, so a simple Provider
        // is sufficient.
        Provider(create: (context) => CatalogModel()),
        // CartModel is implemented as a ChangeNotifier, which calls for the use
        // of ChangeNotifierProvider. Moreover, CartModel depends
        // on CatalogModel, so a ProxyProvider is needed.
        ChangeNotifierProxyProvider<CatalogModel, CartModel>(
          create: (context) => CartModel(),
          update: (context, catalog, cart) {
            if (cart == null) throw ArgumentError.notNull('cart');
            cart.catalog = catalog;
            return cart;
          },
        ),
        ChangeNotifierProvider(
          create: (_) => CartProvider(),
        ),
      ],
      child: MaterialApp(
        scrollBehavior: CupertinoScrollBehavior(),
        title: 'Alsanafer',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            pageTransitionsTheme: PageTransitionsTheme(
              builders: {
                TargetPlatform.android: CustomPageTransitionBuilder(),
                TargetPlatform.iOS: CustomPageTransitionBuilder(),
              },
            ),
            fontFamily: 'Opensans',
            primarySwatch: kPrimaryColor,
            textTheme: TextTheme(
                subtitle1: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Colors.deepOrange)),
            inputDecorationTheme: InputDecorationTheme(
                contentPadding: EdgeInsets.symmetric(horizontal: 10))),
        home: OnBoardingScreen(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0; //default index

  final List<Widget> _navBarWidgetOptions = [
    const HomePage(),
    const Text('Favorites'),
    const Text('Account'),
    const Text('Requests'),
  ];

  List dummyList = [];
  TextEditingController myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // Start listening to changes.
    //dummyList=[];
    products.forEach((element) {
      dummyList.add(element.name.toLowerCase());
    });
    BacktoScoolPoducts.forEach((element) {
      dummyList.add(element.name.toLowerCase());
    });
    favoriteProducts.forEach((element) {
      dummyList.add(element.name.toLowerCase());
    });

    myController.addListener(_printLatestValue);
    if(myController.text.isEmpty){
      print('hh');
    }
  }

  _printLatestValue() {
    print("Textfield value: ${myController.text}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            snap: false,
            centerTitle: false,
            backgroundColor: kPrimaryColor,
            title: const Text('Alsanafer Bookshop'),
            actions: [
              Consumer<CartProvider>(
                builder: (context, consumer, child) {
                  return Badge(
                    position: BadgePosition.topEnd(top: 0, end: 3),
                    animationDuration: Duration(milliseconds: 300),
                    animationType: BadgeAnimationType.slide,
                    badgeContent: Text(
                      consumer.getCartItems().length.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                    child: IconButton(
                        icon: Icon(AppIcons.cart),
                        onPressed: () {
                          Navigator.push(context, CartScreenRoute());
                        }),
                  );
                },
              )
            ],
            bottom: AppBar(
              backgroundColor: kPrimaryColor,
              title: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                height: 40,
                child: Center(
                  child: TextFieldSearch(
                      decoration: InputDecoration(
                          hintText: 'search',
                          border: InputBorder.none,
                          contentPadding:
                              EdgeInsets.only(left: 4, right: 4, bottom: 8)),
                      initialList: dummyList,
                      minStringLength: 2,
                      label: ' ',
                      controller: myController),
                ),
              ),
            ),
          ),
          // Other Sliver Widgets
          SliverList(
            delegate: SliverChildListDelegate([
              Center(
                child: Center(
                  child: _navBarWidgetOptions.elementAt(_selectedIndex),
                ),
              ),
            ]),
          ),
        ],
      ),
      bottomNavigationBar: bottomNavigationBar(),
    );
  }

  Widget bottomNavigationBar() {
    return SizedBox(
      child: BottomNavigationBar(
        showSelectedLabels: false,
        backgroundColor: Colors.white,
        selectedIconTheme: IconThemeData(color: kPrimaryColor),
        unselectedIconTheme:
            IconThemeData(color: Colors.grey.shade400, size: 30),
        showUnselectedLabels: false,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: 'd',
            icon: Padding(
              padding: const EdgeInsets.all(0),
              child: AnimatedContainer(
                  duration: Duration(microseconds: 1),
                  child: Icon(
                    AppIcons.home,
                    size: 30,
                  )),
            ),
          ),
          BottomNavigationBarItem(
            label: 'd',
            icon: Padding(
              padding: const EdgeInsets.all(0),
              child: AnimatedContainer(
                duration: Duration(microseconds: 1),
                child: Consumer<CartProvider>(
                  builder: (context, consumer, child) {
                    return consumer.getCartItems().isEmpty
                        ? Icon(
                            AppIcons.cart,
                            size: 30,
                          )
                        : Badge(
                            position: BadgePosition.topEnd(top: -12, end: -12),
                            animationDuration: Duration(milliseconds: 300),
                            animationType: BadgeAnimationType.fade,
                            badgeContent: Text(
                              consumer.getCartItems().length.toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                            child: Icon(
                              AppIcons.cart,
                              size: 30,
                            ),
                          );
                  },
                ),
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: 'null',
            icon: Padding(
              padding: const EdgeInsets.all(0),
              child: AnimatedContainer(
                  duration: Duration(microseconds: 1),
                  child: Icon(
                    AppIcons.account,
                    size: 30,
                  )),
            ),
          ),
          BottomNavigationBarItem(
            label: 'null',
            icon: Padding(
              padding: const EdgeInsets.all(0),
              child: AnimatedContainer(
                  duration: Duration(microseconds: 1),
                  child: Icon(
                    AppIcons.menu,
                    size: 30,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}

/*CustomLineIndicatorBottomNavbar(
        selectedColor: kPrimaryColor,
        unSelectedColor: Colors.grey,
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        selectedIconSize: 20,
        unselectedIconSize: 20,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        enableLineIndicator: true,
        lineIndicatorWidth: 2,
        indicatorType: IndicatorType.Top,
        // gradient: LinearGradient(
        //   colors: kGradients,
        // ),
        customBottomBarItems: [
          CustomBottomBarItems(
            // label: 'Home',
            icon: AppIcons.home,
          ),
          CustomBottomBarItems(
              // label: 'Cart',
              icon: AppIcons.addToFavoriteBold),
          CustomBottomBarItems(
            //label: 'Account',
            icon: AppIcons.account,
          ),
          CustomBottomBarItems(
            //  label: 'Menu',
            icon: AppIcons.menu,
          ),
        ],
      )*/
