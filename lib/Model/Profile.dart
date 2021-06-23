import 'package:flutter/material.dart';

class Proflie{
  String description;
  String image;
  Color colorsProfile;

  Proflie({this.description, this.image,this.colorsProfile});

}

List<Proflie> profile = [
  Proflie(
    description: 'sono hicham elmir sono un developer ho piu di 10 anni di esperienza in questo settore ',
    image: 'Images/imageProfile1.jpg',
    colorsProfile: Colors.grey.shade400

  ),
  Proflie(
      description: 'sono hicham elmir sono un developer ho piu di 10 anni di esperienza in questo settore ',
      image: 'Images/imageProfile2.jpg',


  )

];