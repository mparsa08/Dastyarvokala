import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/sabtparvande/sabtparvande.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../loginpage/loginpage.dart';
import 'body.dart';
import 'help.dart';

class MyHomePage extends StatefulWidget {
  static String routename = '/MyHomePage';
  static int selectedIndex = 0;
  bool isloading = false;

  static bool? adminLogin2;
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
    Center(
      child: SizedBox(
        width: 300,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.construction),
            Text(
              'در دست ساخت ... ',
              style: optionStyle,
              textDirection: TextDirection.rtl,
            ),
          ],
        ),
      ),
    ),
    BodyOne(),
    const Helper(),
  ];
  void changeOntap(index) {
    setState(() {
      MyHomePage.selectedIndex = index;
    });
  }

  checkadminlogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    MyHomePage.adminLogin2 = prefs.getBool('active') ?? false;
    print('adminLogin2 : ${MyHomePage.adminLogin2}');
  }

  signout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('active', false);
  }

  @override
  void initState() {
    setState(() {
      widget.isloading = true;
    });
    setState(() {
      widget.isloading = false;
    });
    checkadminlogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      extendBody: true,
      bottomNavigationBar: bottomNavi(),
      endDrawer: Drawer(
        semanticLabel: "Menu",
        child: ListView(
          children: <Widget>[
            DrawerHeader(
                duration: const Duration(seconds: 60),
                decoration: const BoxDecoration(
                  gradient:
                      LinearGradient(colors: [Colors.blue, Colors.purple]),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const <Widget>[
                    Icon(Icons.menu),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "عناوین",
                      style: TextStyle(fontSize: 25),
                    ),
                  ],
                )),
            ListTile(
              onTap: () {
                setState(() {
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                    'این بخش هنوز در دسترس نیست!',
                    textDirection: TextDirection.rtl,
                  )));
                });
              },
              leading: const Icon(Icons.message),
              title: const Text(
                "پیام ها",
                textAlign: TextAlign.right,
              ),
              minVerticalPadding: 5,
            ),
            ListTile(
              onTap: () {
                setState(() {
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                    'این بخش هنوز در دسترس نیست!',
                    textDirection: TextDirection.rtl,
                  )));
                });
              },
              hoverColor: Colors.green,
              leading: const Icon(
                Icons.settings,
                textDirection: TextDirection.rtl,
              ),
              title: const Text(
                "تنظیمات",
                textAlign: TextAlign.right,
              ),
              minVerticalPadding: 5,
            ),
            ListTile(
              onTap: () {
                setState(() {
                  final navigator = Navigator.of(context);
                  signout();
                  navigator.pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => const Loginpage()),
                      (route) => false);
                });
              },
              leading: const Icon(Icons.account_circle_sharp),
              title: const Text(
                "کاربر",
                textAlign: TextAlign.right,
              ),
              minVerticalPadding: 5,
            ),
          ],
        ),
      ),
      body: _widgetOptions.elementAt(MyHomePage.selectedIndex),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "دستیار امور وکلا",
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(20)),
        mini: true,
        focusElevation: 50,
        tooltip: "درج پرونده",
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const SabtParvande()));
        },
        child: const Icon(
          Icons.book,
          color: Colors.white,
          size: 15,
        ),
      ),
    );
  }

  BottomNavigationBar bottomNavi() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.shifting,
      onTap: changeOntap,
      currentIndex: MyHomePage.selectedIndex,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: const Icon(Icons.calculate_outlined),
          label: 'ماشین حساب',
          activeIcon: const Icon(Icons.calculate),
          backgroundColor: Colors.grey[350],
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.home_outlined),
          label: 'صفحه اصلی',
          activeIcon: const Icon(Icons.home),
          backgroundColor: Colors.grey[500],
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.help_outline),
          label: 'راهنما',
          activeIcon: const Icon(Icons.help),
          backgroundColor: Colors.grey[600],
        ),
      ],
    );
  }
}

ThemeData theme() {
  return ThemeData(
    primaryColor: Colors.amber,
    inputDecorationTheme: const InputDecorationTheme(
        focusColor: Colors.amber,
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.amber, width: 2))),
    listTileTheme: const ListTileThemeData(style: ListTileStyle.drawer),
    scaffoldBackgroundColor: const Color(0xffecf0f1),
    colorScheme: const ColorScheme.light(),
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(),
      backgroundColor: Colors.grey,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: Colors.white,
      backgroundColor: Colors.grey,
      hoverColor: Colors.green,
    ),
    fontFamily: "iranSans",
    // ignore: prefer_const_constructors
    tooltipTheme: TooltipThemeData(
      preferBelow: false,
    ),
  );
}
