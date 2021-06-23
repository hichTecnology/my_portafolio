import 'package:flutter/material.dart';
import 'package:my_portafoglio/Desktop/Components/ExperienceCard.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ProfileMeDesktop extends StatelessWidget {
  final String myStore;
  ProfileMeDesktop(this.myStore);
  static const String route = '/profileMe';

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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.grey.shade400,
                height: 440,
                margin: EdgeInsets.only(bottom: 12),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Container(
                            width: MediaQuery.of(context).size.width*0.45,
                            child: Text(myStore)),
                      ),
                      Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Container(
                              height: 430,
                              width: MediaQuery.of(context).size.width*0.50,

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
                height: 440,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Container(
                          height: 430,
                          width: MediaQuery.of(context).size.width*0.50,

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

                      ),
                      Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child:Container(
                                width: MediaQuery.of(context).size.width*0.45,
                                child:chartWidget,
                            ),
                          )
                      ),
                    ],
                  ),


              ),
              Container(
                color: Color(0xffeae2b7),
                margin: EdgeInsets.only(bottom: 12),
                height: 440,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Container(
                            width: MediaQuery.of(context).size.width*0.45,
                            child: ExperienceCard(numOfExp: '24',sizeText: 24,sizeWidth: 220,textTitle: 'reply within 24 hours',)),
                      ),
                      Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Container(
                              height: 430,
                              width: MediaQuery.of(context).size.width*0.40,

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
class ClicksPerYear {
  final String year;
  final int clicks;
  final charts.Color color;

  ClicksPerYear(this.year, this.clicks, Color color)
      : this.color = charts.Color(
      r: color.red, g: color.green, b: color.blue, a: color.alpha);
}
var data = [
  ClicksPerYear('Dart', 95, Colors.blue.shade400),
  ClicksPerYear('Kotlin', 55, Colors.orange),
  ClicksPerYear('Nodejs', 12, Colors.green),
  ClicksPerYear('Java', 12, Colors.red),
];

var series = [
  charts.Series(
    domainFn: (ClicksPerYear clickData, _) => clickData.year,
    measureFn: (ClicksPerYear clickData, _) => clickData.clicks,
    colorFn: (ClicksPerYear clickData, _) => clickData.color,
    labelAccessorFn: (ClicksPerYear clickData, _) =>'\#${clickData.year.toString()}',
    id: 'Clicks',
    data: data,
  ),
];

var chart = charts.BarChart(
  series,
  animate: true,
  barRendererDecorator: new charts.BarLabelDecorator<String>(),
  domainAxis: new charts.OrdinalAxisSpec(),
);


