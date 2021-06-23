import 'package:my_portafoglio/Model/CategoryModel.dart';

class Users{
  String firstName ;
  String email;
  String description;
  List<CategoryModel> category;
  double budgetProject;

  Users(this.firstName, this.email, this.description, this.category,
      this.budgetProject);

  Users.fromJeson(Map<String,dynamic> jsonObject){
    this.firstName = jsonObject['farstName'];
    this.email = jsonObject['email'];
    this.description = jsonObject['description'];
    this.budgetProject = jsonObject['budgetProject'];
    _setCategory(jsonObject['categories']);
    
  }
  void _setCategory(List<dynamic> categoryJson){
    this.category = [];
    for(var item in categoryJson){
      category.add(CategoryModel.fromJson(item));
    }
  }
}