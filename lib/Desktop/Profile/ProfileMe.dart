import 'package:flutter/material.dart';
import 'package:my_portafoglio/Desktop/Profile/ProfileMeDesktop.dart';
import 'package:my_portafoglio/Desktop/Profile/ProfileMeTablet.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ProfileME extends StatefulWidget {
  final String myStore;

  ProfileME(this.myStore);

  @override
  _ProfileMEState createState() => _ProfileMEState();
}

class _ProfileMEState extends State<ProfileME> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ScreenTypeLayout(
          desktop: ProfileMeDesktop(widget.myStore),
          tablet: ProfileMeTablet(widget.myStore),
          mobile: ProfileMeTablet(widget.myStore),
        )
      ),
    );
  }
}
