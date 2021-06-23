class LinguageModel{
  String name;
  String id;
  String image;

  LinguageModel(this.name, this.id,this.image);

  LinguageModel.fromJson(Map<String , dynamic > objectJson){
    this.name = objectJson['name'];
    this.id = objectJson['id'];
    this.image = objectJson['image']['url'];
  }
}