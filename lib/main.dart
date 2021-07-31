import 'package:flutter/material.dart';
import 'package:shop_app/screens/splash_screen.dart';
import 'screens/sellers_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      routes: {
        SellerScreen.routeName: (_)=>const SellerScreen()
      },

    );
  }
}
