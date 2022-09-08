import 'package:alsanaferbookshop/Boarding.dart';
import 'package:alsanaferbookshop/configs/colors.dart';
import 'package:alsanaferbookshop/coustomRoute.dart';
import 'package:alsanaferbookshop/navbar.dart';
import 'package:badges/badges.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:textfield_search/textfield_search.dart';

import 'NavBarWidgets/HomePage/0.HomePage.dart';

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
    return MaterialApp(
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
    );
  }
}

class MyExample extends StatefulWidget {
  @override
  _MyExampleState createState() => _MyExampleState();
}

class _MyExampleState extends State<MyExample> {
  int _selectedIndex = 0; //default index

  final List<Widget> _navBarWidgetOptions = [
    const HomePage(),
    const Text('Favorites'),
    const Text('Account'),
    const Text('Requests'),
  ];

  //String label = "Some Label";
  List dummyList = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'];
  TextEditingController myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    myController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // Start listening to changes.
    myController.addListener(_printLatestValue);
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
              Badge(
                position: BadgePosition.topEnd(top: 0, end: 3),
                animationDuration: Duration(milliseconds: 300),
                animationType: BadgeAnimationType.slide,
                badgeContent: Text(
                  2.toString(),
                  style: TextStyle(color: Colors.white),
                ),
                child: IconButton(
                    icon: Icon(Icons.shopping_cart), onPressed: () {}),
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
      bottomNavigationBar: CustomLineIndicatorBottomNavbar(
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
            icon: Icons.home,
          ),
          CustomBottomBarItems(
              // label: 'Cart',
              icon: Icons.favorite),
          CustomBottomBarItems(
            //label: 'Account',
            icon: Icons.person,
          ),
          CustomBottomBarItems(
            //  label: 'Menu',
            icon: Icons.list,
          ),
        ],
      ),
    );
  }
}
