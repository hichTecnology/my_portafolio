import 'package:flutter/material.dart';
import 'package:my_portafoglio/Style/Style_colors.dart';
class containerNavbar extends StatefulWidget {
  final text;

  const containerNavbar({@required this.text}) ;
  @override
  _containerNavbarState createState() => _containerNavbarState();
}

class _containerNavbarState extends State<containerNavbar> {
  bool bush = true;

  @override
  Widget build(BuildContext context) {
    double sizeHeight = MediaQuery.of(context).size.width;

    return MouseRegion(
      onEnter: (value){
        setState(() {
          bush = false;
        });
      },
      onExit: (value){
        setState(() {
          bush = true;
        });
        },
      child: Container(
        height: 45.0 ,
        width:sizeHeight < 950 ? MediaQuery.of(context).size.width*0.15:
        MediaQuery.of(context).size.width*0.10 ,

        decoration: BoxDecoration(
            color: bush ? Colors.grey.shade200 : Colors.redAccent.shade200,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: bush
                ? []
                : [
              BoxShadow(
                color: Colors.white,
                blurRadius: 10.0,
              ),
            ]),
        child: Center(
          child: Text(widget.text,style: TextStyle(
            color: bush ? Colors.black:Colors.white,

          ),),
        ),
      ),

    );
  }
}
