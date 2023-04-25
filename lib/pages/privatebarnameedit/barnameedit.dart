import 'package:flutter/material.dart';
import 'mypage.dart';

class Barnameedit extends StatelessWidget {
  static String routename = '/parvandeedit';
  final int? noteId;
  const Barnameedit({super.key, this.noteId});

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
