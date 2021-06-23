

import 'package:http/http.dart' as http;
import 'package:my_portafoglio/Api_utility/Api_utili.dart';
import 'package:my_portafoglio/Model/AboutMe.dart';

import 'dart:convert';

class AboutMeApi {
  Future <List<AboutMe>> fetchAbotMe()async{
    Map<String , String> header  = {
      'Accept': 'application/json'
    };

    String url = Api_utili.MAIN_API_URL + 'Abouts';

    http.Response response = await http.get(url,headers: header);
    if(response.statusCode == 200){
      List<AboutMe> aboutMe = [];
      var body = jsonDecode(response.body);
      for (var item in body){
        aboutMe.add(AboutMe.fromJson(item));
      }
      return aboutMe;
    }


  }



}