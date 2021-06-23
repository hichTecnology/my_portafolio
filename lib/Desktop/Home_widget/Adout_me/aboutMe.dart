import 'package:flutter/material.dart';
import 'package:my_portafoglio/CollectionApi/AboutMeApi.dart';

import 'package:my_portafoglio/Desktop/Components/AdoutSectionText.dart';
import 'package:my_portafoglio/Desktop/Components/ExperienceCard.dart';
class aboutMe extends StatefulWidget {
  final String myStore;
  final String myExperience;
  final int myYears;

  aboutMe(this.myStore, this.myExperience, this.myYears);

  @override
  _aboutMeState createState() => _aboutMeState();
}

class _aboutMeState extends State<aboutMe> {

  @override
  Widget build(BuildContext context) {
    return
      Center(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 80),
          constraints: BoxConstraints(maxWidth: 1100),

          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(

                child: Column(
                  children: [
                    Text(
                      "About \nmy story",
                      style: Theme.of(context)
                          .textTheme
                          .headline2
                          .copyWith(fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    SizedBox(height: 65),
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
              Expanded(
                child: AboutSectionText(
                  text:
                    widget.myStore
                  //"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore mag aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                ),
              ),
              ExperienceCard(numOfExp: widget.myYears.toString(),sizeWidth: 225,sizeText: 100,textTitle: "Years of Experience",),
              Expanded(
                child: AboutSectionText(
                  text:
                  widget.myExperience
                ),
              ),

            ],
          ),
        ),
      );

  }
}
