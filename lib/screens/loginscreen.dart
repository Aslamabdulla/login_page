import 'package:flutter/material.dart';
import 'package:flutter_application_7/main.dart';
import 'package:flutter_application_7/screens/homepage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenLogin extends StatefulWidget {
  ScreenLogin({Key? key}) : super(key: key);

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();
  bool _isDataMatched = true;
  final _formKey = GlobalKey<FormState>();
  final _usernameDefined = 'crossroads';
  final _passwordDefined = 'flutter';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(20, 33, 61, 1),
        title: Center(
          child: Text(
            "Login",
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ),
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: Center(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 40,
              right: 40,
            ),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Image.asset(
                      'assets/images/360_F_460710131_YkD6NsivdyYsHupNvO3Y8MPEwxTAhORh.png',
                      height: 150,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      'WELCOME BACK...',
                      style: GoogleFonts.adamina(
                        textStyle: Theme.of(context).textTheme.headline4,
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    textAlign: TextAlign.center,
                    controller: _usernameController,
                    decoration: InputDecoration(
                      prefixIcon: new Icon(Icons.account_circle_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      hintText: 'USERNAME',
                      hintStyle: TextStyle(fontSize: 15),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    validator: (value) {
                      // if (_isDataMatched) {
                      //   return null;
                      // } else {
                      //   return 'Error';
                      // }
                      if (value == null || value.isEmpty) {
                        return "Username is Empty...";
                      } else if (value != _usernameDefined) {
                        return "Invalid Username or Password ";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    textAlign: TextAlign.center,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.key),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      hintText: 'PASSWORD',
                      hintStyle: const TextStyle(fontSize: 15),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    validator: (value) {
                      // if (_isDataMatched) {
                      //   return null;
                      // } else {
                      //   return 'Error';
                      // }
                      // if (value == null || value.isEmpty) {
                      //   return "Password is Empty...";
                      // } else {
                      //   return null;
                      // }
                      if (value == null || value.isEmpty) {
                        return "Password is Empty...";
                      } else if (value != _passwordDefined) {
                        return "Invalid Username or Password";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Visibility(
                        visible: !_isDataMatched,
                        child: const Text(
                          'INVALID ENTRY',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),

                      // Visibility(
                      //   visible: !_isDataMatched,
                      //   child: Text(
                      //     "INVALID ENTRY",
                      //     style: TextStyle(fontSize: 15, color: Colors.red),
                      //   ),
                      // ),
                      ElevatedButton.icon(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            checkLogin(context);
                          } else {}

                          // checkLogin(context);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromRGBO(20, 33, 61, 1),
                        ),
                        icon: const Icon(Icons.login),
                        label: const Text('LOGIN'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void checkLogin(BuildContext ctx) async {
    final _username = _usernameController.text;
    final _password = _passwordController.text;
    if (_username == _usernameDefined && _password == _passwordDefined) {
      //go to Ho
      final _sharedPrefs = await SharedPreferences.getInstance();
      await _sharedPrefs.setBool(SAVE_KEY_NAME, true);
      Navigator.of(ctx)
          .pushReplacement(MaterialPageRoute(builder: (ctx1) => ScreenHome()));
    } else {}
  }
}
