import 'package:flutter/material.dart';


class Service {
  final int id;
  final String title, image;
  final Color color;

  Service({this.id, this.title, this.image, this.color});
}

// For demo list of service
List<Service> services = [
  Service(
    id: 1,
    title: "Application Web",
    image: "Images/web.png",
    color: Color(0xFFD9FFFC),
  ),
  Service(
    id: 2,
    title: "Application Andoid",
    image: "Images/android.png",
    color: Color(0xFFE4FFC7),
  ),
  Service(
    id: 3,
    title: "Application IOS",
    image: "Images/iosapp.png",
    color: Color(0xFFFFF3DD),
  ),
  Service(
    id: 4,
    title: "Application desktop",
    image: "Images/computer.png",
    color: Color(0xFFFFE0E0),
  ),
];