import 'package:my_portafoglio/Model/CategoryModel.dart';
import 'package:my_portafoglio/Model/LinguageModel.dart';

class WorkModel {
  String title;
  String description;
  String image;
  String idWork;
  List<CategoryModel> category;
  List<LinguageModel> linguaggio;
  List<String> gallery ;



  WorkModel(this.title, this.description,this.image,this.idWork,this.category,this.linguaggio,this.gallery);

  WorkModel.fromJson(Map <String,dynamic> jsonObject){
    this.title = jsonObject['title'];
    this.description = jsonObject['description'];
    this.image = jsonObject['image']['url'];
    this.idWork = jsonObject['id'];
    _setCategory(jsonObject['categories']);
    _setLinguaggio(jsonObject['linguages']);
    _setgallary(jsonObject['gallery']);
  }
  void _setCategory(List<dynamic> categoryJson){
    this.category = [];
    for(var item in categoryJson){
      category.add(CategoryModel.fromJson(item));

    }
  }
  void _setLinguaggio(List<dynamic> categoryJson){
    this.linguaggio = [];
    for(var item in categoryJson){
      linguaggio.add(LinguageModel.fromJson(item));
    }
  }
  void _setgallary(List<dynamic> categoryJson){
    this.gallery = [];
    for(var item in categoryJson){
      gallery.add(item['url']);
    }
  }
}