import 'package:flutter/material.dart';
import 'package:my_portafoglio/CollectionApi/AboutMeApi.dart';
import 'package:my_portafoglio/Desktop/Components/AdoutSectionText.dart';
import 'package:my_portafoglio/Desktop/Components/ExperienceCard.dart';
class aboutMeMobile extends StatefulWidget {
  final String myStore;
  final String myExperience;
  final int myYears;

  aboutMeMobile(this.myStore,this.myExperience,this.myYears);

  @override
  _aboutMeMobileState createState() => _aboutMeMobileState();
}

class _aboutMeMobileState extends State<aboutMeMobile> {


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 80),
        constraints: BoxConstraints(maxWidth: 1100),

        child: Column(
          children: [
            Container(

              margin: EdgeInsets.only(bottom: 12),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "About \nmy story",
                      style: Theme.of(context)
                          .textTheme
                          .headline3
                          .copyWith(fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),
                  SizedBox(width: 65),
                  Center(
                    child: SizedBox(
                      height: 75,
                      width: 95,
                      child: Image.asset('Images/firmaapp.png'),
                    ),
                  )

                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Expanded(
                  child: AboutSectionText(
                    text:
                    widget.myStore,
                  ),
                ),
                ExperienceCard(numOfExp: widget.myYears.toString(),sizeWidth: 150,sizeText: 60,textTitle: "Years of Experience",),


              ],
            ),
          ],
        ),
      ),
    );
  }
}
