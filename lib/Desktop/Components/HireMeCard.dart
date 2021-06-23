import 'package:flutter/material.dart';
import 'package:my_portafoglio/Desktop/Components/DefoultButton.dart';
import 'package:my_portafoglio/Style/Style_card.dart';
class HireMeCard extends StatelessWidget {
  const HireMeCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.all(20.0 ),
      constraints: BoxConstraints(maxWidth: 1000),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [StyleCard().kDefaultShadow],
      ),
      child: Row(
        children: [
          Image.asset(
            "Images/email.png",
            height:sizeWidth <600 ? 35: 80,
            width:sizeWidth < 600 ? 35 : 80,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: sizeWidth < 600 ? 40 : 80,
              child: VerticalDivider(),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Starting New Project?",
                  style: TextStyle(fontSize:sizeWidth < 600 ? 18: 42, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20 / 2),
                Text(
                  "Get an estimate for the new project",
                  style: TextStyle(fontWeight: FontWeight.w200),
                )
              ],
            ),
          ),
          DefaultButton(
            text: "Hire Me!",
            imageSrc: "Images/hand.png",
            press: () {},
          )
        ],
      ),
    );
  }
}