import 'package:my_portafoglio/Api_utility/Api_utili.dart';
import 'package:my_portafoglio/Desktop/Detail/imageCard.dart';
import 'package:my_portafoglio/Model/CategoryModel.dart';
import 'package:my_portafoglio/Model/Users.dart';
import 'package:http/http.dart' ;
import 'dart:convert';

class CustomerApi{
   Future<Users> sendRequest (String farstName, String email, String description, double budgetProject,List<String> category) async{

    Map<String,String> header = {
      'Content-Type':'application/json',
      'Accept': 'application/json'
    };

    String url = Api_utili.MAIN_API_URL + 'Customers';

    var response = await post(url,headers: header,
        body: jsonEncode({
          'farstName' : farstName,
          'email' : email,
          'categories' :category,
          'budgetProject' : budgetProject,
          'description' : description,
        }));

    if(response.statusCode == 200){
      var body = jsonDecode(response.body);
      Users users = Users.fromJeson(body);

      //print(users);
      return (users);
    }
    else{
      print('Error....');

    }





  }
}