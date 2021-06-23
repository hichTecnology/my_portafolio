import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portafoglio/CollectionApi/AboutMeApi.dart';
import 'package:my_portafoglio/Desktop/Home_widget/Adout_me/aboutMeMobile.dart';
import 'package:my_portafoglio/Desktop/Home_widget/Adout_me/aboutMeTablet.dart';
import 'package:my_portafoglio/Desktop/Home_widget/ContactSection/ContactSection.dart';
import 'package:my_portafoglio/Desktop/Home_widget/Adout_me/aboutMe.dart';
import 'package:my_portafoglio/Desktop/Home_widget/NavBar/NavBarDesktop.dart';
import 'package:my_portafoglio/Desktop/Home_widget/NavBar/NavBarTablet.dart';
import 'package:my_portafoglio/Desktop/Home_widget/RecentWork/RecentWorkSection.dart';
import 'package:my_portafoglio/Desktop/Home_widget/ServiceSection/ServiceSectionMobile.dart';
import 'package:my_portafoglio/Desktop/Home_widget/ServiceSection/ServiseSection.dart';
import 'package:my_portafoglio/Desktop/Home_widget/ServiceSection/serviceSectionTablet.dart';
import 'package:my_portafoglio/Desktop/Home_widget/Top_section/topSection.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeDesktop extends StatefulWidget {
  final BuildContext context;


  const HomeDesktop({Key key, this.context}) : super(key: key);@override
  _HomeDesktopState createState() => _HomeDesktopState();
}

class _HomeDesktopState extends State<HomeDesktop> {
  ScrollController controller = ScrollController();
  bool bush = true;
  bool alt = true;
  AboutMeApi aboutMeApi = AboutMeApi();
  String myStore = '';
  String myExperience = '';
  int myYears = 0;
  @override
  void initState() {
    controller.addListener( _lesten);
    super.initState();
    aboutMeApi.fetchAbotMe().then((value) {
      setState(() {
        myStore = value[0].myStory;
        myExperience = value[0].myExperience;
        myYears = value[0].years;
      });

    });
  }
  void _lesten(){
    if (controller.offset >= 350 ) {
      setState(() {
        alt = false;
      });



    }else{
      setState(() {
        alt = true;
      });

    }

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:MediaQuery.of(context).size.width < 600 ?AppBar(title: Text(
        'HI-CHtechnology',
        style:
        GoogleFonts.dancingScript(
            textStyle: TextStyle(
                fontSize: 34,
                color: Colors.black,
                fontWeight: FontWeight.bold

            )

      ),),):
      PreferredSize(
          preferredSize:MediaQuery.of(context).size.width < 950 ?
          Size(MediaQuery.of(context).size.width,90):Size(MediaQuery.of(context).size.width,60),
        child: ScreenTypeLayout(
          desktop: NavBarDesktop(controller,myStore),
          tablet: NavBarTablet(controller,myStore),

        )
      ),
      drawer: MediaQuery.of(context).size.width < 600 ?
      Drawer(
        child:ListView(
          children: [
            DrawerHeader(
            child: Center(child: Text('HI-CHtechnology',style: GoogleFonts.dancingScript(
                textStyle: TextStyle(
                    fontSize: 34,
                    color: Colors.black,
                    fontWeight: FontWeight.bold

                )
            ),)),
           ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Center(
                child: InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, '/main/ProfileMe',arguments: myStore).then((value) {
                      Navigator.pop(context);
                    });

                    },
                  child: Container(
                    
                    width: MediaQuery.of(context).size.width,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(12)
                      
                    ),
                    child: Center(
                        child: Text('About',style: TextStyle(
                          fontSize: 18
                        ),)
                    ),
                  ),
                ),
              )
            ),
            Padding(
                padding: const EdgeInsets.all(24.0),
                child: Center(
                  child: InkWell(
                    onTap: (){
                      scrollUp(970);
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey.shade200
                      ),
                      child: Center(
                        child: Text('Service',style: TextStyle(
                          fontSize: 18
                        ),),
                      ),
                      
                    ),
                  ),
                )
            ),
            Padding(
                padding: const EdgeInsets.all(24.0),
                child: Center(
                  child: InkWell(
                    onTap: (){
                      scrollUp(1780);
                      Navigator.pop(context);
                    },
                    child: Center(
                      child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(12)
                        ),
                        child: Center(
                          child: Text('Recente Work',style: TextStyle(
                            fontSize: 18
                          ),),
                        ),
                      ),
                    ),
                  ),
                )
            ),
            Padding(
                padding: const EdgeInsets.all(24.0),
                child: Center(
                  child: InkWell(
                    onTap: (){
                      scrollUp(2800);
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey.shade200
                      ),
                      child: Center(
                        child: Text('Contact',style: TextStyle(
                          fontSize: 18
                        ),),
                      ),
                    ),
                  ),
                )
            )

          ],
        )
      ) :
      null,


      body: SafeArea(
        child: SingleChildScrollView(
          controller: controller,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              topSection(),
              ScreenTypeLayout(
                desktop: aboutMe(myStore,myExperience,myYears),
                tablet: aboutMeTablet(myStore,myExperience,myYears),
                mobile: aboutMeMobile(myStore,myExperience,myYears),
              ),
              ScreenTypeLayout(
                desktop: ServiceSection(),
                tablet: serviceSectionTablet(),
                mobile: ServiceSectionMobile(),
              ),
              RecentWorkSection(),
              Contactsection(),

            ],
          ),
        ),
      ),
    );
  }
  void scrollUp(double sizeHeight) {
    final double start = sizeHeight;

    controller.jumpTo(start);
    // controller.animateTo(start, duration: Duration(seconds: 1), curve: Curves.easeIn);
  }

}
