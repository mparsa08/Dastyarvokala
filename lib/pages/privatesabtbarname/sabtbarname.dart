// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'mypage.dart';

class Sabtbarnamehaftegi extends StatelessWidget {
  static String routename = '/Sabtbarnamehaftegi';
  final int? noteId;
  const Sabtbarnamehaftegi({super.key, this.noteId});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MyPage(noteId: noteId);
  }
}
