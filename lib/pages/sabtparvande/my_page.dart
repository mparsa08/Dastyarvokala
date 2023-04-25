import 'package:flutter/material.dart';
import '../../db/db.dart';
import '../../model/model_x.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key, required title});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  String? text1;
  List<Dav?>? dav;

  int updateorsave() {
    int i = 0;
    for (i; i < dav!.length; i++) {
      //data jadid vared nashode va bayad Update shavad
      if (ParvandeContainer.textEditingController1.text ==
          dav![i]!.parvandeShomareparvande!.toString()) {
        return 0;
      }
    }
    return 1;
  }

  updateDatatoDataBase(int repeat) async {
    final dav = const Dav().copy(
      id: repeat,
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

      khandeFirstname: KhandeContainer.textEditingController1.text,
      khandeLastname: KhandeContainer.textEditingController2.text,
      khandeNamepedar: KhandeContainer.textEditingController3.text,
      khandeKodemeli: int.parse(KhandeContainer.textEditingController4.text),
      khandeShomareshenasname:
          int.parse(KhandeContainer.textEditingController5.text),
      khandeAddres: KhandeContainer.textEditingController6.text,
      khandeshomaretamas: KhandeContainer.textEditingController7.text,

      // PARVANDE //

      parvandeShomareparvande:
          int.parse(ParvandeContainer.textEditingController1.text),
      parvandeShomareshobe:
          int.parse(ParvandeContainer.textEditingController2.text),
      parvandeNamekhande: ParvandeContainer.textEditingController3.text,
      parvandeMozooe: ParvandeContainer.textEditingController4.text,
      parvandeMojtamaghazayi: ParvandeContainer.textEditingController5.text,
      parvandeShomarebaygani:
          int.parse(ParvandeContainer.textEditingController6.text),
      parvandeKholaseparvande: ParvandeContainer.textEditingController7.text,

      // GHARARDAD//

      gharardadShomarevekalatname:
          int.parse(GharardadContainer.textEditingController1.text),
      gharardadTarikh: GharardadContainer.textEditingController2.text,
      gharardadMablaghkol:
          int.parse(GharardadContainer.textEditingController3.text),
      gharardadPishpardakht:
          int.parse(GharardadContainer.textEditingController4.text),
      gharardadTozihat: GharardadContainer.textEditingController5.text,

      // PARVANDDEJTAYI//

      parvandeEjrayiShomareparvandeejrayi:
          int.parse(ParvandeEjrayiContainerState.textEditingController1.text),
      parvandeEjrayiTozihat:
          ParvandeEjrayiContainerState.textEditingController2.text,
    );
    await MyDatabase.instance.updateDav(dav);
  }

  saveDatatoDataBase() async {
    final dav = Dav(
      movakelFirstname: _MovakelContainerState.textEditingController1.text,
      movakelLastname: _MovakelContainerState.textEditingController2.text,
      movakelNamepedar: _MovakelContainerState.textEditingController3.text,
      movakelKodemeli:
          int.tryParse(_MovakelContainerState.textEditingController4.text),
      movakelShomareshenasname:
          int.tryParse(_MovakelContainerState.textEditingController5.text),
      movakelAddres: _MovakelContainerState.textEditingController6.text,
      movakelshomaretamas: _MovakelContainerState.textEditingController7.text,

      // KHANDE //

      khandeFirstname: KhandeContainer.textEditingController1.text,
      khandeLastname: KhandeContainer.textEditingController2.text,
      khandeNamepedar: KhandeContainer.textEditingController3.text,
      khandeKodemeli: int.tryParse(KhandeContainer.textEditingController4.text),
      khandeShomareshenasname:
          int.tryParse(KhandeContainer.textEditingController5.text),
      khandeAddres: KhandeContainer.textEditingController6.text,
      khandeshomaretamas: KhandeContainer.textEditingController7.text,

      // PARVANDE //

      parvandeShomareparvande:
          int.tryParse(ParvandeContainer.textEditingController1.text),
      parvandeShomareshobe:
          int.tryParse(ParvandeContainer.textEditingController2.text),
      parvandeNamekhande: ParvandeContainer.textEditingController3.text,
      parvandeMozooe: ParvandeContainer.textEditingController4.text,
      parvandeMojtamaghazayi: ParvandeContainer.textEditingController5.text,
      parvandeShomarebaygani:
          int.tryParse(ParvandeContainer.textEditingController6.text),
      parvandeKholaseparvande: ParvandeContainer.textEditingController7.text,

      // GHARARDAD//

      gharardadShomarevekalatname:
          int.tryParse(GharardadContainer.textEditingController1.text),
      gharardadTarikh: GharardadContainer.textEditingController2.text,
      gharardadMablaghkol:
          int.tryParse(GharardadContainer.textEditingController3.text),
      gharardadPishpardakht:
          int.tryParse(GharardadContainer.textEditingController4.text),
      gharardadTozihat: GharardadContainer.textEditingController5.text,

      // PARVANDDEJTAYI//

      parvandeEjrayiShomareparvandeejrayi: int.tryParse(
          ParvandeEjrayiContainerState.textEditingController1.text),
      parvandeEjrayiTozihat:
          ParvandeEjrayiContainerState.textEditingController2.text,
    );
    await MyDatabase.instance.create(dav);
  }

  @override
  void initState() {
    refreshDavs();
    super.initState();
  }

  refreshDavs() async {
    await MyDatabase.instance.readAllDav().then((value) => dav = value);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[350],
        appBar: AppBar(
          title: const Text(
            'پرونده جدید',
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
                    const MovakelContainer(
                      boxtitle: 'مشخصات موکل',
                      formfiled1: 'نام',
                      textInputType1: TextInputType.name,
                      formfiled2: 'نام خانوادگی',
                      textInputType2: TextInputType.name,
                      formfiled3: 'نام پدر',
                      textInputType3: TextInputType.name,
                      formfiled4: 'کد ملی',
                      textInputType4: TextInputType.number,
                      formfiled5: 'شماره شناسنامه',
                      textInputType5: TextInputType.number,
                      formfiled6: 'آدرس',
                      textInputType6: TextInputType.name,
                      formfiled7: 'شماره تماس',
                      textInputType7: TextInputType.number,
                    ),
                    const KhandeContainer(
                      boxtitle: 'مشخصات خوانده',
                      formfiled1: 'نام',
                      textInputType1: TextInputType.name,
                      formfiled2: 'نام خانوادگی',
                      textInputType2: TextInputType.name,
                      formfiled3: 'نام پدر',
                      textInputType3: TextInputType.name,
                      formfiled4: 'کد ملی',
                      textInputType4: TextInputType.number,
                      formfiled5: 'شماره شناسنامه',
                      textInputType5: TextInputType.number,
                      formfiled6: 'آدرس',
                      textInputType6: TextInputType.name,
                      formfiled7: 'شماره تماس',
                      textInputType7: TextInputType.number,
                    ),
                    const ParvandeContainer(
                      boxtitle: 'اطلاعات پرونده',
                      formfiled1: 'شماره پرونده',
                      textInputType1: TextInputType.number,
                      formfiled2: 'شماره شعبه',
                      textInputType2: TextInputType.number,
                      formfiled3: 'نام خوانده',
                      textInputType3: TextInputType.name,
                      formfiled4: 'موضوع دعوی',
                      textInputType4: TextInputType.name,
                      formfiled5: 'مجتمع قضایی',
                      textInputType5: TextInputType.name,
                      formfiled6: 'شماره بایگانی',
                      textInputType6: TextInputType.number,
                      formfiled7: 'خلاصه پرونده',
                      textInputType7: TextInputType.name,
                    ),
                    const GharardadContainer(
                      boxtitle: 'اطلاعات قرارداد',
                      formfiled1: 'شماره وکالت نامه',
                      textInputType1: TextInputType.number,
                      formfiled2: 'تاریخ',
                      textInputType2: TextInputType.datetime,
                      formfiled3: 'مبلغ کل',
                      textInputType3: TextInputType.number,
                      formfiled4: 'پیش پرداخت',
                      textInputType4: TextInputType.number,
                      formfiled5: 'توضیحات',
                      textInputType5: TextInputType.multiline,
                    ),
                    const ParvandeEjrayiContainer(
                      boxtitle: 'اطلاعات پرونده اجرایی',
                      formfiled1: 'شماره پرونده اجرایی',
                      textInputType1: TextInputType.number,
                      formfiled2: 'توضیحات',
                      textInputType2: TextInputType.multiline,
                    ),
                    savebutton(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container savebutton() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Center(
          child: TextButton(
        onPressed: () {
          if (_MovakelContainerState.formGlobalKey1.currentState!.validate() &&
              _MovakelContainerState.formGlobalKey2.currentState!.validate() &&
              KhandeContainer.formGlobalKey1.currentState!.validate() &&
              KhandeContainer.formGlobalKey2.currentState!.validate() &&
              ParvandeContainer.formGlobalKey1.currentState!.validate()) {
            setState(
              () {
                if (updateorsave() == 1) {
                  saveDatatoDataBase();
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      behavior: SnackBarBehavior.fixed,
                      elevation: 12,
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      duration: const Duration(seconds: 5),
                      content: Text(
                        'اطلاعات با موفقیت ثبت گردید.',
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.greenAccent[400]),
                      ),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      behavior: SnackBarBehavior.floating,
                      elevation: 12,
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      duration: const Duration(seconds: 2),
                      content: Text(
                        'شماره پرونده وارد شده تکراری است! لطفا شماره پرونده دیگری وارد کنید.',
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red[200]),
                      ),
                    ),
                  );
                }
              },
            );
          } else {
            return setState(
              () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    behavior: SnackBarBehavior.floating,
                    elevation: 12,
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    duration: const Duration(seconds: 2),
                    content: Text(
                      'لطفا فیلد های الزامی را کامل کنید!',
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.yellow[200]),
                    ),
                  ),
                );
              },
            );
          }
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

  const ParvandeEjrayiContainer({
    Key? key,
    this.boxtitle,
    this.formfiled1,
    this.formfiled2,
    this.textInputType1,
    this.textInputType2,
    this.enable1 = true,
    this.enable2 = true,
  }) : super(key: key);

  @override
  State<ParvandeEjrayiContainer> createState() =>
      ParvandeEjrayiContainerState();
}

class ParvandeEjrayiContainerState extends State<ParvandeEjrayiContainer> {
  static final textEditingController1 = TextEditingController();
  static final textEditingController2 = TextEditingController();

  @override
  void initState() {
    super.initState();
    textEditingController1.text = '0';
    textEditingController2.text = '';
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

  const GharardadContainer({
    Key? key,
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

  static final textEditingController1 = TextEditingController();
  static final textEditingController2 = TextEditingController();
  static final textEditingController3 = TextEditingController();
  static final textEditingController4 = TextEditingController();
  static final textEditingController5 = TextEditingController();

  @override
  State<GharardadContainer> createState() => _GharardadContainerState();
}

class _GharardadContainerState extends State<GharardadContainer> {
  @override
  void initState() {
    super.initState();
    GharardadContainer.textEditingController1.text = '0';
    GharardadContainer.textEditingController2.text = '';
    GharardadContainer.textEditingController3.text = '0';
    GharardadContainer.textEditingController4.text = '0';
    GharardadContainer.textEditingController5.text = '';
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
                      textEditingController:
                          GharardadContainer.textEditingController1,
                      textInputType: widget.textInputType1,
                      enable: widget.enable1,
                    ),
                    SelectTextFormField(
                      title: widget.formfiled2,
                      textEditingController:
                          GharardadContainer.textEditingController2,
                      textInputType: widget.textInputType2,
                      enable: widget.enable2,
                    ),
                    SelectTextFormField(
                      title: widget.formfiled3,
                      textEditingController:
                          GharardadContainer.textEditingController3,
                      textInputType: widget.textInputType3,
                      enable: widget.enable3,
                    ),
                    SelectTextFormField(
                      title: widget.formfiled4,
                      textEditingController:
                          GharardadContainer.textEditingController4,
                      textInputType: widget.textInputType4,
                      enable: widget.enable4,
                    ),
                  ],
                ),
                Row(
                  children: [
                    SelectTextFormField(
                      title: widget.formfiled5,
                      textEditingController:
                          GharardadContainer.textEditingController5,
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

  const MovakelContainer({
    Key? key,
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
  static final formGlobalKey1 = GlobalKey<FormState>();
  static final formGlobalKey2 = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    textEditingController1.text = '';
    textEditingController2.text = '';
    textEditingController3.text = '';
    textEditingController4.text = '0';
    textEditingController5.text = '0';
    textEditingController6.text = '';
    textEditingController7.text = '';
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
                      formGlobalKey: formGlobalKey1,
                      validator: true,
                      title: widget.formfiled1!,
                      textEditingController: textEditingController1,
                      textInputType: widget.textInputType1!,
                      enable: widget.enable1,
                    ),
                    SelectTextFormField(
                      formGlobalKey: formGlobalKey2,
                      validator: true,
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

  const KhandeContainer({
    Key? key,
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

  static final textEditingController1 = TextEditingController();
  static final textEditingController2 = TextEditingController();
  static final textEditingController3 = TextEditingController();
  static final textEditingController4 = TextEditingController();
  static final textEditingController5 = TextEditingController();
  static final textEditingController6 = TextEditingController();
  static final textEditingController7 = TextEditingController();
  static final formGlobalKey1 = GlobalKey<FormState>();
  static final formGlobalKey2 = GlobalKey<FormState>();

  @override
  State<KhandeContainer> createState() => _KhandeContainerState();
}

class _KhandeContainerState extends State<KhandeContainer> {
  @override
  void initState() {
    super.initState();
    KhandeContainer.textEditingController1.text = '';
    KhandeContainer.textEditingController2.text = '';
    KhandeContainer.textEditingController3.text = '';
    KhandeContainer.textEditingController4.text = '0';
    KhandeContainer.textEditingController5.text = '0';
    KhandeContainer.textEditingController6.text = '';
    KhandeContainer.textEditingController7.text = '';
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
                      formGlobalKey: KhandeContainer.formGlobalKey1,
                      validator: true,
                      title: widget.formfiled1!,
                      textEditingController:
                          KhandeContainer.textEditingController1,
                      textInputType: widget.textInputType1!,
                      enable: widget.enable1,
                    ),
                    SelectTextFormField(
                      formGlobalKey: KhandeContainer.formGlobalKey2,
                      validator: true,
                      title: widget.formfiled2!,
                      textEditingController:
                          KhandeContainer.textEditingController2,
                      textInputType: widget.textInputType2!,
                      enable: widget.enable2,
                    ),
                    SelectTextFormField(
                      title: widget.formfiled3!,
                      textEditingController:
                          KhandeContainer.textEditingController3,
                      textInputType: widget.textInputType3!,
                      enable: widget.enable3,
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    SelectTextFormField(
                      title: widget.formfiled4!,
                      textEditingController:
                          KhandeContainer.textEditingController4,
                      textInputType: widget.textInputType4!,
                      enable: widget.enable4,
                    ),
                    SelectTextFormField(
                      title: widget.formfiled5!,
                      textEditingController:
                          KhandeContainer.textEditingController5,
                      textInputType: widget.textInputType5!,
                      enable: widget.enable5,
                    ),
                    SelectTextFormField(
                      title: widget.formfiled6!,
                      textEditingController:
                          KhandeContainer.textEditingController6,
                      textInputType: widget.textInputType6!,
                      enable: widget.enable6,
                    ),
                  ],
                ),
                Row(
                  children: [
                    SelectTextFormField(
                      title: widget.formfiled7!,
                      textEditingController:
                          KhandeContainer.textEditingController7,
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

  const ParvandeContainer({
    Key? key,
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

  static final textEditingController1 = TextEditingController();
  static final textEditingController2 = TextEditingController();
  static final textEditingController3 = TextEditingController();
  static final textEditingController4 = TextEditingController();
  static final textEditingController5 = TextEditingController();
  static final textEditingController6 = TextEditingController();
  static final textEditingController7 = TextEditingController();
  static final formGlobalKey1 = GlobalKey<FormState>();

  @override
  State<ParvandeContainer> createState() => _ParvandeContainerState();
}

class _ParvandeContainerState extends State<ParvandeContainer> {
  @override
  void initState() {
    super.initState();
    ParvandeContainer.textEditingController1.text = '';
    ParvandeContainer.textEditingController2.text = '0';
    ParvandeContainer.textEditingController3.text = '';
    ParvandeContainer.textEditingController4.text = '';
    ParvandeContainer.textEditingController5.text = '';
    ParvandeContainer.textEditingController6.text = '0';
    ParvandeContainer.textEditingController7.text = '';
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
                      formGlobalKey: ParvandeContainer.formGlobalKey1,
                      validator: true,
                      title: widget.formfiled1!,
                      textEditingController:
                          ParvandeContainer.textEditingController1,
                      textInputType: widget.textInputType1!,
                      enable: widget.enable1,
                    ),
                    SelectTextFormField(
                      title: widget.formfiled2!,
                      textEditingController:
                          ParvandeContainer.textEditingController2,
                      textInputType: widget.textInputType2!,
                      enable: widget.enable2,
                    ),
                    SelectTextFormField(
                      title: widget.formfiled3!,
                      textEditingController:
                          ParvandeContainer.textEditingController3,
                      textInputType: widget.textInputType3!,
                      enable: widget.enable3,
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    SelectTextFormField(
                      title: widget.formfiled4!,
                      textEditingController:
                          ParvandeContainer.textEditingController4,
                      textInputType: widget.textInputType4!,
                      enable: widget.enable4,
                    ),
                    SelectTextFormField(
                      title: widget.formfiled5!,
                      textEditingController:
                          ParvandeContainer.textEditingController5,
                      textInputType: widget.textInputType5!,
                      enable: widget.enable5,
                    ),
                    SelectTextFormField(
                      title: widget.formfiled6!,
                      textEditingController:
                          ParvandeContainer.textEditingController6,
                      textInputType: widget.textInputType6!,
                      enable: widget.enable6,
                    ),
                  ],
                ),
                Row(
                  children: [
                    SelectTextFormField(
                      title: widget.formfiled7!,
                      textEditingController:
                          ParvandeContainer.textEditingController7,
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
  final GlobalKey<FormState>? formGlobalKey;
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final bool enable;
  final bool validator;
  const SelectTextFormField({
    Key? key,
    this.formGlobalKey,
    required this.title,
    required this.textEditingController,
    required this.textInputType,
    this.enable = true,
    this.validator = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(8),
        width: 50,
        child: Form(
          key: formGlobalKey,
          child: TextFormField(
            autovalidateMode: AutovalidateMode.always,
            // ignore: body_might_complete_normally_nullable
            validator: (value) {
              if (validator == true) {
                if (value!.isEmpty) {
                  return 'فیلد الزامی!';
                }
              } else {
                return null;
              }
            },
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
