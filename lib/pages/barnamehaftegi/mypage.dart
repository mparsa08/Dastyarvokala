// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/HomePage/myhomepage.dart';
import 'package:flutter_application_1/pages/privatebarnameedit/barnameedit.dart';
import 'package:flutter_application_1/pages/privatesabtbarname/sabtbarname.dart';
import '../../db/db_alarm.dart';
import '../../model/model_alarm.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  List<Alarm?>? alarm;
  bool isLoading = false;
  static bool isLoading2 = false;
  int index = 1;

  @override
  void initState() {
    refreshAlarms();
    super.initState();
  }

  refreshAlarms() async {
    setState(() {
      isLoading = true;
    });
    await AlarmDataBase.instance.readAllAlarm().then((value) => alarm = value);
    setState(() {
      isLoading = false;
    });
    setState(() {
      isLoading2 = true;
    });
    setState(() {
      isLoading2 = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              InkWell(
                onTap: () async {
                  await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: ((context) => const Sabtbarnamehaftegi()),
                    ),
                  );
                  setState(() {
                    refreshAlarms();
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 5),
                  padding: const EdgeInsets.all(8),
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: const Center(
                    child: Text(
                      '+ ایجاد رویداد',
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              const TitleContainer(),
              const Arrowcontainer(),
            ],
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 5),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: const BorderRadius.all(Radius.circular(5))),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.amber[200],
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                      ),
                    ),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Row(
                        children: const <Widget>[
                          TopBarContainer(text: 'رویداد'),
                          TopBarContainer(text: 'تاریخ'),
                          TopBarContainer(text: 'نام موکل'),
                          TopBarContainer(
                            text: 'ش.پرونده',
                            fontsize: 10,
                          ),
                          TopBarContainer(
                            text: 'عنوان',
                            fontsize: 10,
                          ),
                          TopBarContainer(
                            text: 'محل مراجعه',
                            fontsize: 8,
                          ),
                          TopBarContainer(text: 'قاضی'),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 10,
                    child: FutureBuilder(
                      future: AlarmDataBase.instance.readAllAlarm(),
                      builder: ((context, snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        return isLoading
                            ? const Center(child: CircularProgressIndicator())
                            : isLoading2
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : alarm!.isEmpty
                                    ? const Center(
                                        child: Text(
                                          'پرونده ای ثبت نشده است!',
                                          textDirection: TextDirection.rtl,
                                        ),
                                      )
                                    : ListView.builder(
                                        itemCount: alarm!.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Directionality(
                                            textDirection: TextDirection.rtl,
                                            child: GestureDetector(
                                              onTap: () async {
                                                await Navigator.of(context)
                                                    .push(
                                                  MaterialPageRoute(
                                                    builder: ((context) {
                                                      return Barnameedit(
                                                        noteId:
                                                            alarm![index]!.id,
                                                      );
                                                    }),
                                                  ),
                                                );
                                                setState(() {
                                                  refreshAlarms();
                                                });
                                              },
                                              child: ListBuildercustome(
                                                alarm: alarm,
                                                index: index,
                                                txt1: alarm![index]!
                                                    .tarikh
                                                    .toString(),
                                                txt2: alarm![index]!
                                                    .movakelname
                                                    .toString(),
                                                txt3: alarm![index]!
                                                    .shomareparvande!
                                                    .toString(),
                                                txt4: alarm![index]!
                                                    .onvan
                                                    .toString(),
                                                txt5: alarm![index]!
                                                    .mahalmoraje
                                                    .toString(),
                                                txt6: alarm![index]!
                                                    .ghazi
                                                    .toString(),
                                                txtradif:
                                                    (index + 1).toString(),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Sakhtbarnamecontainer extends StatefulWidget {
  const Sakhtbarnamecontainer({
    Key? key,
  }) : super(key: key);

  @override
  State<Sakhtbarnamecontainer> createState() => _SakhtbarnamecontainerState();
}

class _SakhtbarnamecontainerState extends State<Sakhtbarnamecontainer> {
  bool isLoading = false;
  List<Alarm?>? alarm;

  @override
  void initState() {
    refreshAlarms();
    super.initState();
  }

  refreshAlarms() async {
    setState(() {
      isLoading = true;
    });
    await AlarmDataBase.instance.readAllAlarm().then((value) => alarm = value);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await Navigator.of(context).push(
          MaterialPageRoute(
            builder: ((context) => const Sabtbarnamehaftegi()),
          ),
        );
        setState(() {
          refreshAlarms();
        });
      },
      child: Container(
        margin: const EdgeInsets.only(top: 5),
        padding: const EdgeInsets.all(8),
        height: 50,
        decoration: const BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: const Center(
          child: Text(
            '+ ایجاد رویداد',
            textDirection: TextDirection.rtl,
          ),
        ),
      ),
    );
  }
}

class Arrowcontainer extends StatefulWidget {
  const Arrowcontainer({
    Key? key,
  }) : super(key: key);

  @override
  State<Arrowcontainer> createState() => _ArrowcontainerState();
}

class _ArrowcontainerState extends State<Arrowcontainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      padding: const EdgeInsets.all(8),
      height: 50,
      decoration: const BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(5), bottomRight: Radius.circular(5)),
      ),
      child: InkWell(
          onTap: () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()),
                (Route<dynamic> route) => false,
              ),
          child: const Center(child: Icon(Icons.arrow_back))),
    );
  }
}

class ListBuildercustome extends StatefulWidget {
  final String txtradif;
  final String txt1;
  final String txt2;
  final String txt3;
  final String txt4;
  final String txt5;
  final String txt6;
  final int index;
  List<Alarm?>? alarm;
  ListBuildercustome({
    Key? key,
    required this.txtradif,
    required this.txt1,
    required this.txt2,
    required this.txt3,
    required this.txt4,
    required this.txt5,
    required this.txt6,
    required this.index,
    required this.alarm,
  }) : super(key: key);

  @override
  State<ListBuildercustome> createState() => _ListBuildercustomeState();
}

class _ListBuildercustomeState extends State<ListBuildercustome> {
  bool isLoading = false;
  refreshAlarms() async {
    setState(() {
      isLoading = true;
    });
    await AlarmDataBase.instance
        .readAllAlarm()
        .then((value) => widget.alarm = value);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    refreshAlarms();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RowBuilder(
          txtradif: widget.txtradif,
          txt1: widget.txt1,
          txt2: widget.txt2,
          txt3: widget.txt3,
          txt4: widget.txt4,
          txt5: widget.txt5,
          txt6: widget.txt6,
        ),
      ],
    );
  }
}

class RowBuilder extends StatelessWidget {
  final String txtradif;
  final String txt1;
  final String txt2;
  final String txt3;
  final String txt4;
  final String txt5;
  final String txt6;
  const RowBuilder({
    Key? key,
    required this.txtradif,
    required this.txt1,
    required this.txt2,
    required this.txt3,
    required this.txt4,
    required this.txt5,
    required this.txt6,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BarContainer(txt: txtradif),
        BarContainer(
          txt: txt1,
          fontsize: 7.1,
          fontWeight: FontWeight.bold,
        ),
        BarContainer(txt: txt2),
        BarContainer(txt: txt3),
        BarContainer(txt: txt4),
        BarContainer(txt: txt5),
        BarContainer(txt: txt6),
      ],
    );
  }
}

class BarContainer extends StatelessWidget {
  final String txt;
  final double fontsize;
  final FontWeight? fontWeight;
  const BarContainer({
    Key? key,
    required this.txt,
    this.fontsize = 10,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1.7,
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
          ),
          child: Center(
            child: Text(
              txt,
              style: TextStyle(fontSize: fontsize, fontWeight: fontWeight),
              overflow: TextOverflow.clip,
              textDirection: TextDirection.rtl,
              softWrap: false,
            ),
          ),
        ),
      ),
    );
  }
}

class TopBarContainer extends StatelessWidget {
  final String text;
  final double fontsize;
  const TopBarContainer({
    Key? key,
    required this.text,
    this.fontsize = 12,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1.7,
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: Center(
              child: Text(
            text,
            style: TextStyle(fontSize: fontsize),
          )),
        ),
      ),
    );
  }
}

class TitleContainer extends StatefulWidget {
  const TitleContainer({
    Key? key,
  }) : super(key: key);

  @override
  State<TitleContainer> createState() => _TitleContainerState();
}

class _TitleContainerState extends State<TitleContainer> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(top: 5),
        padding: const EdgeInsets.all(8),
        height: 50,
        decoration: const BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5), bottomLeft: Radius.circular(5)),
        ),
        child: const Center(child: Text('برنامه هفتگی')),
      ),
    );
  }
}
