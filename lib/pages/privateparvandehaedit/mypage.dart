// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/parvandeha/parvandeha.dart';
import '../../db/db.dart';
import '../../model/model_x.dart';

class MyPage extends StatefulWidget {
  final int? noteId;
  const MyPage({super.key, this.noteId});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  late Dav dav;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    refreshDavs();
  }

  refreshDavs() async {
    setState(() {
      isLoading = true;
    });
    dav = await MyDatabase.instance.readDav(widget.noteId);
    setState(() {
      isLoading = false;
    });
  }

  Widget deletebutton() => TextButton(
        onPressed: () async {
          final navigator = Navigator.of(context);
          await MyDatabase.instance.deleteDav(widget.noteId);
          navigator.push(
              MaterialPageRoute(builder: (context) => const Parvandeha()));
        },
        child: Container(
          width: 150,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            color: Colors.red,
          ),
          padding: const EdgeInsets.all(5),
          child: const Center(
            child: Text(
              'حذف پرونده',
              style: TextStyle(color: Colors.white70, fontSize: 20),
            ),
          ),
        ),
      );

  updateDatatoDataBase() async {
    final dav = const Dav().copy(
      id: widget.noteId,
      movakelFirstname: _MovakelContainerState.textEditingController1.text,
      movakelLastname: _MovakelContainerState.textEditingController2.text,
      movakelNamepedar: _MovakelContainerState.textEditingController3.text,
      movakelKodemeli:
          int.parse(_MovakelContainerState.textEditingController4.text),
      movakelShomareshenasname:
          int.parse(_MovakelContainerState.textEditingController5.text),
      movakelAddres: _MovakelContainerState.textEditingController6.text,
      movakelshomaretamas: _MovakelContainerState.textEditingController7.text,

      // KHANDE //

      khandeFirstname: _KhandeContainerState.textEditingController1.text,
      khandeLastname: _KhandeContainerState.textEditingController2.text,
      khandeNamepedar: _KhandeContainerState.textEditingController3.text,
      khandeKodemeli:
          int.parse(_KhandeContainerState.textEditingController4.text),
      khandeShomareshenasname:
          int.parse(_KhandeContainerState.textEditingController5.text),
      khandeAddres: _KhandeContainerState.textEditingController6.text,
      khandeshomaretamas: _KhandeContainerState.textEditingController7.text,

      // PARVANDE //

      parvandeShomareparvande:
          int.parse(_ParvandeContainerState.textEditingController1.text),
      parvandeShomareshobe:
          int.parse(_ParvandeContainerState.textEditingController2.text),
      parvandeNamekhande: _ParvandeContainerState.textEditingController3.text,
      parvandeMozooe: _ParvandeContainerState.textEditingController4.text,
      parvandeMojtamaghazayi:
          _ParvandeContainerState.textEditingController5.text,
      parvandeShomarebaygani:
          int.parse(_ParvandeContainerState.textEditingController6.text),
      parvandeKholaseparvande:
          _ParvandeContainerState.textEditingController7.text,

      // GHARARDAD//

      gharardadShomarevekalatname:
          int.parse(_GharardadContainerState.textEditingController1.text),
      gharardadTarikh: _GharardadContainerState.textEditingController2.text,
      gharardadMablaghkol:
          int.parse(_GharardadContainerState.textEditingController3.text),
      gharardadPishpardakht:
          int.parse(_GharardadContainerState.textEditingController4.text),
      gharardadTozihat: _GharardadContainerState.textEditingController5.text,

      // PARVANDDEJTAYI//

      parvandeEjrayiShomareparvandeejrayi:
          int.parse(ParvandeEjrayiContainerState.textEditingController1.text),
      parvandeEjrayiTozihat:
          ParvandeEjrayiContainerState.textEditingController2.text,
    );
    await MyDatabase.instance.updateDav(dav);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[350],
        appBar: AppBar(
          title: const Text(
            ' نمایش و ویرایش پرونده',
            style: TextStyle(color: Colors.yellow, fontSize: 20),
          ),
          elevation: 10,
          centerTitle: true,
        ),
        body: Directionality(
          textDirection: TextDirection.ltr,
          child: ListView(
            physics: const ScrollPhysics(parent: ClampingScrollPhysics()),
            padding: const EdgeInsets.all(5),
            children: [
              Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  children: [
                    MovakelContainer(
                      dav: dav,
                      boxtitle: 'مشخصات موکل',
                      formfiled1: 'نام',
                      textInputType1: TextInputType.name,
                      formfiled2: 'نام خانوادگی',
                      textInputType2: TextInputType.name,
                      formfiled3: 'نام پدر',
                      textInputType3: TextInputType.name,
                      formfiled4: 'کد ملی',
                      textInputType4: TextInputType.name,
                      formfiled5: 'شماره شناسنامه',
                      textInputType5: TextInputType.name,
                      formfiled6: 'آدرس',
                      textInputType6: TextInputType.name,
                      formfiled7: 'شماره تماس',
                      textInputType7: TextInputType.name,
                    ),
                    KhandeContainer(
                      dav: dav,
                      boxtitle: 'مشخصات خوانده',
                      formfiled1: 'نام',
                      textInputType1: TextInputType.name,
                      formfiled2: 'نام خانوادگی',
                      textInputType2: TextInputType.name,
                      formfiled3: 'نام پدر',
                      textInputType3: TextInputType.name,
                      formfiled4: 'کد ملی',
                      textInputType4: TextInputType.name,
                      formfiled5: 'شماره شناسنامه',
                      textInputType5: TextInputType.name,
                      formfiled6: 'آدرس',
                      textInputType6: TextInputType.name,
                      formfiled7: 'شماره تماس',
                      textInputType7: TextInputType.name,
                    ),
                    ParvandeContainer(
                      dav: dav,
                      boxtitle: 'اطلاعات پرونده',
                      formfiled1: 'شماره پرونده',
                      textInputType1: TextInputType.name,
                      formfiled2: 'شماره شعبه',
                      textInputType2: TextInputType.name,
                      formfiled3: 'نام خوانده',
                      textInputType3: TextInputType.name,
                      formfiled4: 'موضوع دعوی',
                      textInputType4: TextInputType.name,
                      formfiled5: 'مجتمع قضایی',
                      textInputType5: TextInputType.name,
                      formfiled6: 'شماره بایگانی',
                      textInputType6: TextInputType.name,
                      formfiled7: 'خلاصه پرونده',
                      textInputType7: TextInputType.name,
                    ),
                    GharardadContainer(
                      dav: dav,
                      boxtitle: 'اطلاعات قرارداد',
                      formfiled1: 'شماره وکالت نامه',
                      textInputType1: TextInputType.name,
                      formfiled2: 'تاریخ',
                      textInputType2: TextInputType.name,
                      formfiled3: 'مبلغ کل',
                      textInputType3: TextInputType.name,
                      formfiled4: 'پیش پرداخت',
                      textInputType4: TextInputType.name,
                      formfiled5: 'توضیحات',
                      textInputType5: TextInputType.name,
                    ),
                    ParvandeEjrayiContainer(
                      dav: dav,
                      boxtitle: 'اطلاعات پرونده اجرایی',
                      formfiled1: 'شماره پرونده اجرایی',
                      textInputType1: TextInputType.name,
                      formfiled2: 'توضیحات',
                      textInputType2: TextInputType.name,
                    ),
                    Row(children: <Widget>[
                      updatebutton(),
                      deletebutton(),
                    ]),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container updatebutton() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Center(
          child: TextButton(
        onPressed: () {
          setState(() async {
            final navigator = Navigator.of(context);
            await updateDatatoDataBase();
            navigator.pop();
          });
        },
        child: Container(
          width: 150,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              gradient: LinearGradient(
                  colors: [Color(0xFF000000), Color(0xFF0f9b0f)])),
          padding: const EdgeInsets.all(5),
          child: const Center(
              child: Text(
            'ثبت اطلاعات',
            style: TextStyle(color: Colors.white70, fontSize: 20),
          )),
        ),
      )),
    );
  }
}

class ParvandeEjrayiContainer extends StatefulWidget {
  final String? boxtitle;
  final String? formfiled1;
  final String? formfiled2;

  final TextInputType? textInputType1;
  final TextInputType? textInputType2;

  final bool enable1;
  final bool enable2;

  late Dav dav;

  ParvandeEjrayiContainer({
    Key? key,
    this.boxtitle,
    this.formfiled1,
    this.formfiled2,
    this.textInputType1,
    this.textInputType2,
    this.enable1 = true,
    this.enable2 = true,
    required this.dav,
  }) : super(key: key);

  @override
  State<ParvandeEjrayiContainer> createState() =>
      ParvandeEjrayiContainerState();
}

class ParvandeEjrayiContainerState extends State<ParvandeEjrayiContainer> {
  @override
  void initState() {
    super.initState();
    textEditingController1.text =
        widget.dav.parvandeEjrayiShomareparvandeejrayi.toString();
    textEditingController2.text = widget.dav.parvandeEjrayiTozihat.toString();
  }

  static final textEditingController1 = TextEditingController();
  static final textEditingController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[350],
      ),
      child: Column(
        children: [
          YellowBox(boxtitle: widget.boxtitle!),
          const Divider(
            color: Colors.black,
            height: 5,
            thickness: 1,
          ),
          Container(
            decoration: BoxDecoration(color: Colors.blue[100]),
            // height: 300,
            child: Column(
              children: [
                Row(
                  children: [
                    SelectTextFormField(
                      title: widget.formfiled1!,
                      textEditingController: textEditingController1,
                      textInputType: widget.textInputType1!,
                      enable: widget.enable1,
                    ),
                  ],
                ),
                Row(
                  children: [
                    SelectTextFormField(
                      title: widget.formfiled2!,
                      textEditingController: textEditingController2,
                      textInputType: widget.textInputType2!,
                      enable: widget.enable2,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GharardadContainer extends StatefulWidget {
  final String boxtitle;
  final String formfiled1;
  final String formfiled2;
  final String formfiled3;
  final String formfiled4;
  final String formfiled5;

  final TextInputType textInputType1;
  final TextInputType textInputType2;
  final TextInputType textInputType3;
  final TextInputType textInputType4;
  final TextInputType textInputType5;

  final bool enable1;
  final bool enable2;
  final bool enable3;
  final bool enable4;
  final bool enable5;

  late Dav dav;

  GharardadContainer({
    Key? key,
    required this.dav,
    required this.boxtitle,
    required this.formfiled1,
    required this.formfiled2,
    required this.formfiled3,
    required this.formfiled4,
    required this.formfiled5,
    required this.textInputType1,
    required this.textInputType2,
    required this.textInputType3,
    required this.textInputType4,
    required this.textInputType5,
    this.enable1 = true,
    this.enable2 = true,
    this.enable3 = true,
    this.enable4 = true,
    this.enable5 = true,
  }) : super(key: key);

  @override
  State<GharardadContainer> createState() => _GharardadContainerState();
}

class _GharardadContainerState extends State<GharardadContainer> {
  @override
  void initState() {
    super.initState();
    textEditingController1.text =
        widget.dav.gharardadShomarevekalatname.toString();
    textEditingController2.text = widget.dav.gharardadTarikh.toString();
    textEditingController3.text = widget.dav.gharardadMablaghkol.toString();
    textEditingController4.text = widget.dav.gharardadPishpardakht.toString();
    textEditingController5.text = widget.dav.gharardadTozihat.toString();
  }

  static final textEditingController1 = TextEditingController();
  static final textEditingController2 = TextEditingController();
  static final textEditingController3 = TextEditingController();
  static final textEditingController4 = TextEditingController();
  static final textEditingController5 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[350],
      ),
      child: Column(
        children: [
          YellowBox(boxtitle: widget.boxtitle),
          const Divider(
            color: Colors.black,
            height: 5,
            thickness: 1,
          ),
          Container(
            decoration: BoxDecoration(color: Colors.blue[100]),
            // height: 300,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    SelectTextFormField(
                      title: widget.formfiled1,
                      textEditingController: textEditingController1,
                      textInputType: widget.textInputType1,
                      enable: widget.enable1,
                    ),
                    SelectTextFormField(
                      title: widget.formfiled2,
                      textEditingController: textEditingController2,
                      textInputType: widget.textInputType2,
                      enable: widget.enable2,
                    ),
                    SelectTextFormField(
                      title: widget.formfiled3,
                      textEditingController: textEditingController3,
                      textInputType: widget.textInputType3,
                      enable: widget.enable3,
                    ),
                    SelectTextFormField(
                      title: widget.formfiled4,
                      textEditingController: textEditingController4,
                      textInputType: widget.textInputType4,
                      enable: widget.enable4,
                    ),
                  ],
                ),
                Row(
                  children: [
                    SelectTextFormField(
                      title: widget.formfiled5,
                      textEditingController: textEditingController5,
                      textInputType: widget.textInputType5,
                      enable: widget.enable5,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MovakelContainer extends StatefulWidget {
  final String? boxtitle;
  final String? formfiled1;
  final String? formfiled2;
  final String? formfiled3;
  final String? formfiled4;
  final String? formfiled5;
  final String? formfiled6;
  final String? formfiled7;

  final TextInputType? textInputType1;
  final TextInputType? textInputType2;
  final TextInputType? textInputType3;
  final TextInputType? textInputType4;
  final TextInputType? textInputType5;
  final TextInputType? textInputType6;
  final TextInputType? textInputType7;

  final bool enable1;
  final bool enable2;
  final bool enable3;
  final bool enable4;
  final bool enable5;
  final bool enable6;
  final bool enable7;

  late Dav dav;

  MovakelContainer({
    Key? key,
    required this.dav,
    this.boxtitle,
    this.formfiled1,
    this.formfiled2,
    this.formfiled3,
    this.formfiled4,
    this.formfiled5,
    this.formfiled6,
    this.formfiled7,
    this.textInputType1,
    this.textInputType2,
    this.textInputType3,
    this.textInputType4,
    this.textInputType5,
    this.textInputType6,
    this.textInputType7,
    this.enable1 = true,
    this.enable2 = true,
    this.enable3 = true,
    this.enable4 = true,
    this.enable5 = true,
    this.enable6 = true,
    this.enable7 = true,
  }) : super(key: key);

  @override
  State<MovakelContainer> createState() => _MovakelContainerState();
}

class _MovakelContainerState extends State<MovakelContainer> {
  static final textEditingController1 = TextEditingController();
  static final textEditingController2 = TextEditingController();
  static final textEditingController3 = TextEditingController();
  static final textEditingController4 = TextEditingController();
  static final textEditingController5 = TextEditingController();
  static final textEditingController6 = TextEditingController();
  static final textEditingController7 = TextEditingController();
  @override
  void initState() {
    super.initState();
    textEditingController1.text = widget.dav.movakelFirstname.toString();
    textEditingController2.text = widget.dav.movakelLastname.toString();
    textEditingController3.text = widget.dav.movakelNamepedar.toString();
    textEditingController4.text = widget.dav.movakelKodemeli.toString();
    textEditingController5.text =
        widget.dav.movakelShomareshenasname.toString();
    textEditingController6.text = widget.dav.movakelAddres.toString();
    textEditingController7.text = widget.dav.movakelshomaretamas.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[350],
      ),
      child: Column(
        children: [
          YellowBox(boxtitle: widget.boxtitle!),
          const Divider(
            color: Colors.black,
            height: 5,
            thickness: 1,
          ),
          Container(
            decoration: BoxDecoration(color: Colors.blue[100]),
            // height: 300,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    SelectTextFormField(
                      title: widget.formfiled1!,
                      textEditingController: textEditingController1,
                      textInputType: widget.textInputType1!,
                      enable: widget.enable1,
                    ),
                    SelectTextFormField(
                      title: widget.formfiled2!,
                      textEditingController: textEditingController2,
                      textInputType: widget.textInputType2!,
                      enable: widget.enable2,
                    ),
                    SelectTextFormField(
                      title: widget.formfiled3!,
                      textEditingController: textEditingController3,
                      textInputType: widget.textInputType3!,
                      enable: widget.enable3,
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    SelectTextFormField(
                      title: widget.formfiled4!,
                      textEditingController: textEditingController4,
                      textInputType: widget.textInputType4!,
                      enable: widget.enable4,
                    ),
                    SelectTextFormField(
                      title: widget.formfiled5!,
                      textEditingController: textEditingController5,
                      textInputType: widget.textInputType5!,
                      enable: widget.enable5,
                    ),
                    SelectTextFormField(
                      title: widget.formfiled6!,
                      textEditingController: textEditingController6,
                      textInputType: widget.textInputType6!,
                      enable: widget.enable6,
                    ),
                  ],
                ),
                Row(
                  children: [
                    SelectTextFormField(
                      title: widget.formfiled7!,
                      textEditingController: textEditingController7,
                      textInputType: widget.textInputType7!,
                      enable: widget.enable7,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class KhandeContainer extends StatefulWidget {
  final String? boxtitle;
  final String? formfiled1;
  final String? formfiled2;
  final String? formfiled3;
  final String? formfiled4;
  final String? formfiled5;
  final String? formfiled6;
  final String? formfiled7;

  final TextInputType? textInputType1;
  final TextInputType? textInputType2;
  final TextInputType? textInputType3;
  final TextInputType? textInputType4;
  final TextInputType? textInputType5;
  final TextInputType? textInputType6;
  final TextInputType? textInputType7;

  final bool enable1;
  final bool enable2;
  final bool enable3;
  final bool enable4;
  final bool enable5;
  final bool enable6;
  final bool enable7;

  late Dav dav;
  KhandeContainer({
    Key? key,
    required this.dav,
    this.boxtitle,
    this.formfiled1,
    this.formfiled2,
    this.formfiled3,
    this.formfiled4,
    this.formfiled5,
    this.formfiled6,
    this.formfiled7,
    this.textInputType1,
    this.textInputType2,
    this.textInputType3,
    this.textInputType4,
    this.textInputType5,
    this.textInputType6,
    this.textInputType7,
    this.enable1 = true,
    this.enable2 = true,
    this.enable3 = true,
    this.enable4 = true,
    this.enable5 = true,
    this.enable6 = true,
    this.enable7 = true,
  }) : super(key: key);

  @override
  State<KhandeContainer> createState() => _KhandeContainerState();
}

class _KhandeContainerState extends State<KhandeContainer> {
  static final textEditingController1 = TextEditingController();
  static final textEditingController2 = TextEditingController();
  static final textEditingController3 = TextEditingController();
  static final textEditingController4 = TextEditingController();
  static final textEditingController5 = TextEditingController();
  static final textEditingController6 = TextEditingController();
  static final textEditingController7 = TextEditingController();

  @override
  void initState() {
    super.initState();
    textEditingController1.text = widget.dav.khandeFirstname.toString();
    textEditingController2.text = widget.dav.khandeLastname.toString();
    textEditingController3.text = widget.dav.khandeNamepedar.toString();
    textEditingController4.text = widget.dav.khandeKodemeli.toString();
    textEditingController5.text = widget.dav.khandeShomareshenasname.toString();
    textEditingController6.text = widget.dav.khandeAddres.toString();
    textEditingController7.text = widget.dav.khandeshomaretamas.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[350],
      ),
      child: Column(
        children: [
          YellowBox(boxtitle: widget.boxtitle!),
          const Divider(
            color: Colors.black,
            height: 5,
            thickness: 1,
          ),
          Container(
            decoration: BoxDecoration(color: Colors.blue[100]),
            // height: 300,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    SelectTextFormField(
                      title: widget.formfiled1!,
                      textEditingController: textEditingController1,
                      textInputType: widget.textInputType1!,
                      enable: widget.enable1,
                    ),
                    SelectTextFormField(
                      title: widget.formfiled2!,
                      textEditingController: textEditingController2,
                      textInputType: widget.textInputType2!,
                      enable: widget.enable2,
                    ),
                    SelectTextFormField(
                      title: widget.formfiled3!,
                      textEditingController: textEditingController3,
                      textInputType: widget.textInputType3!,
                      enable: widget.enable3,
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    SelectTextFormField(
                      title: widget.formfiled4!,
                      textEditingController: textEditingController4,
                      textInputType: widget.textInputType4!,
                      enable: widget.enable4,
                    ),
                    SelectTextFormField(
                      title: widget.formfiled5!,
                      textEditingController: textEditingController5,
                      textInputType: widget.textInputType5!,
                      enable: widget.enable5,
                    ),
                    SelectTextFormField(
                      title: widget.formfiled6!,
                      textEditingController: textEditingController6,
                      textInputType: widget.textInputType6!,
                      enable: widget.enable6,
                    ),
                  ],
                ),
                Row(
                  children: [
                    SelectTextFormField(
                      title: widget.formfiled7!,
                      textEditingController: textEditingController7,
                      textInputType: widget.textInputType7!,
                      enable: widget.enable7,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ParvandeContainer extends StatefulWidget {
  final String? boxtitle;
  final String? formfiled1;
  final String? formfiled2;
  final String? formfiled3;
  final String? formfiled4;
  final String? formfiled5;
  final String? formfiled6;
  final String? formfiled7;

  final TextInputType? textInputType1;
  final TextInputType? textInputType2;
  final TextInputType? textInputType3;
  final TextInputType? textInputType4;
  final TextInputType? textInputType5;
  final TextInputType? textInputType6;
  final TextInputType? textInputType7;

  final bool enable1;
  final bool enable2;
  final bool enable3;
  final bool enable4;
  final bool enable5;
  final bool enable6;
  final bool enable7;

  late Dav dav;

  ParvandeContainer({
    Key? key,
    required this.dav,
    this.boxtitle,
    this.formfiled1,
    this.formfiled2,
    this.formfiled3,
    this.formfiled4,
    this.formfiled5,
    this.formfiled6,
    this.formfiled7,
    this.textInputType1,
    this.textInputType2,
    this.textInputType3,
    this.textInputType4,
    this.textInputType5,
    this.textInputType6,
    this.textInputType7,
    this.enable1 = false,
    this.enable2 = true,
    this.enable3 = true,
    this.enable4 = true,
    this.enable5 = true,
    this.enable6 = true,
    this.enable7 = true,
  }) : super(key: key);

  @override
  State<ParvandeContainer> createState() => _ParvandeContainerState();
}

class _ParvandeContainerState extends State<ParvandeContainer> {
  static final textEditingController1 = TextEditingController();
  static final textEditingController2 = TextEditingController();
  static final textEditingController3 = TextEditingController();
  static final textEditingController4 = TextEditingController();
  static final textEditingController5 = TextEditingController();
  static final textEditingController6 = TextEditingController();
  static final textEditingController7 = TextEditingController();

  @override
  void initState() {
    super.initState();
    textEditingController1.text = widget.dav.parvandeShomareparvande.toString();
    textEditingController2.text = widget.dav.parvandeShomareshobe.toString();
    textEditingController3.text = widget.dav.parvandeNamekhande.toString();
    textEditingController4.text = widget.dav.parvandeMozooe.toString();
    textEditingController5.text = widget.dav.parvandeMojtamaghazayi.toString();
    textEditingController6.text = widget.dav.parvandeShomarebaygani.toString();
    textEditingController7.text = widget.dav.parvandeKholaseparvande.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[350],
      ),
      child: Column(
        children: [
          YellowBox(boxtitle: widget.boxtitle!),
          const Divider(
            color: Colors.black,
            height: 5,
            thickness: 1,
          ),
          Container(
            decoration: BoxDecoration(color: Colors.blue[100]),
            // height: 300,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    SelectTextFormField(
                      title: widget.formfiled1!,
                      textEditingController: textEditingController1,
                      textInputType: widget.textInputType1!,
                      enable: widget.enable1,
                    ),
                    SelectTextFormField(
                      title: widget.formfiled2!,
                      textEditingController: textEditingController2,
                      textInputType: widget.textInputType2!,
                      enable: widget.enable2,
                    ),
                    SelectTextFormField(
                      title: widget.formfiled3!,
                      textEditingController: textEditingController3,
                      textInputType: widget.textInputType3!,
                      enable: widget.enable3,
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    SelectTextFormField(
                      title: widget.formfiled4!,
                      textEditingController: textEditingController4,
                      textInputType: widget.textInputType4!,
                      enable: widget.enable4,
                    ),
                    SelectTextFormField(
                      title: widget.formfiled5!,
                      textEditingController: textEditingController5,
                      textInputType: widget.textInputType5!,
                      enable: widget.enable5,
                    ),
                    SelectTextFormField(
                      title: widget.formfiled6!,
                      textEditingController: textEditingController6,
                      textInputType: widget.textInputType6!,
                      enable: widget.enable6,
                    ),
                  ],
                ),
                Row(
                  children: [
                    SelectTextFormField(
                      title: widget.formfiled7!,
                      textEditingController: textEditingController7,
                      textInputType: widget.textInputType7!,
                      enable: widget.enable7,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class YellowBox extends StatelessWidget {
  const YellowBox({
    Key? key,
    required this.boxtitle,
  }) : super(key: key);

  final String boxtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      height: 30,
      child: Center(child: FixTextSmall(text: boxtitle)),
    );
  }
}

class SelectTextFormField extends StatelessWidget {
  final String title;
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final Function Function()? func;
  final bool enable;
  const SelectTextFormField({
    Key? key,
    required this.title,
    required this.textEditingController,
    required this.textInputType,
    this.enable = true,
    this.func,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(8),
        width: 50,
        child: TextFormField(
          onEditingComplete: func,
          enabled: enable,
          enableInteractiveSelection: enable,
          keyboardType: textInputType,
          controller: textEditingController,
          decoration: InputDecoration(
            enabled: false,
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            label: FixTextBig(text: title),
          ),
        ),
      ),
    );
  }
}

class FixTextSmall extends StatelessWidget {
  final String text;
  const FixTextSmall({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 16),
    );
  }
}

class FixTextBig extends StatelessWidget {
  final String text;
  const FixTextBig({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '$text:',
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 12),
    );
  }
}
