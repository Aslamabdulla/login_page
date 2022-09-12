import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_7/screens/loginscreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 8, 20, 1),
        title: const Text('INBOX'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                signout(context);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
              child: const Text(
                'SIGNOUT',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    "assets/images/HD-wallpaper-samsung-background-blue-edge-gradient-gray-plain-purple-simple-sky.jpg"),
                fit: BoxFit.fill,
              ),
            ),
            child: ListView.separated(
                itemBuilder: (ctx, index) {
                  return ListTile(
                    title: Text('PERSON $index'),
                    subtitle: Text('MESSAGE $index'),
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(
                          'assets/images/png-transparent-chatbot-logo-robotics-robot-electronics-leaf-logo.png'),
                    ),
                    trailing: Text(
                      '${index + 1}:00 PM',
                      style: GoogleFonts.alike(
                          textStyle: Theme.of(context).textTheme.headline4,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.italic),
                    ),
                  );
                },
                separatorBuilder: (ctx, index) {
                  return Divider();
                },
                itemCount: 12)

            // constraints: BoxConstraints.expand(),
            ),
      ),
    );
  }

  signout(BuildContext ctx) async {
    final _sharedPrefs = await SharedPreferences.getInstance();
    await _sharedPrefs.clear();
    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx1) => ScreenLogin()), (route) => false);
  }
}
