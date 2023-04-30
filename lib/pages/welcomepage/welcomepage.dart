import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/HomePage/myhomepage.dart';
import 'package:flutter_application_1/pages/loginpage/loginpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Welcomescreen extends StatefulWidget {
  static String routename = '/';
  const Welcomescreen({super.key});

  @override
  State<Welcomescreen> createState() => _WelcomescreenState();
}

class _WelcomescreenState extends State<Welcomescreen> {
  bool animate = false;
  late bool? active;

  getprefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    active = prefs.getBool('active');
  }

  @override
  void initState() {
    super.initState();
    getprefs();
    startanimation();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 1600),
            top: animate ? 5 : -30,
            right: animate ? 5 : -30,
            child: const Image(
              width: 100,
              height: 100,
              image: AssetImage('assets/image/lawerLogo.png'),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 1600),
            top: 200,
            right: animate ? 30 : -80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'دستیــار امــور وکلـا',
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      wordSpacing: 5),
                ),
                Text(
                  'یک منشی در جیب شما...',
                  textDirection: TextDirection.rtl,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
          ),
          Positioned(
              bottom: 40,
              left: 30,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.amberAccent[400],
              )),
        ]),
      ),
    );
  }

  Future startanimation() async {
    final navigator = Navigator.of(context);
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      animate = true;
    });
    await Future.delayed(const Duration(milliseconds: 5000));
    if (active == false || active == null) {
      navigator.pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const Loginpage()),
          (route) => false);
    } else {
      navigator.pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => MyHomePage()),
          (route) => false);
    }
  }
}
