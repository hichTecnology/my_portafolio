import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:my_portafoglio/Desktop/Components/ServiceCard.dart';
import 'package:my_portafoglio/Desktop/Components/sectionTitle.dart';
import 'package:my_portafoglio/Model/Service.dart';
class ServiceSectionMobile extends StatefulWidget {
  @override
  _ServiceSectionMobileState createState() => _ServiceSectionMobileState();
}

class _ServiceSectionMobileState extends State<ServiceSectionMobile> {
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

            child: /*StaggeredGridView.countBuilder(
              crossAxisCount: 4,
              itemCount: services.length,
              itemBuilder: (BuildContext context, int index){
                return ServiceCard(index: index,);
              },
              staggeredTileBuilder: (int index) =>
                  StaggeredTile.count(2, index.isEven ? 2.8 : 3),
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,

            )*/
            GridView.count(
              primary: false,
              padding: const EdgeInsets.all(1.5),
              crossAxisCount: 2,
              childAspectRatio: 1.20,
              mainAxisSpacing: 1.0,
              crossAxisSpacing: 1.0,
              children: List.generate(
                  services.length, (index) => ServiceCard(index: index,sizeHeight: 160,
                sizeWidth: 120,sizeImageHeigth: 60,sizeImageWidth: 60,)),
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
