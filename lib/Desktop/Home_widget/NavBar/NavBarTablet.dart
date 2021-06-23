import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portafoglio/Desktop/Home_widget/Container_navbar.dart';
class NavBarTablet extends StatefulWidget {
  ScrollController controller ;
  final String myStore;

  NavBarTablet(this.controller,this.myStore);

  @override
  _NavBarTabletState createState() => _NavBarTabletState();
}

class _NavBarTabletState extends State<NavBarTablet> {
  bool bush = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: MediaQuery.of(context).size.width*0.40,
          height: 45,
          color: Colors.white,

          child: Center(
            child: Text('HI-CHtechnology',style: GoogleFonts.dancingScript(
                textStyle: TextStyle(
                    fontSize: 34,
                    color: Colors.black,
                    fontWeight: FontWeight.bold

                )),),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12,right: 12),
          child: Container(

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, '/main/ProfileMe',arguments: widget.myStore);
                    },
                    child: containerNavbar(text: 'About',)),
                InkWell(
                    onTap: (){
                      scrollUp(1100);
                    },
                    child: containerNavbar(text: 'Service',)),
                InkWell(
                    onTap: (){
                      scrollUp(2200);
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
                      scrollUp(3400);
                    },
                    child: AnimatedContainer(
                      height: 34,
                      width: MediaQuery.of(context).size.width*0.15,
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
        ),
      ],
    );
  }
  void scrollUp(double sizeHeight) {
    final double start = sizeHeight;

    widget.controller.jumpTo(start);
    // controller.animateTo(start, duration: Duration(seconds: 1), curve: Curves.easeIn);
  }
}
