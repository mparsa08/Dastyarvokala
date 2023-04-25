import 'package:flutter/material.dart';
import 'MyPage.dart';

class Parvandeha extends StatelessWidget {
  static String routename = '/parvandeha';
  const Parvandeha({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: MyPage(),
      ),
    );
  }
}
