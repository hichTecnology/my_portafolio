import 'package:my_portafoglio/Api_utility/Api_utili.dart';
import 'package:my_portafoglio/Model/WorkModel.dart';
import 'package:http/http.dart' ;
import 'dart:convert';



class WorkApi{
  Future <List<WorkModel>> fetchWorks()async{
    Map<String,String> headers = {
      'Accept': 'application/json'
    };


    String url = Api_utili.MAIN_API_URL + 'Works';
    Response responde = await get(url,headers: headers);
    if (responde.statusCode == 200){
      List<WorkModel> works = [];
      var body = jsonDecode(responde.body);
      for (var item in body){
        works.add(WorkModel.fromJson(item));
      }
      return works;
    }
    return null;
  }
  Future <WorkModel> fetchWorksId(String id)async{
    Map<String,String> headers = {
      'Accept': 'application/json'
    };


    String url = Api_utili.MAIN_API_URL + 'Works/$id';
    Response responde = await get(url,headers: headers);
    if (responde.statusCode == 200){
      WorkModel works ;
      var body = jsonDecode(responde.body);

        works =WorkModel.fromJson(body);

      return works;
    }
    return null;
  }

}

String idWorkId = '';