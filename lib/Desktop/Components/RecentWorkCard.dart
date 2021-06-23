import 'package:flutter/material.dart';

import 'package:my_portafoglio/Model/WorkModel.dart';
import 'package:my_portafoglio/Style/Style_card.dart';
class RecentWorkCard extends StatefulWidget {
  final int index;
  final Function press;
  final WorkModel workModel;

  RecentWorkCard({this.index, this.press,this.workModel});

  @override
  _RecentWorkCardState createState() => _RecentWorkCardState();
}

class _RecentWorkCardState extends State<RecentWorkCard> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.press,
      onHover: (value) {
        setState(() {
          isHover = value;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        height: 220,
        width: 420,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [if (isHover) StyleCard().kDefaultCardShadow],
        ),
        child: Row(
          children: [
            SizedBox(
              height: 140,
                width: 120,
                child:Image.network(widget.workModel.image)),
                //Image.asset(widget.workModel.image)),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(widget.workModel.title),
                    SizedBox(height: 20 / 2),
                    Container(
                      height: 100,
                      width: 220,
                      child: Text(widget.workModel.description,
                        style:MediaQuery.of(context).size.width<600? TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        ):
                        Theme.of(context).textTheme.headline6.copyWith(height: 1.5)
                        ,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "View Details",
                      style: TextStyle(decoration: TextDecoration.underline),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
