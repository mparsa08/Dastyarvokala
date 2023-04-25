import 'package:flutter/material.dart';
import 'mypage.dart';

class Barnamehaftegi extends StatelessWidget {
  static String routename = '/barnamehaftegi';
  const Barnamehaftegi({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: MyPage(),
      ),
    );
  }
}
