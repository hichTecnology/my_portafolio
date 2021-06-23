import 'package:my_portafoglio/Api_utility/Api_utili.dart';
import 'package:my_portafoglio/Model/AboutMe.dart';
import 'package:http/http.dart';
import 'dart:convert';

import 'package:my_portafoglio/Model/CategoryModel.dart';

class CategoryApi{
  Future <List<CategoryModel>> fetchCategory()async{
    Map<String , String> header  = {
      'Accept': 'application/json'
    };

    String url = Api_utili.MAIN_API_URL + 'Categories';

    Response response = await get(url,headers: header);
    if(response.statusCode == 200){
      List<CategoryModel> category = [];
      var body = jsonDecode(response.body);
      for (var item in body){
        category.add(CategoryModel.fromJson(item));
      }
      return category;
    }
    else{
      print('Error');
    }


  }
}