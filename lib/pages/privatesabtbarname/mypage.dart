// ignore_for_file: depend_on_referenced_packages, must_be_immutable

import 'package:flutter/material.dart';
import '../../db/db_alarm.dart';
import '../../model/model_alarm.dart';
import 'package:persian_modal_date_picker/persian_date_picker.dart';
import 'package:shamsi_date/shamsi_date.dart';
import '../../notification_service.dart';

class MyPage extends StatefulWidget {
  final int? noteId;
  const MyPage({
    super.key,
    this.noteId,
  });

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  String? text1;
  Alarm? alarm;
  bool isLoading = false;
  bool istarikhshow = false;
  static late int zamann;
  static late int daghigheshomarprint;
  static late String saatshomareprint;

  Date? _selectedDate;

  String format(Date? d) {
    if (d == null) return '';
    final formatter = d.formatter;
    return '${formatter.d} ${formatter.mN} ${formatter.yyyy}';
  }

  void showDatePicker() async {
    await showPersianDatePicker(
      context,
      (context, Date date) async {
        setState(() {
          _selectedDate = date;
          tarikhcontroller.text = format(_selectedDate);
          istarikhshow = true;
        });

        Navigator.of(context).pop();
      },
      yearDirection: YearDirection.both,
      border: const BorderRadius.only(
          topRight: Radius.circular(15), topLeft: Radius.circular(15)),
      validate: (ctx, date) {
        return date.year >= 1399;
      },
      submitButtonStyle: defaultButtonsStyle.copyWith(
        text: 'انتخاب',
        backgroundColor: Colors.blueAccent,
        radius: 10,
      ),
    );
  }

  updateorsave() async {
    final navigator = Navigator.of(context);
    await saveDatatoDataBase();
    navigator.pop();
  }

  saveDatatoDataBase() async {
    _RoozjalaseContainerState.textEditingController7.text =
        "${_RoozjalaseContainerState.textEditingController7.text}(ساعت:${saatcontroller.text}:${daghighecontroller.text})";
    final alarm = Alarm(
      onvan: _RoozjalaseContainerState.textEditingController1.text,
      movakelname: _RoozjalaseContainerState.textEditingController2.text,
      mahalmoraje: _RoozjalaseContainerState.textEditingController3.text,
      tozihat: _RoozjalaseContainerState.textEditingController7.text,
      ghazi: _RoozjalaseContainerState.textEditingController4.text,
      shomareparvande: _RoozjalaseContainerState.textEditingController5.text,
      tarikh: format(_selectedDate),
    );
    await AlarmDataBase.instance.create(alarm);
  }

  updateDatatoDataBase(int? repeat) async {
    final alarm = const Alarm().copy(
      id: repeat,
      onvan: _RoozjalaseContainerState.textEditingController1.text,
      movakelname: _RoozjalaseContainerState.textEditingController2.text,
      mahalmoraje: _RoozjalaseContainerState.textEditingController3.text,
      tozihat: _RoozjalaseContainerState.textEditingController7.text,
      ghazi: _RoozjalaseContainerState.textEditingController4.text,
      shomareparvande: _RoozjalaseContainerState.textEditingController5.text,
      tarikh: format(_selectedDate),
    );
    await AlarmDataBase.instance.updateAlarm(alarm);
  }

  @override
  void initState() {
    super.initState();
    refreshDavs();
    tarikhcontroller.text = format(_selectedDate);
    saatcontroller.text = '';
    daghighecontroller.text = '';
  }

  notify() async {
    await NotificationService().showLocalNotification(
        id: 1,
        title: _RoozjalaseContainerState.textEditingController1.text,
        body: _RoozjalaseContainerState.textEditingController7.text,
        payload: '');
  }

  notifyzamani() async {
    await NotificationService().showScheduledLocalNotification(
        id: 2,
        title: _RoozjalaseContainerState.textEditingController1.text,
        body: _RoozjalaseContainerState.textEditingController7.text,
        payload: '',
        seconds: zaman(datetoint(_selectedDate!)));
  }

  int zaman(int tarikh) {
    int tarikhh = tarikh;
    int saat =
        (int.parse(saatcontroller.text) * 3600) - (DateTime.now().hour * 3600);
    int daghighe = (int.parse(daghighecontroller.text) * 60) -
        (DateTime.now().minute * 60);
    if (saat.isNegative) {
      saat = 24 * 3600 - saat.abs();
      saat = saat.abs();
    }
    if (saat == 0) {
      if (daghighe.isNegative) {
        if (int.parse(saatcontroller.text) == 0) {
          saat = 24 * 3600;
        } else {
          saat = (int.parse(saatcontroller.text) * 3600);
        }

        daghighe = daghighe.abs();
      }
    }
    int zaman = tarikhh + saat + daghighe;
    print(zaman);
    zamann = zaman;
    if (zamann <= 120 * 60) {
      daghigheshomarprint = zamann ~/ 60;
      saatshomareprint = 'دقیقه';
    } else {
      daghigheshomarprint = zamann ~/ 3600;
      saatshomareprint = 'ساعت';
    }
    print(DateTime.now());
    return zaman;
  }

  int datetoint(Date date) {
    Jalali jalali = Jalali.fromDateTime(DateTime.now());
    int dateseconds =
        (date.year * 31536000) + (date.month * 2628000) + (date.day * 86400);
    int nowseconds = (jalali.year * 31536000) +
        (jalali.month * 2628000) +
        (jalali.day * 86400);
    final int datetime = dateseconds - nowseconds;
    print(jalali);
    return datetime;
  }

  refreshDavs() async {
    setState(() {
      isLoading = true;
    });
    if (widget.noteId != null) {
      alarm = await AlarmDataBase.instance.readAlarm(widget.noteId);
    }
    setState(() {
      isLoading = false;
    });
  }

  static final saatcontroller = TextEditingController();
  static final daghighecontroller = TextEditingController();
  static final tarikhcontroller = TextEditingController();
  static final tarikhGlobalKey1 = GlobalKey<FormState>();
  static final saatformkey = GlobalKey<FormState>();
  static final daghigheformkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[350],
        appBar: AppBar(
          title: const Text(
            'رویداد جدید',
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
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey[350],
                      ),
                      child: Column(
                        children: [
                          const YellowBox(boxtitle: 'زمان جلسه'),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    AnimatedOpacity(
                                      opacity: istarikhshow ? 1 : 0,
                                      duration:
                                          const Duration(milliseconds: 500),
                                      child: SizedBox(
                                        width: 200,
                                        child: Form(
                                          autovalidateMode:
                                              AutovalidateMode.always,
                                          key: tarikhGlobalKey1,
                                          child: TextFormField(
                                            readOnly: true,
                                            controller: tarikhcontroller,
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'لطفا تاریخ را انتخاب کنید';
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () => showDatePicker(),
                                      child: const Text(
                                        'انتخاب تاریخ',
                                        textDirection: TextDirection.rtl,
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Text(
                                      'انتخاب زمان',
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 80,
                                      child: Form(
                                        autovalidateMode:
                                            AutovalidateMode.always,
                                        key: saatformkey,
                                        child: TextFormField(
                                          validator: ((value) {
                                            if (value != '') {
                                              if (int.parse(value.toString()) >
                                                      24 ||
                                                  int.parse(value.toString()) <
                                                      0) {
                                                return 'بین (0-24)';
                                              }
                                            } else {
                                              return '(0-24) ساعت';
                                            }
                                            return null;
                                          }),
                                          controller: saatcontroller,
                                          keyboardType: TextInputType.number,
                                          decoration: const InputDecoration(
                                            label: Text(
                                              '(24) ساعت',
                                              style: TextStyle(fontSize: 11),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    SizedBox(
                                      width: 80,
                                      child: Form(
                                        autovalidateMode:
                                            AutovalidateMode.always,
                                        key: daghigheformkey,
                                        child: TextFormField(
                                          validator: ((value) {
                                            if (value != '') {
                                              if (int.parse(value.toString()) >=
                                                      60 ||
                                                  int.parse(value.toString()) <
                                                      0) {
                                                return 'بین (0-59)';
                                              }
                                            } else {
                                              return '(0-59)دقیقه';
                                            }
                                            return null;
                                          }),
                                          controller: daghighecontroller,
                                          keyboardType: TextInputType.number,
                                          decoration: const InputDecoration(
                                              label: Text(
                                            'دقیقه',
                                            style: TextStyle(fontSize: 11),
                                          )),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    RoozjalaseContainer(
                      alarm: alarm,
                      noteId: widget.noteId,
                      boxtitle: 'اطلاعات روز جلسه',
                      formfiled1: 'عنوان',
                      textInputType1: TextInputType.name,
                      formfiled2: 'نام موکل',
                      textInputType2: TextInputType.name,
                      formfiled3: 'محل مراجعه',
                      textInputType3: TextInputType.name,
                      formfiled4: 'قاضی',
                      textInputType4: TextInputType.number,
                      formfiled5: 'شماره پرونده',
                      textInputType5: TextInputType.number,
                      formfiled7: 'توضیحات',
                      textInputType7: TextInputType.number,
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
          if (_RoozjalaseContainerState.formGlobalKey1.currentState!
                  .validate() &&
              tarikhGlobalKey1.currentState!.validate() &&
              saatformkey.currentState!.validate() &&
              daghigheformkey.currentState!.validate()) {
            updateorsave();
            notifyzamani();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                behavior: SnackBarBehavior.fixed,
                elevation: 12,
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                duration: const Duration(seconds: 5),
                content: Text(
                  'رویداد جدید با موفقیت ثبت گردید.\nآلارم برای $daghigheshomarprint $saatshomareprint بعد تنظیم شد',
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.greenAccent[400]),
                ),
              ),
            );
          } else {
            return setState(() {
              istarikhshow = true;
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
                        fontWeight: FontWeight.bold, color: Colors.yellow[200]),
                  ),
                ),
              );
            });
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

class RoozjalaseContainer extends StatefulWidget {
  final int? noteId;
  final String? boxtitle;
  final String? formfiled1;
  final String? formfiled2;
  final String? formfiled3;
  final String? formfiled4;
  final String? formfiled5;
  final String? formfiled7;

  final TextInputType? textInputType1;
  final TextInputType? textInputType2;
  final TextInputType? textInputType3;
  final TextInputType? textInputType4;
  final TextInputType? textInputType5;
  final TextInputType? textInputType7;

  final bool enable1;
  final bool enable2;
  final bool enable3;
  final bool enable4;
  final bool enable5;
  final bool enable6;
  final bool enable7;
  Alarm? alarm;

  RoozjalaseContainer(
      {Key? key,
      this.boxtitle,
      this.formfiled1,
      this.formfiled2,
      this.formfiled3,
      this.formfiled4,
      this.formfiled5,
      this.formfiled7,
      this.textInputType1,
      this.textInputType2,
      this.textInputType3,
      this.textInputType4,
      this.textInputType5,
      this.textInputType7,
      this.enable1 = true,
      this.enable2 = true,
      this.enable3 = true,
      this.enable4 = true,
      this.enable5 = true,
      this.enable6 = true,
      this.enable7 = true,
      this.noteId,
      required this.alarm})
      : super(key: key);

  @override
  State<RoozjalaseContainer> createState() => _RoozjalaseContainerState();
}

class _RoozjalaseContainerState extends State<RoozjalaseContainer> {
  static final textEditingController1 = TextEditingController();
  static final textEditingController2 = TextEditingController();
  static final textEditingController3 = TextEditingController();
  static final textEditingController4 = TextEditingController();
  static final textEditingController5 = TextEditingController();
  static var textEditingController7 = TextEditingController();
  static final formGlobalKey1 = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    if (widget.alarm != null) {
      textEditingController1.text = widget.alarm!.onvan!.toString();
    } else {
      textEditingController1.text = '';
    }

    textEditingController2.text = '';
    textEditingController3.text = '';
    textEditingController4.text = '';
    textEditingController5.text = '';
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
            validator: (value) {
              if (validator == true) {
                if (value!.isEmpty) {
                  return 'فیلد الزامی!';
                }
              } else {
                return null;
              }
              return null;
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
