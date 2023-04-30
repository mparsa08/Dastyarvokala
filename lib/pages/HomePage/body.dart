// ignore_for_file: must_be_immutable

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/HomePage/myhomepage.dart';
import 'package:flutter_application_1/pages/barnamehaftegi/barnamehaftegi.dart';
import 'package:flutter_application_1/pages/etelatkhande/etelatkhande.dart';
import 'package:flutter_application_1/pages/etelatmovakelin/etelatmovakelin.dart';
import 'package:flutter_application_1/pages/madarek/madarek.dart';
import 'package:flutter_application_1/pages/parvandeha/parvandeha.dart';
import '../sabtparvande/sabtparvande.dart';

class BodyOne extends StatefulWidget {
  BodyOne({
    super.key,
  });

  @override
  State<BodyOne> createState() => _BodyOneState();
}

class _BodyOneState extends State<BodyOne> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        textDirection: TextDirection.ltr,
        alignment: AlignmentDirectional.bottomStart,
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              color: Colors.grey,
              image: DecorationImage(
                repeat: ImageRepeat.repeatY,
                alignment: Alignment.topRight,
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/image/00.png',
                ),
              ),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: GridView.count(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 18,
                  childAspectRatio: 1.2,
                  children: <Widget>[
                    CreatContainer(
                        valid: true,
                        titleId: 1,
                        title: "ساخت پرونده",
                        pic: 'assets/image/SakhtParvande.png'),
                    CreatContainer(
                        valid: MyHomePage.adminLogin2!,
                        titleId: 2,
                        title: "پرونده ها",
                        pic: 'assets/image/Parvandeha.png'),
                    CreatContainer(
                        valid: MyHomePage.adminLogin2!,
                        titleId: 3,
                        font: 15,
                        title: "اطلاعات موکلین",
                        pic: 'assets/image/movakel.png'),
                    CreatContainer(
                        valid: MyHomePage.adminLogin2!,
                        titleId: 4,
                        font: 15,
                        title: "اطلاعات خوانده ها ",
                        pic: 'assets/image/khande1.png'),
                    CreatContainer(
                        valid: true,
                        titleId: 5,
                        font: 15,
                        title: "برنامه هفتگی",
                        pic: 'assets/image/barname.png'),
                    CreatContainer(
                      valid: true,
                      titleId: 6,
                      title: "مدارک الصاق شده",
                      pic: 'assets/image/pyvast.png',
                      font: 15,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CreatContainer extends StatefulWidget {
  late String title;
  late String pic;
  late int titleId;
  bool valid;

  double? font;
  CreatContainer({
    Key? key,
    required this.title,
    required this.pic,
    required this.titleId,
    required this.valid,
    this.font = 16,
  }) : super(key: key);

  @override
  State<CreatContainer> createState() => _CreatContainerState();
}

class _CreatContainerState extends State<CreatContainer> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.valid) {
          setState(() {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text(
              'برای منشی قابل دسترس نمیباشد!',
              textDirection: TextDirection.rtl,
            )));
          });
        } else {}
      },
      child: Opacity(
        opacity: widget.valid ? 1 : 0.2,
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(5),
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            image: DecorationImage(
              opacity: 0.7,
              scale: 10,
              fit: BoxFit.none,
              image: AssetImage(widget.pic),
            ),
            borderRadius: BorderRadius.circular(25),
            color: RColor().randomColor(),
          ),
          child: TextButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
            onPressed: () {
              if (widget.valid == true) {
                switch (widget.titleId) {
                  case 1:
                    Navigator.of(context)
                        .push(_customroute(const SabtParvande()));

                    break;
                  case 2:
                    Navigator.of(context)
                        .push(_customroute(const Parvandeha()));
                    break;
                  case 3:
                    Navigator.of(context)
                        .push(_customroute(const Etelatmovakelin()));
                    break;
                  case 4:
                    Navigator.of(context)
                        .push(_customroute(const Etelatkhande()));
                    break;
                  case 5:
                    Navigator.of(context)
                        .push(_customroute(const Barnamehaftegi()));
                    break;
                  case 6:
                    Navigator.of(context).push(_customroute(const Madarek()));
                    break;
                  default:
                    break;
                }
              } else {
                setState(() {
                  setState(() {
                    print('valid:${widget.valid}');
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                      'برای منشی قابل دسترس نمیباشد!',
                      textDirection: TextDirection.rtl,
                    )));
                  });
                });
              }
            },
            child: Center(
              child: Text(
                widget.title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: widget.font,
                ),
                textDirection: TextDirection.rtl,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Route _customroute(Widget routename) {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return routename;
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        transitionDuration: const Duration(seconds: 1));
  }
}

class RColor {
  Random rnd = Random();
  Color randomColor() {
    return Color.fromARGB(
        255, rnd.nextInt(255), rnd.nextInt(255), rnd.nextInt(255));
  }
}
