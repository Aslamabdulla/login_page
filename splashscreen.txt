import 'package:flutter/material.dart';
import 'package:flutter_application_7/main.dart';
import 'package:flutter_application_7/screens/homepage.dart';
import 'package:flutter_application_7/screens/loginscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({Key? key}) : super(key: key);

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    checkUserLoggedIn();

    gotoLogin();
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/blue.gif'),
                fit: BoxFit.cover)),
        child: Center(
            // child: Image.asset(
            //   ,
            //   height: 100,
            // ),
            ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Future<void> gotoLogin() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.of(context()).pushReplacement(
      MaterialPageRoute(
        builder: (ctx) => ScreenLogin(),
      ),
    );
  }

  Future<void> checkUserLoggedIn() async {
    final _sharedPrefs = await SharedPreferences.getInstance();
    final _userLoggedIn = _sharedPrefs.getBool(SAVE_KEY_NAME);
    if (_userLoggedIn == null || _userLoggedIn == false) {
      gotoLogin();
    } else {
      Navigator.of(context())
          .pushReplacement(MaterialPageRoute(builder: (ctx1) => ScreenHome()));
    }
  }
}
