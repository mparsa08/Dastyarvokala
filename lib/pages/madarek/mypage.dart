// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/HomePage/myhomepage.dart';
import '../../db/db.dart';
import '../../model/model_x.dart';
import 'package:camera/camera.dart';
import '../../take_picture_screen.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  List<Dav?>? dav;
  bool isLoading = false;
  int index = 1;
  late CameraDescription firstCamera;

  @override
  void initState() {
    refreshDavs();
    initialcamera();
    super.initState();
  }

  initialcamera() async {
    final cameras = await availableCameras();
    firstCamera = cameras.first;
  }

  refreshDavs() async {
    setState(() {
      isLoading = true;
    });
    await MyDatabase.instance.readAllDav().then((value) => dav = value);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Row(
            children: const <Widget>[
              TitleContainer(),
              Arrowcontainer(),
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
                          TopBarContainer(text: 'ردیف'),
                          TopBarContainer(text: 'موکل'),
                          TopBarContainer(text: 'شعبه'),
                          TopBarContainer(text: 'خوانده'),
                          TopBarContainer(
                            text: 'م.قضایی',
                            fontsize: 10,
                          ),
                          TopBarContainer(
                            text: 'ش.پرونده',
                            fontsize: 10,
                          ),
                          TopBarContainer(text: 'موضوع'),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 10,
                    child: FutureBuilder(
                      future: MyDatabase.instance.readAllDav(),
                      builder: ((context, snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        return isLoading
                            ? const Center(child: CircularProgressIndicator())
                            : dav!.isEmpty
                                ? const Center(
                                    child: Text(
                                      'پرونده ای ثبت نشده است!',
                                      textDirection: TextDirection.rtl,
                                    ),
                                  )
                                : ListView.builder(
                                    itemCount: dav!.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: GestureDetector(
                                          onTap: () async {
                                            await Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: ((context) {
                                                  return CameraExampleHome(
                                                    camera: firstCamera,
                                                    albumname: dav![index]!
                                                        .movakelLastname,
                                                  );
                                                }),
                                              ),
                                            );
                                            setState(() {
                                              refreshDavs();
                                            });
                                          },
                                          onLongPress: () {
                                            AlertDialog(
                                              title: const Text(
                                                'آیا از پاک کردن پرونده موردنظر اطمینان دارید؟',
                                                textDirection:
                                                    TextDirection.rtl,
                                              ),
                                              actions: [
                                                ElevatedButton(
                                                  onPressed: () async {
                                                    final navigator =
                                                        Navigator.of(context);
                                                    await MyDatabase.instance
                                                        .deleteDav(index);
                                                    navigator.pop();
                                                  },
                                                  child: Container(
                                                    width: 100,
                                                    height: 100,
                                                    color: Colors.redAccent,
                                                    child: const Text('حذف'),
                                                  ),
                                                )
                                              ],
                                            );
                                          },
                                          child: ListBuildercustome(
                                            dav: dav,
                                            index: index,
                                            txt1: dav![index]!
                                                .movakelLastname
                                                .toString(),
                                            txt2: dav![index]!
                                                .parvandeShomareshobe
                                                .toString(),
                                            txt3: dav![index]!
                                                .khandeLastname!
                                                .toString(),
                                            txt4: dav![index]!
                                                .parvandeMojtamaghazayi
                                                .toString(),
                                            txt5: dav![index]!
                                                .parvandeShomareparvande
                                                .toString(),
                                            txt6: dav![index]!
                                                .parvandeMozooe
                                                .toString(),
                                            txtradif: (index + 1).toString(),
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
  List<Dav?>? dav;
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
    required this.dav,
  }) : super(key: key);

  @override
  State<ListBuildercustome> createState() => _ListBuildercustomeState();
}

class _ListBuildercustomeState extends State<ListBuildercustome> {
  bool isLoading = false;
  refreshDavs() async {
    setState(() {
      isLoading = true;
    });
    await MyDatabase.instance.readAllDav().then((value) => widget.dav = value);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    refreshDavs();
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
        BarContainer(txt: txt1),
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
  const BarContainer({
    Key? key,
    required this.txt,
    this.fontsize = 11,
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
              style: TextStyle(fontSize: fontsize),
              overflow: TextOverflow.ellipsis,
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
        child: const Center(child: Text('مدارک الصاقی')),
      ),
    );
  }
}
