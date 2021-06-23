import 'package:flutter/material.dart';
class topSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;
    return Container(
      height: sizeWidth < 600 ?420:MediaQuery.of(context).size.height*0.80,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("Images/sfondo.jpg"),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width*0.50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    child: Text('Hello,  I am',style: TextStyle(
                        color: Colors.white
                    ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),

                  child: Text('El Mir',style: TextStyle(
                      fontSize: sizeWidth < 600 ? 40:65,
                      color: Colors.white
                  ),),

                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),

                  child: Text('Hicham',style: TextStyle(
                      fontSize: sizeWidth < 600 ? 40:65,
                      color: Colors.white
                  ),),

                )
              ],
            ),
          ),

           Container(
              width: MediaQuery.of(context).size.width*0.45,
              height: MediaQuery.of(context).size.height,
              child: Align(
                alignment: Alignment.bottomRight,
                  child: Image.asset('Images/imageProfile.png')),

            ),

        ],
      ),
    );
  }
}
