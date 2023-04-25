import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/privateparvandehaedit/parvandeedit.dart';
import '../pages/HomePage/myhomepage.dart';
import '../pages/sabtparvande/sabtparvande.dart';
import '../pages/parvandeha/parvandeha.dart';
import '../pages/etelatmovakelin/etelatmovakelin.dart';
import '../pages/etelatkhande/etelatkhande.dart';
import '../pages/welcomepage/welcomepage.dart';
import '../pages/madarek/madarek.dart';
import '../pages/loginpage/loginpage.dart';

final Map<String, WidgetBuilder> routes = {
  Welcomescreen.routename: (context) => Welcomescreen(),
  MyHomePage.routename: (context) => MyHomePage(),
  SabtParvande.routename: (context) => const SabtParvande(),
  Parvandeha.routename: (context) => const Parvandeha(),
  Parvandeedit.routename: (context) => const Parvandeedit(),
  Etelatmovakelin.routename: (context) => const Etelatmovakelin(),
  Etelatkhande.routename: (context) => const Etelatkhande(),
  Madarek.routename: (context) => const Madarek(),
  Madarek.routename: (context) => const Loginpage(),
};
