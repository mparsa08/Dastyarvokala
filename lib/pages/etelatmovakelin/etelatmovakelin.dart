import 'package:flutter/material.dart';
import 'mypage.dart';

class Etelatmovakelin extends StatelessWidget {
  static String routename = '/etelatmovakelin';
  const Etelatmovakelin({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: MyPage(),
      ),
    );
  }
}
