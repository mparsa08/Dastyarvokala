import 'package:flutter/material.dart';
import 'mypage.dart';

class Etelatkhande extends StatelessWidget {
  static String routename = '/etelatmovakelin';
  const Etelatkhande({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: MyPage(),
      ),
    );
  }
}
