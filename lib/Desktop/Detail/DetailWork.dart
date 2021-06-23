import 'package:flutter/material.dart';
import 'package:my_portafoglio/CollectionApi/WorkApi.dart';
import 'package:my_portafoglio/Desktop/Detail/DetailWorkDesktop.dart';
import 'package:my_portafoglio/Desktop/Detail/DetailWorkMobile.dart';
import 'package:my_portafoglio/Desktop/Detail/imageCard.dart';
import 'package:my_portafoglio/Model/WorkModel.dart';
import 'package:responsive_builder/responsive_builder.dart';


class DetailWork extends StatefulWidget {
  WorkModel workModel;
  DetailWork(this.workModel);




  @override
  _DetailWorkState createState() => _DetailWorkState();
}

class _DetailWorkState extends State<DetailWork> {

  bool isHover = false;
  Duration duration = Duration(milliseconds: 200);
  WorkApi workApi = WorkApi();
  WorkModel workModel1;
  bool loading = false;

  

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body :SafeArea(
        child: SafeArea(
          child: ScreenTypeLayout(
            mobile: DetailWorkMobile(widget.workModel),
            desktop: DetailWorkDesktop(workModel1),
          ),
        )
      ),

    );
  }
}

