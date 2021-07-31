import 'package:flutter/material.dart';

class SellerScreen extends StatelessWidget {
  static const routeName = '/seller-screen';
  const SellerScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Text("Seller Screen"),
      )
      
    );
  }
}