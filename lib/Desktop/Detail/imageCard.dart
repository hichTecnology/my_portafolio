import 'package:flutter/material.dart';
import 'package:my_portafoglio/Style/Style_card.dart';
class imageCard extends StatefulWidget {
  String image;

  imageCard(this.image);

  @override
  _imageCardState createState() => _imageCardState();
}

class _imageCardState extends State<imageCard> {
  bool isHover = false;
  Duration duration = Duration(milliseconds: 200);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        print('hello word');
      },
      onHover: (value) {
        setState(() {
          isHover = value;
        });
      },
      hoverColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: AnimatedContainer(
          duration: duration,
          width: 240,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.shade200,
            boxShadow: [if (isHover) StyleCard().kDefaultCardShadow],
          ),
          child: AnimatedContainer(
              duration: duration,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  if (!isHover)
                    BoxShadow(
                      offset: Offset(0, 30),
                      blurRadius: 40,
                      color: Colors.black.withOpacity(0.2),
                    ),
                ],
              ),
              child: Image.network(widget.image)),
        ),
      ),
    );
  }
}
