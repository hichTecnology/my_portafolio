import 'package:flutter/material.dart';
import 'package:my_portafoglio/Desktop/Components/ExperienceCard.dart';
import 'package:my_portafoglio/Desktop/Profile/ProfileMeDesktop.dart';
class ProfileMeTablet extends StatefulWidget {
  final String myStore;

  ProfileMeTablet(this.myStore);

  @override
  _ProfileMeTabletState createState() => _ProfileMeTabletState();
}

class _ProfileMeTabletState extends State<ProfileMeTablet> {
  @override
  Widget build(BuildContext context) {
    var chartWidget = Padding(
      padding: EdgeInsets.all(32.0),
      child: SizedBox(
        height: 100.0,
        child: chart,
      ),
    );
    return Scaffold(

      appBar: AppBar(
        title: Text('About Me'),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.grey.shade400,
                height: 480,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(bottom: 12),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Container(

                          child: Text(widget.myStore)),
                    ),
                    Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.amber,
                                image: DecorationImage(
                                  image: ExactAssetImage(
                                    'Images/imageProfile1.jpg',
                                  ),
                                  fit: BoxFit.fill,
                                ),
                                border: Border.all(color: Colors.amber,width: 1,style: BorderStyle.solid)
                            ),
                          ),
                        )
                    ),
                  ],
                ),
              ),
              Container(
                color: Color(0xffe6ccb2),
                margin: EdgeInsets.only(bottom: 12),
                height: 620,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Container(
                        height: MediaQuery.of(context).size.height*0.40,
                        width: MediaQuery.of(context).size.width,
                        child:chartWidget,
                      ),

                    ),
                    Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child:Container(
                            height: MediaQuery.of(context).size.height*0.40,
                            width: MediaQuery.of(context).size.width,

                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.amber,
                                image: DecorationImage(
                                  image: ExactAssetImage(
                                    'Images/imageProfile2.jpg',
                                  ),
                                  fit: BoxFit.fill,


                                ),
                                border: Border.all(color: Colors.amber,width: 1,style: BorderStyle.solid)
                            ),


                          ),

                        )
                    ),
                  ],
                ),


              ),
              Container(
                color: Color(0xffeae2b7),
                margin: EdgeInsets.only(bottom: 12),
                height: 540,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height*0.30,
                          child: ExperienceCard(numOfExp: '24',sizeText: 24,sizeWidth: 220,textTitle: 'reply within 24 hours',)),
                    ),
                    Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Container(
                            height: MediaQuery.of(context).size.height*0.40,
                            width: MediaQuery.of(context).size.width,

                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.amber,
                                image: DecorationImage(
                                  image: ExactAssetImage(
                                    'Images/imageProfile3.jpg',
                                  ),
                                  fit: BoxFit.fill,


                                ),
                                border: Border.all(color: Colors.amber,width: 1,style: BorderStyle.solid)
                            ),
                          ),
                        )
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
