import 'package:flutter/material.dart';
import 'package:my_portafoglio/Model/Service.dart';
import 'package:my_portafoglio/Style/Style_card.dart';
class ServiceCard extends StatefulWidget {
  final int index;
  final double sizeWidth;
  final double sizeHeight;
  final double sizeImageWidth;
  final double sizeImageHeigth;

  const ServiceCard({Key key, this.index,@required this.sizeWidth,
    @required this.sizeHeight,@required this.sizeImageHeigth,@required this.sizeImageWidth}) : super(key: key);
  @override
  _ServiceCardState createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  bool isHover = false;
  Duration duration = Duration(milliseconds: 200);

  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {},
      onHover: (value) {
        setState(() {
          isHover = value;
        });
      },
      hoverColor: Colors.transparent,
      child: AnimatedContainer(
        duration: duration,
        margin: EdgeInsets.symmetric(vertical: 10.0 ),
        height: widget.sizeHeight,
        width: widget.sizeWidth,
        decoration: BoxDecoration(
          color: services[widget.index].color,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [if (isHover) StyleCard().kDefaultCardShadow],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: duration,
              padding:sizeWidth < 600 ? EdgeInsets.all(10): EdgeInsets.all(20 * 1.5),
              height: widget.sizeImageHeigth,
              width: widget.sizeImageWidth,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  if (!isHover)
                    BoxShadow(
                      offset: Offset(0, 20),
                      blurRadius: 30,
                      color: Colors.black.withOpacity(0.1),
                    ),
                ],
              ),
              child: Image.asset(
                services[widget.index].image,
                fit: BoxFit.fill,

              ),
            ),
            SizedBox(height: 20),
            Text(
              services[widget.index].title,
              style: TextStyle(fontSize:sizeWidth < 600 ? 18: 22),
            ),
          ],
        ),
      ),
    );
  }
}
