

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portafoglio/Desktop/Home_widget/Container_navbar.dart';

class NavBarDesktop extends StatefulWidget {
  ScrollController controller;
  final String myStore;


  NavBarDesktop(this.controller,this.myStore);

  @override
  _NavBarDesktopState createState() => _NavBarDesktopState();
}

class _NavBarDesktopState extends State<NavBarDesktop> {
  bool bush = true;
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.of(context).size.width*0.45,
            height: 80,

            child: Center(
              child: Text('HI-CHtechnology',style: GoogleFonts.dancingScript(
                  textStyle: TextStyle(
                      fontSize: 34,
                      color: Colors.black,
                      fontWeight: FontWeight.bold

                  )
              ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width*0.50,
              height: 80,
              color: Colors.transparent,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){
                      //scrollUp(470);
                      //context.vxNav.push(Uri.parse(RoutesName.SECOND_PAGE));
                      Navigator.pushNamed(context, '/main/ProfileMe',arguments: widget.myStore);
                      
                      


                    },
                      child: containerNavbar(text: 'About',)),
                  InkWell(
                    onTap: (){
                      scrollUp(980);

                    },
                      child: containerNavbar(text: 'Service',)),
                  InkWell(
                    onTap: (){
                      scrollUp(1650);
                    },
                      child: containerNavbar(text: 'Recente Work',)),
                  MouseRegion(
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
                    child: InkWell(
                      onTap: (){
                        scrollUp(2500);

                      },
                      child: AnimatedContainer(
                        height: 34,
                        width: MediaQuery.of(context).size.width*0.10,
                        duration: Duration(microseconds: 200),
                        decoration: BoxDecoration(
                            color:  bush ? Colors.yellowAccent.shade200 : Colors.redAccent,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white,
                                blurRadius: 10.0,
                              ),
                            ]),
                        child: Center(
                          child: Text('Contact',style: TextStyle(
                            color: Colors.black,

                          ),),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )

        ],
      );

  }
  void scrollUp(double sizeHeight) {
    final double start = sizeHeight;

    widget.controller.jumpTo(start);
    // controller.animateTo(start, duration: Duration(seconds: 1), curve: Curves.easeIn);
  }
}
