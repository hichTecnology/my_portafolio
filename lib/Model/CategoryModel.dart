class CategoryModel{
  String  name ;
  String idCategory;
  String image;

  CategoryModel(this.name,this.idCategory,this.image);

  CategoryModel.fromJson(Map<String,dynamic> jsonObject){
    this.name = jsonObject['name'];
    this.idCategory = jsonObject['id'];
    this.image = jsonObject['image']['url'];
  }
}