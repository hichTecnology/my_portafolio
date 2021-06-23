import 'package:flutter/material.dart';
class sectionTitle extends StatelessWidget {
  final String title;
  final String subTitle;
  final Color color;

  const sectionTitle({Key key, this.title, this.subTitle, this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      constraints: BoxConstraints(maxWidth: 1110),
      height: 100,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 20),
            padding: EdgeInsets.only(bottom: 72),
            width: 8,
            height: 80,
            color: Colors.black,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: color,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                subTitle,
                style:
                TextStyle(fontWeight: FontWeight.w200,
                    color:Color(0xFF707070)),
              ),
              Text(
                title,
                style: MediaQuery.of(context).size.width<600?
                Theme.of(context).textTheme.headline5.copyWith(fontWeight: FontWeight.bold, color: Colors.black):
                Theme.of(context).textTheme.headline2.copyWith(fontWeight: FontWeight.bold, color: Colors.black)
                ,
              )
            ],
          )
        ],
      ),
    );
  }
}
