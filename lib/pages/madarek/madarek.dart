import 'package:flutter/material.dart';
import 'mypage.dart';

class Madarek extends StatelessWidget {
  static String routename = '/madarek';
  const Madarek({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: MyPage(),
      ),
    );
  }
}
