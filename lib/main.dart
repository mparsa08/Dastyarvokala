import 'package:flutter_application_1/pages/welcomepage/welcomepage.dart';
import 'package:flutter_application_1/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pages/HomePage/myhomepage.dart';
import 'package:flutter/material.dart';
import 'notification_service.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyMainApp());
}

class MyMainApp extends StatefulWidget {
  const MyMainApp({super.key});

  @override
  State<MyMainApp> createState() => _MyMainAppState();
}

class _MyMainAppState extends State<MyMainApp> {
  late final NotificationService notificationService;
  @override
  void initState() {
    notificationService = NotificationService();
    listenToNotificationStream();
    notificationService.initializePlatformNotifications();
    getadminlogin();
    super.initState();
  }

  getadminlogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    MyHomePage.adminLogin2 = prefs.getBool('active') ?? false;
    print(MyHomePage.adminLogin2);
  }

  void listenToNotificationStream() =>
      notificationService.behaviorSubject.listen((payload) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const Welcomescreen()));
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme(),
      debugShowCheckedModeBanner: false,
      initialRoute: Welcomescreen.routename,
      routes: routes,
    );
  }
}
