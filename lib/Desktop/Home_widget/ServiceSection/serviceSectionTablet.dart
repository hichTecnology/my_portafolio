import 'package:flutter/material.dart';
import 'package:my_portafoglio/Desktop/Components/ServiceCard.dart';
import 'package:my_portafoglio/Desktop/Components/sectionTitle.dart';
import 'package:my_portafoglio/Model/Service.dart';
class serviceSectionTablet extends StatefulWidget {
  @override
  _serviceSectionTabletState createState() => _serviceSectionTabletState();
}

class _serviceSectionTabletState extends State<serviceSectionTablet> {
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
          Container(
            margin: EdgeInsets.all(12),

            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(1.5),
              crossAxisCount: 2,
              childAspectRatio: 1.20,
              mainAxisSpacing: 1.0,
              crossAxisSpacing: 1.0,
              children: List.generate(
                  services.length, (index) => ServiceCard(index: index,sizeHeight: 230,
                sizeWidth: 230,sizeImageHeigth: 120,sizeImageWidth: 120,)),
              shrinkWrap: true,
            ),
          )
          /*Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
                services.length, (index) => ServiceCard(index: index)),
          )*/
        ],
      ),
    );
  }
}
