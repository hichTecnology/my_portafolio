import 'package:flutter/material.dart';
import 'package:my_portafoglio/CollectionApi/WorkApi.dart';
import 'package:my_portafoglio/Desktop/Components/HireMeCard.dart';
import 'package:my_portafoglio/Desktop/Components/RecentWorkCard.dart';
import 'package:my_portafoglio/Desktop/Components/sectionTitle.dart';
import 'package:my_portafoglio/Model/WorkModel.dart';


class RecentWorkSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WorkApi workApi = WorkApi();
    return Container(
      margin: EdgeInsets.only(top: 10.0 * 6),
      width: double.infinity,
      // just for demo

      decoration: BoxDecoration(
        color: Color(0xFFF7E8FF).withOpacity(0.3),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("Images/triangles.png"),
        ),
      ),
      child: Column(
        children: [
          Transform.translate(
            offset: Offset(0, -80),
            child: HireMeCard(),
          ),
          sectionTitle(
            title: "Recent Woorks",
            subTitle: "My Strong Arenas",
            color: Color(0xFFFFB100),
          ),
          SizedBox(height: 20 * 1.5),
          FutureBuilder(
              future: workApi.fetchWorks(),
              builder: (BuildContext context, AsyncSnapshot<List<WorkModel>> projectSnap) {
                if (!projectSnap.hasData) {
                  return CircularProgressIndicator();
                }
                else {
                  return SizedBox(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.75,
                    child: Wrap(
                      spacing: 20,
                      runSpacing: 20.0,
                      children: List.generate(
                        projectSnap.data.length,
                            (index) =>
                            RecentWorkCard(index: index,
                              press:(){
                              idWorkId = projectSnap.data[index].idWork;
                                Navigator.pushNamed(context, '/detail/${projectSnap.data[index].idWork}',arguments: (projectSnap.data[index]));
                                //context.vxNav.push(Uri(path :RoutesName.Detail_PAGE,queryParameters: {"id":projectSnap.data[index].idWork}),params:projectSnap.data[index] );


                              //Navigator.push(context, MaterialPageRoute(builder: (_)=> DetailWork(projectSnap.data[index])));
                               // Navigator.pushNamed(context, DetailWork.route,arguments: ScreenArguments(projectSnap.data[index]));
                              },
                              workModel: projectSnap.data[index],),
                      ),
                    ),
                  );
                }
              }),
          /*SizedBox(
            width: MediaQuery.of(context).size.width*0.75,
            child: Wrap(
              spacing: 20,
              runSpacing: 20.0 ,
              children: List.generate(
                recentWork.length,
                    (index) => RecentWorkCard(index: index, press: () {}),
              ),
            ),
          ),*/
          SizedBox(height: 20.0 * 5),

        ],
      ),
    );
  }
}

class ScreenArguments {
  WorkModel workModel;

  ScreenArguments(this.workModel);
}




