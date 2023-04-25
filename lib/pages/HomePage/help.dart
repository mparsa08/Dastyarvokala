import 'package:flutter/material.dart';

class Helper extends StatelessWidget {
  const Helper({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: const BoxDecoration(
          color: Colors.grey,
        ),
        child: const Image(
          alignment: Alignment.center,
          image: AssetImage('assets/image/00.png'),
          repeat: ImageRepeat.repeat,
          fit: BoxFit.cover,
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 80),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Expanded(
                    child: ClickColumn(
                      onvan: 'پرونده جدید',
                      tozihat:
                          'به قسمت پرونده جدید مراجعه نموده و پس از ثبت اطلاعات کلید ذخیره را فشار دهید. اطلاعات ثبت شده در قسمت پرونده ها قابل مشاهده است.',
                    ),
                  ),
                ],
              ),
              Row(
                children: const [
                  Expanded(
                    child: ClickColumn(
                      onvan: 'ویرایش اطلاعات',
                      tozihat:
                          '''پس از ثبت پرونده در قسمت پرونده ها،اطلاعات موکلین، و یا قسمت اطلاعات خوانده ها با لمس پرونده مورد نظر وارد صفحه ویرایش شده و در این قسمت عملیات ویرایش را انجام دهید و پس از اتمام کار کلید ثبت را فشار دهید.''',
                    ),
                  ),
                ],
              ),
              Row(
                children: const [
                  Expanded(
                    child: ClickColumn(
                        onvan: 'حذف قرار جلسه',
                        tozihat:
                            'جهت حذف قرار جلسه روی آن کلیک کرده و دکمه حذف را فشار دهید. '),
                  )
                ],
              ),
              Row(
                children: const [
                  Expanded(
                    child: ClickColumn(
                        onvan: 'افزودن تصویر',
                        tozihat:
                            'بعد از ثبت پرونده وارد قسمت مدارک الصاقی شده و با لمس پرونده مورد نظر میتوانید دوربین را انتخاب کنید و سپس بعد از فشار دادن دکمه ی صدا در تصویر از دوربین استفاده کنید، سپس شما میتوانید با فشردن دکمه ذخیره تصویر آن را در گالری خود با نام همان پرونده ثبت کنید. '),
                  )
                ],
              ),
              Row(
                children: const [
                  Expanded(
                    child: ClickColumn(
                        onvan: 'مشاهده تصویر الصاق شده',
                        tozihat:
                            'بعد از ثبت تصویر جهت مشاهده تصاویر وارد گالری خود شده و در قسمت البوم ها میتوانید مدارک مربوط به هر پرونده را مشاهده کنید. '),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}

class ClickColumn extends StatefulWidget {
  const ClickColumn({Key? key, required this.onvan, required this.tozihat})
      : super(key: key);
  final String onvan;
  final String tozihat;

  @override
  State<ClickColumn> createState() => _ClickColumnState();
}

class _ClickColumnState extends State<ClickColumn> {
  bool _first = true;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
        firstCurve: Curves.bounceIn,
        secondCurve: Curves.ease,
        firstChild: InkWell(
          onTap: () {
            setState(() {
              _first = !_first;
            });
          },
          child: onvanContainer(widget.onvan, 5),
        ),
        secondChild: InkWell(
          onTap: () {
            setState(() {
              _first = !_first;
            });
          },
          child: Column(
            children: [
              onvanContainer(widget.onvan, 0),
              Container(
                margin: const EdgeInsets.only(bottom: 5.0),
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                ),
                padding: const EdgeInsets.all(8),
                child: CustomFont(
                  onvan: widget.tozihat,
                  fontsize: 16,
                ),
              )
            ],
          ),
        ),
        crossFadeState:
            _first ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: const Duration(milliseconds: 100));
  }

  Container onvanContainer(String onvan, double bottom) {
    return Container(
        margin: EdgeInsets.only(bottom: bottom),
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: Colors.grey[200],
        ),
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.keyboard_arrow_down_sharp,
              size: 15,
            ),
            CustomFont(
              onvan: widget.onvan,
            ),
          ],
        ));
  }
}

class CustomFont extends StatelessWidget {
  String onvan;
  TextAlign? textAlign;
  double fontsize;
  CustomFont({
    Key? key,
    required this.onvan,
    this.textAlign = TextAlign.right,
    this.fontsize = 18,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      onvan,
      textDirection: TextDirection.rtl,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontsize,
      ),
    );
  }
}
