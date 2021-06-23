import 'package:flutter/material.dart';
import 'package:my_portafoglio/Desktop/Components/sectionTitle.dart';
import 'package:my_portafoglio/Desktop/Components/ServiceCard.dart';
import 'package:my_portafoglio/Model/Service.dart';
class ServiceSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0 * 2),
      constraints: BoxConstraints(maxWidth: 1110),
      child: Column(
        children: [
          sectionTitle(
            color: Color(0xFFFF0000),
            title: "Service Offerings",
            subTitle: "My Strong Arenas",
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
                services.length, (index) => ServiceCard(index: index,sizeWidth: 230,
              sizeHeight: 230,sizeImageWidth: 120,sizeImageHeigth: 120,)),
          )
        ],
      ),
    );
  }
}
