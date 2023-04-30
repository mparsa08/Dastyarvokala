// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/HomePage/myhomepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Loginpage extends StatefulWidget {
  static String routename = '/Loginpage';
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  Color? signupColor = Colors.black;
  String loginorsignup = 'صفحــه ورود';
  bool _animatedcrossfadesignup = true;
  bool _animatedcrossfade = true;
  bool _animatedcrossfadecounter = true;
  TextEditingController monshiEditingController = TextEditingController();
  TextEditingController vakiluserEditingController = TextEditingController();
  TextEditingController vakilpassEditingController = TextEditingController();
  TextEditingController signup_user_EditingController = TextEditingController();
  static TextEditingController signup_pass_EditingController =
      TextEditingController();
  TextEditingController signup_repass_EditingController =
      TextEditingController();
  TextEditingController signup_name_EditingController = TextEditingController();
  TextEditingController signup_email_EditingController =
      TextEditingController();
  TextEditingController forgotpass_email_EditingController =
      TextEditingController();
  TextEditingController forgotpass_password_EditingController =
      TextEditingController();
  static final signup_username_formGlobalKey = GlobalKey<FormState>();
  static final signup_password_formGlobalKey = GlobalKey<FormState>();
  static final signup_realname_formGlobalKey = GlobalKey<FormState>();
  static final signup_email_formGlobalKey = GlobalKey<FormState>();
  static final signup_repassword_formGlobalKey = GlobalKey<FormState>();

  static final signUp_vakil_username_formGlobalKey = GlobalKey<FormState>();
  static final signUp_vakil_password_formGlobalKey = GlobalKey<FormState>();

  static final sigin_monshi_username_formGlobalKey = GlobalKey<FormState>();
  static final forgotpass_email_formGlobalKey = GlobalKey<FormState>();
  static final forgotpass_password_formGlobalKey = GlobalKey<FormState>();

  int signuporforgotcounter = 0;

  checkadminlogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    MyHomePage.adminLogin2 = prefs.getBool('active') ?? false;
    print(MyHomePage.adminLogin2);
  }

  saveuserdata(
      String username, String password, String? realname, String? email) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username);
    await prefs.setString('password', password);
    if (realname != null) {
      await prefs.setString('realname', realname);
    }
    if (email != null) {
      await prefs.setString('email', email);
    }
  }

  setnewpassword(String entered_user, String entered_password) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final username = prefs.getString('username');
    if (entered_user == username) {
      setState(() {
        final navigator = ScaffoldMessenger.of(context);
        setpassword(entered_password);
        navigator.showSnackBar(
            const SnackBar(content: Text('رمز با موفقیت تعویض گردید')));
      });
    }
  }

  checkuserdata(String entered_username, String entered_password) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final username = prefs.getString('username');
    final password = prefs.getString('password');
    if (entered_password == password && entered_username == username) {
      setState(() {
        MyHomePage().isloading = true;
      });
      setState(() {
        MyHomePage().isloading = false;
      });
      setState(() {
        setactive();

        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('ورود موفقیت آمیز')));
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => MyHomePage()),
            (route) => false);
      });
    } else {
      setState(() {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: SnackBar(
              content: Text('نام کاربری یا رمز عبور اشتباه است'),
            ),
          ),
        );
      });
    }
  }

  setactive() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('active', true);
    await checkadminlogin();
  }

  setadective() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('active', false);
    await checkadminlogin();
  }

  setpassword(String entered_password) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('password', entered_password);
  }

  @override
  void initState() {
    checkadminlogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
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
          Container(
            padding: const EdgeInsets.only(top: 60),
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 50),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.blueAccent,
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: Colors.black,
                                  spreadRadius: 2,
                                  blurRadius: 15,
                                  blurStyle: BlurStyle.outer,
                                )
                              ],
                            ),
                            child: SingleChildScrollView(
                              child: Stack(
                                children: [
                                  const Positioned(
                                    bottom: 0,
                                    left: 0,
                                    height: 200,
                                    child: Image(
                                      alignment: Alignment.bottomCenter,
                                      fit: BoxFit.cover,
                                      image:
                                          AssetImage('assets/image/cloud.png'),
                                    ),
                                  ),
                                  const Positioned(
                                    top: 0,
                                    right: 0,
                                    height: 200,
                                    child: Image(
                                      alignment: Alignment.topRight,
                                      fit: BoxFit.cover,
                                      image:
                                          AssetImage('assets/image/cloud2.png'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 30),
                                    child: Column(
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Text(
                                              'دستیار امور وکلا',
                                              style: TextStyle(
                                                  color: Colors.amber,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                              textDirection: TextDirection.rtl,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              loginorsignup,
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                              textDirection: TextDirection.rtl,
                                            ),
                                          ],
                                        ),
                                        AnimatedCrossFade(
                                          firstChild: vakilmonshiCrossFade(),
                                          secondChild: signuporforgot(
                                              signuporforgotcounter),
                                          crossFadeState:
                                              _animatedcrossfadesignup
                                                  ? CrossFadeState.showFirst
                                                  : CrossFadeState.showSecond,
                                          duration:
                                              const Duration(milliseconds: 100),
                                        ),
                                        signUp(),
                                        const SizedBox(height: 8),
                                        forgetpassword(),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
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

  Row signUp() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Opacity(
          opacity: _animatedcrossfadesignup ? 1 : 0,
          child: GestureDetector(
            onTap: (() {
              setState(() {
                signupColor = Colors.black;
                _animatedcrossfadesignup = false;
                loginorsignup = 'صفحــه ثبت نام';
                signuporforgotcounter = 0;
              });
            }),
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Text(
                'ساخت حساب کاربری',
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  color: signupColor,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row forgetpassword() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Opacity(
          opacity: _animatedcrossfadesignup ? 1 : 0,
          child: GestureDetector(
            onTap: (() {
              setState(() {
                signupColor = Colors.purple;
                _animatedcrossfadesignup = false;
                loginorsignup = 'صفحــه ثبت نام';
                signuporforgotcounter = 1;
              });
            }),
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Text(
                'فراموشی رمز عبور',
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  color: signupColor,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget signuporforgot(int counter) {
    if (counter == 0) {
      return signupCrossFade();
    } else {
      return forgetpasswordCrossFade();
    }
  }

  Container forgetpasswordCrossFade() {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomForm1(
              validator: true,
              formGlobalKey: forgotpass_email_formGlobalKey,
              monshiEditingController: forgotpass_email_EditingController,
              hint: 'نام کاربری خود را وارد کنید'),
          CustomForm1(
              validator: true,
              formGlobalKey: forgotpass_password_formGlobalKey,
              monshiEditingController: forgotpass_password_EditingController,
              hint: 'رمزعبور جدید را وارد کنید'),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  if (forgotpass_email_formGlobalKey.currentState!.validate() &&
                      forgotpass_password_formGlobalKey.currentState!
                          .validate()) {
                    await setnewpassword(
                        forgotpass_email_EditingController.text,
                        forgotpass_password_EditingController.text);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                      'نام کاربری صحیح نمیباشد!',
                      textDirection: TextDirection.rtl,
                    )));
                  }
                },
                child: const Text('ورود'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _animatedcrossfadesignup = true;
                    loginorsignup = 'صفحــه ورود';
                    signup_user_EditingController.clear();
                    signup_email_EditingController.clear();
                    signup_pass_EditingController.clear();
                    signup_repass_EditingController.clear();
                    signup_name_EditingController.clear();
                  });
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red)),
                child: const Icon(
                  Icons.arrow_back_outlined,
                  size: 20,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Container signupCrossFade() {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomForm1(
              formGlobalKey: signup_realname_formGlobalKey,
              monshiEditingController: signup_name_EditingController,
              hint: 'نام و نام خانوادگی وکیل'),
          CustomForm1(
              formGlobalKey: signup_username_formGlobalKey,
              validator: true,
              monshiEditingController: signup_user_EditingController,
              hint: 'نام کاربری'),
          CustomForm1(
              formGlobalKey: signup_password_formGlobalKey,
              validator: true,
              monshiEditingController: signup_pass_EditingController,
              hint: 'رمز عبور'),
          CustomForm2(
              formGlobalKey: signup_repassword_formGlobalKey,
              repeat_validator: true,
              monshiEditingController: signup_repass_EditingController,
              hint: ' تکرار رمز عبور'),
          CustomForm1(
              formGlobalKey: signup_email_formGlobalKey,
              monshiEditingController: signup_email_EditingController,
              validator: true,
              hint: 'آدرس ایمیل'),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  if (signup_username_formGlobalKey.currentState!.validate() &&
                      signup_password_formGlobalKey.currentState!.validate() &&
                      signup_repassword_formGlobalKey.currentState!
                          .validate()) {
                    if (signup_pass_EditingController.text ==
                        signup_repass_EditingController.text) {
                      await saveuserdata(
                          signup_user_EditingController.text,
                          signup_pass_EditingController.text,
                          signup_name_EditingController.text,
                          signup_email_EditingController.text);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text(
                        'رمز عبور تطابق ندارد!',
                        textDirection: TextDirection.rtl,
                      )));
                    }
                  }
                },
                child: const Text('ورود'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _animatedcrossfadesignup = true;
                    loginorsignup = 'صفحــه ورود';
                    signup_user_EditingController.clear();
                    signup_email_EditingController.clear();
                    signup_pass_EditingController.clear();
                    signup_repass_EditingController.clear();
                    signup_name_EditingController.clear();
                  });
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red)),
                child: const Icon(
                  Icons.arrow_back_outlined,
                  size: 20,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  AnimatedCrossFade vakilmonshiCrossFade() {
    return AnimatedCrossFade(
      firstChild: Container(
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                setState(() {
                  _animatedcrossfade = false;
                  _animatedcrossfadecounter = true;
                });
              },
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.all(15)),
                  alignment: Alignment.center,
                  foregroundColor: MaterialStateProperty.all(Colors.black),
                  backgroundColor: MaterialStateProperty.all(Colors.yellow)),
              child: const Text(
                'وکیل',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(width: 5),
            TextButton(
              onPressed: () {
                setState(() {
                  _animatedcrossfade = false;
                  _animatedcrossfadecounter = false;
                });
              },
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.all(15)),
                  alignment: Alignment.center,
                  foregroundColor: MaterialStateProperty.all(Colors.black),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.lightGreen)),
              child: const Text('منشی', style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
      secondChild:
          _animatedcrossfadecounter ? vakilContainer() : monshiContainer(),
      crossFadeState: _animatedcrossfade
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      duration: const Duration(milliseconds: 100),
    );
  }

  Container monshiContainer() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomForm1(
            formGlobalKey: sigin_monshi_username_formGlobalKey,
            monshiEditingController: monshiEditingController,
            hint: 'نام کاربری',
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    setadective();
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => MyHomePage()),
                        (route) => false);
                  });
                },
                child: const Text('ورود'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _animatedcrossfade = true;
                    monshiEditingController.clear();
                  });
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red)),
                child: const Icon(
                  Icons.arrow_back_outlined,
                  size: 20,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Container vakilContainer() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomForm1(
              formGlobalKey: signUp_vakil_username_formGlobalKey,
              monshiEditingController: vakiluserEditingController,
              hint: 'نام کاربری'),
          CustomForm1(
              formGlobalKey: signUp_vakil_password_formGlobalKey,
              monshiEditingController: vakilpassEditingController,
              hint: 'رمز عبور'),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  checkuserdata(vakiluserEditingController.text,
                      vakilpassEditingController.text);
                },
                child: const Text('ورود'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _animatedcrossfade = true;
                    vakiluserEditingController.clear();
                    vakilpassEditingController.clear();
                  });
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red)),
                child: const Icon(
                  Icons.arrow_back_outlined,
                  size: 20,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomForm1 extends StatefulWidget {
  CustomForm1(
      {Key? key,
      required this.monshiEditingController,
      required this.hint,
      this.validator = false,
      this.repeat_validator = false,
      required this.formGlobalKey})
      : super(key: key);

  final GlobalKey<FormState> formGlobalKey;
  final TextEditingController monshiEditingController;
  final String? hint;
  bool validator;
  bool repeat_validator;
  Color? textFormFieldcolor = Colors.black;

  @override
  State<CustomForm1> createState() => _CustomForm1State();
}

class _CustomForm1State extends State<CustomForm1> {
  @override
  void dispose() {
    // widget.monshiEditingController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formGlobalKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Container(
        margin: const EdgeInsets.only(bottom: 5),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: TextFormField(
            style: TextStyle(
              color: widget.textFormFieldcolor,
            ),
            validator: (value) {
              if (widget.validator == true) {
                if (value!.isEmpty) {
                  return 'فیلد الزامی';
                }
              } else {
                if (widget.repeat_validator == true) {
                  if (widget.monshiEditingController.text ==
                      _LoginpageState.signup_pass_EditingController.text) {
                    return null;
                  } else {
                    return 'تطابق ندارد';
                  }
                } else {
                  return null;
                }
              }
              return null;
            },
            controller: widget.monshiEditingController,
            decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              hintStyle: const TextStyle(
                color: Colors.black,
                fontSize: 15,
                overflow: TextOverflow.visible,
              ),
              hintText: widget.hint,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomForm2 extends StatefulWidget {
  CustomForm2(
      {Key? key,
      required this.monshiEditingController,
      required this.hint,
      this.repeat_validator = false,
      required this.formGlobalKey})
      : super(key: key);

  final GlobalKey<FormState> formGlobalKey;
  final TextEditingController monshiEditingController;
  final String? hint;

  bool repeat_validator;
  Color? textFormFieldcolor = Colors.black;

  @override
  State<CustomForm2> createState() => _CustomForm2State();
}

class _CustomForm2State extends State<CustomForm2> {
  @override
  void dispose() {
    // widget.monshiEditingController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formGlobalKey,
      autovalidateMode: AutovalidateMode.always,
      child: Container(
        margin: const EdgeInsets.only(bottom: 5),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: TextFormField(
            style: TextStyle(
              color: widget.textFormFieldcolor,
            ),
            validator: (value) {
              if (widget.repeat_validator == true) {
                if (widget.monshiEditingController.text ==
                    _LoginpageState.signup_pass_EditingController.text) {
                  return null;
                } else {
                  return 'تطابق ندارد';
                }
              } else {
                return null;
              }
            },
            controller: widget.monshiEditingController,
            decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              hintStyle: const TextStyle(
                color: Colors.black,
                fontSize: 15,
                overflow: TextOverflow.visible,
              ),
              hintText: widget.hint,
            ),
          ),
        ),
      ),
    );
  }
}
