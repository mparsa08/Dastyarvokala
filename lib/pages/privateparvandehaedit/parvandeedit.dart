import 'package:flutter/material.dart';
import 'mypage.dart';

class Parvandeedit extends StatelessWidget {
  static String routename = '/parvandeedit';
  final int? noteId;
  const Parvandeedit({super.key, this.noteId});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: MyPage(
          noteId: noteId,
        ),
      ),
    );
  }
}
