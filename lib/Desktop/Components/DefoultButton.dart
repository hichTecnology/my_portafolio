import 'package:flutter/material.dart';
class DefaultButton extends StatelessWidget {
  final String imageSrc, text;
  final Function press;

  const DefaultButton({Key key, this.imageSrc, this.text, this.press}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;
    return FlatButton(
      padding: EdgeInsets.symmetric(
        vertical: 20,
        horizontal:sizeWidth < 600 ? 15 : 20 * 2.5,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      color: Color(0xFFE8F0F9),
      onPressed: press,
      child: Column(
        children: [
          Image.asset(imageSrc, height: 20),
          SizedBox(width: 20),
          Text(text),
        ],
      ),
    );
  }
}
