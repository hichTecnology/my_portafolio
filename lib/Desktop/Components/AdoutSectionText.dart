import 'package:flutter/material.dart';
class AboutSectionText extends StatelessWidget {
  final String text;

  const AboutSectionText({Key key, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.w200, color: Color(0xFF707070), height: 2),
      ),
    );
  }
}
