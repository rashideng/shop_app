import 'dart:async';


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/screens/sellers_screen.dart';

import 'package:shop_app/server_handler.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool showLoadingSeller = false;
  dynamic _timer;

  void getSellers() {
    ServerHandler()
        .getSellers()
        .then((value) => Navigator.of(context).popAndPushNamed(SellerScreen.routeName))
        .catchError((e) => print(e));
  }

  @override
  void initState() {
    super.initState();
    _timer = Timer(
        Duration(seconds: 3),
        () => {
              showLoadingSeller = true,
              setState(() {}),
              getSellers(),
            });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Color(0xffE6F3EC),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Shop App',
            style: GoogleFonts.pacifico(
              color: Color(0xff4E8489),
              fontSize: 27,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          if (showLoadingSeller)
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Color(0xff4E8489),
              ),
              strokeWidth: 3,
            ),
          SizedBox(
            height: 5,
          ),
          if (showLoadingSeller)
            Text(
              'Loading Sellers',
              style: GoogleFonts.poppins(),
            ),
        ],
      ),
    ));
  }
}
