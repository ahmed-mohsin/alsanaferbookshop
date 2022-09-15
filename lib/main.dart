import 'dart:ffi';

import 'package:alsanaferbookshop/Boarding.dart';
import 'package:alsanaferbookshop/constants/colors.dart';
import 'package:alsanaferbookshop/coustomRoute.dart';
import 'package:alsanaferbookshop/products.dart';
import 'package:alsanaferbookshop/providers/cartProvider.dart';
import 'package:badges/badges.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flip_board/flip_board.dart';
import 'package:flip_board/flip_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:provider/provider.dart';
import 'package:textfield_search/textfield_search.dart';

import 'Cart/CartScreen.dart';
import 'NavBarWidgets/HomePage/0.HomePage.dart';
import 'constants/AppIcons.dart';
import 'models/cart.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  //FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
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
        // is sufficient
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
        home: FlipFraseBoardPage(),
      ),
    );
  }
}

class FlipFraseBoardPage extends StatefulWidget {
  const FlipFraseBoardPage({Key? key}) : super(key: key);

  @override
  _FlipFraseBoardPageState createState() => _FlipFraseBoardPageState();
}

class _FlipFraseBoardPageState extends State<FlipFraseBoardPage> {
  final _completed = [false, false, false, false, false];
  final _startNotifier = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    final colors = ColorScheme.fromSwatch(primarySwatch: Colors.blueGrey);
    return Theme(
      data: ThemeData.from(colorScheme: colors),
      child: Scaffold(
        backgroundColor: Colors.blueGrey[50],
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height*.2,),
              Image.asset(
                'assets/images/2.png',
                width: MediaQuery.of(context).size.width * .5,
                height: 150,
              ),
              SizedBox(
                height: 40,
              ),
             Text('WELCOME TO',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900,color: kPrimaryColor),),
              const SizedBox(height: 16.0),
              FlipFraseBoard(
                flipType: FlipType.middleFlip,
                axis: Axis.horizontal,
                startLetter: 'A',maxFlipDelay: 200,
                endFrase: 'ELSANAFER',
                fontSize: 30.0,
                hingeWidth: 0.4,minFlipDelay: 100,
                hingeColor: Colors.black,
                borderColor: Colors.black,
                endColors: _flutterEndColrs,
                letterSpacing: 2.0,
                onDone: () => _onDone(0),
                startNotifier: _startNotifier,
              ),
              const SizedBox(height: 16.0),
              FlipFraseBoard(
                flipType: FlipType.middleFlip,
                axis: Axis.vertical,
                startLetter: 'A',maxFlipDelay: 400,
                endFrase: 'BOOKSTORE',minFlipDelay: 100,
                fontSize: 20.0,
                hingeWidth: 0.6,
                hingeColor: Colors.black,
                borderColor: Colors.black,
                endColors: _flipEndColors,
                letterSpacing: 2.0,
                onDone: () => _onDone(1),
                startNotifier: _startNotifier,
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 24.0,bottom: 50),
                child: _hasCompleted
                    ? Container()
                    : SizedBox(
                        height: 50.0,
                        width: 50,
                        child: Lottie.asset('assets/loader.json'),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget flipFraseBoard() => FlipFraseBoard(
        flipType: FlipType.middleFlip,
        axis: Axis.vertical,
        startLetter: 'A',
        endFrase: 'FLIP',
        fontSize: 30.0,
        hingeWidth: 0.6,
        hingeColor: Colors.black,
        borderColor: Colors.black,
        endColors: _flipEndColors,
        letterSpacing: 2.0,
        onDone: () => _onDone(1),
        startNotifier: _startNotifier,
      );

  List<Color> get _flutterEndColrs => [Colors.blue, Colors.blue[900]!];

  List<Color> get _flipEndColors => [
        Colors.teal[900]!,
        Colors.blue[900]!,
        Colors.red[900]!,
        Colors.blueGrey[900]!,
      ];

  List<Color> get _spinEndColors => [
        Colors.cyan[800]!,
        Colors.orange[900]!,
        Colors.teal[900]!,
        Colors.blue[900]!,
      ];

  List<Color> get _boardsEndColors => [
        Colors.orange[900]!,
        Colors.lightGreen[900]!,
        Colors.red[800]!,
        Colors.blue[900]!,
        Colors.teal[900]!,
        Colors.cyan[800]!,
      ];

  void _onDone(int index) {
    _completed[index] = true;
    if (_hasCompleted) {
      Navigator.push(context, OnBoardingScreenRoute());
    }

  }

  void _restart() {
    setState(() {
      _completed[0] = false;
      _completed[1] = false;
      _completed[2] = false;
      _completed[3] = false;
      _completed[4] = false;
      _startNotifier.value = _startNotifier.value + 1;
    });
  }

  bool get _hasCompleted => _completed[0] && _completed[1];
// _completed[2] &&
// _completed[3] &&
// _completed[4];
}

class HomeScreenRoute extends CupertinoPageRoute {
  HomeScreenRoute() : super(builder: (BuildContext context) => new Home());

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return new FadeTransition(opacity: animation, child: new Home());
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
    if (myController.text.isEmpty) {
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
            floating: true,automaticallyImplyLeading: false,
            pinned: true,
            snap: false,
            centerTitle: false,
            backgroundColor: kPrimaryColor,
            title: const Text('Alsanafer Bookshop'),
            bottom: AppBar(
              backgroundColor: kPrimaryColor,automaticallyImplyLeading: false,
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
      floatingActionButton: Consumer<CartProvider>(
        builder: (context, consumer, child) {
          return consumer.cartIsEmpty()
              ? Container()
              : FloatingActionButton(
                  onPressed: () {
                    Navigator.push(context, CartScreenRoute());
                  },
                  child: Container(
                    child: Badge(
                      position: BadgePosition.topEnd(top: -15, end: -12),
                      animationDuration: Duration(milliseconds: 300),
                      animationType: BadgeAnimationType.slide,
                      badgeContent: Text(
                        consumer.getCartItems().length.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                      child: Icon(
                        AppIcons.addToCart,
                        size: 35,
                      ),
                    ),
                  ),
                );
        },
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
            label: 'null',
            icon: Padding(
              padding: const EdgeInsets.all(0),
              child: AnimatedContainer(
                  duration: Duration(microseconds: 1),
                  child: Icon(
                    AppIcons.addToFavoriteLine,
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
