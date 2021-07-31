import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shop_app/models/seller.dart';



class ServerHandler{
  final String _baseUrl = "http://whoisrishav.com/pk/better-buys/api";

  //Get the list of Sellers
  Future<List<Seller>> getSellers() async{
    try{
      List<Seller> sellers = [];

      http.Response response = await http.get(Uri.parse('$_baseUrl/gen/sellers'));
      List sellersList = (json.decode(response.body))['sellers'];


      for(Map m in sellersList){
        sellers.add(Seller.fromMap(m));
      }


      
      return sellers;
    } catch (e){
      print('server Handler : error : ' + e.toString());
      rethrow;
    }
  }

}
