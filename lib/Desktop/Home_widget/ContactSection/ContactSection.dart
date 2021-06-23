import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_portafoglio/CollectionApi/CategoryApi.dart';
import 'package:my_portafoglio/CollectionApi/CustomersApi.dart';
import 'package:my_portafoglio/Desktop/Components/DefoultButton.dart';
import 'package:my_portafoglio/Desktop/Components/sectionTitle.dart';
import 'package:my_portafoglio/Desktop/Components/SocialCard.dart';
import 'package:my_portafoglio/Model/CategoryModel.dart';

class Contactsection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Container(
      // this height only for demo
      // height: 500,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFFE8F0F9),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("Images/letter.jpg"),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 20 * 2.5),
          sectionTitle(
            title: "Contact Me",
            subTitle: "For Project inquiry and information",
            color: Color(0xFF07E24A),
          ),
          ContactBox()
        ],
      ),
    );
  }
}
class ContactBox extends StatelessWidget {
  const ContactBox({
    Key key,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {


    return Container(
      constraints: BoxConstraints(maxWidth: 1110),
      margin: EdgeInsets.only(top: 20.0 * 2),
      padding: EdgeInsets.all(20.0 * 3),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          /*SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SocialCard(
                  color: Color(0xFFD9FFFC),
                  iconSrc: "Images/skype.png",
                  name: 'TheFlutterWay',
                  press: () {},
                ),
                SocialCard(
                  color: Color(0xFFE4FFC7),
                  iconSrc: "Images/whatsapp.png",
                  name: 'TheFlutterWay',
                  press: () {},
                ),
                SocialCard(
                  color: Color(0xFFE8F0F9),
                  iconSrc: "Images/messanger.png",
                  name: 'TheFlutterWay',
                  press: () {},
                ),
              ],
            ),
          ),*/
          SizedBox(height: 20.0 * 2),
          ContactForm(),
        ],
      ),
    );
  }
}
class ContactForm extends StatefulWidget {
  const ContactForm({
    Key key,
  }) : super(key: key);

  @override
  _ContactFormState createState() => _ContactFormState();
}


class _ContactFormState extends State<ContactForm> {

  String firstName = '';
  String email = '';
  String description = '';
  double budgetProject ;
  List<String> category = [];
  CategoryApi categoryApi = CategoryApi();
  CustomerApi customerApi = CustomerApi();
  List<CategoryModel> modelCategory;



  List<itemChechbox> checken = [];
  @override
  void initState() {
    categoryApi.fetchCategory().then((value) {
      for(var item in value){
        checken.add(itemChechbox(item, false));
      }
      print(checken[0].categoryModel.name);
    });


    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Form(
      child: Wrap(
        spacing: 20 * 2.5,
        runSpacing: 20 * 1.5,
        children: [
          SizedBox(
            width: 470,
            child: TextFormField(
              onChanged: (value) {
                setState(() {
                  firstName = value;
                });

              },
              decoration: InputDecoration(
                labelText: "Your Name",
                hintText: "Enter Your Name",
              ),
            ),
          ),
          SizedBox(
            width: 470,
            child: TextFormField(
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
              decoration: InputDecoration(
                labelText: "Email Address",
                hintText: "Enter your email address",
              ),
            ),
          ),
          SizedBox(
            width: 470,
            height: 220,
            child: TextFormField(
              minLines: 5,
              maxLines: 10,
              onChanged: (value) {
                setState(() {
                  description = value;
                });
              },
              decoration: InputDecoration(
                labelText: "Project Type",
                hintText: "Select Project Type",
              ),
            ),
          ),
          SizedBox(
            width: 470,
            child: TextFormField(
              onChanged: (value) {
                budgetProject = double.parse(value);

              },
              decoration: InputDecoration(
                labelText: "Project Budget",
                hintText: "Select Project Budget",
              ),
            ),
          ),

          FutureBuilder(
            future: categoryApi.fetchCategory(),
              builder:(BuildContext context ,AsyncSnapshot<List<CategoryModel>> projectAsync){
                   if(!projectAsync.hasData){
                     return Text('Error.....');
                   }
                   else{
                     return Center(
                       child: Container(
                         height: 220,
                           width: MediaQuery.of(context).size.width*0.55,
                           child:
                         ListView.builder(

                           itemCount:checken.length,
                           itemBuilder: (context, index) {
                             return CheckboxListTile(

                               title: Text(checken[index].categoryModel.name),
                               value:checken[index].check,
                               onChanged: ( val) {

                                 setState(() {

                                   checken[index].check = val;
                                   if(val == true){
                                     category.add(checken[index].categoryModel.idCategory);


                                   }
                                   else{
                                     category.remove(checken[index].categoryModel.idCategory);


                                   }
                                   print(category);
                                 });
                                 },

                             );
                           },
                         )
                       ),
                     );
                   }
              }),
          SizedBox(height: 20.0 * 2),
          Center(
            child: FittedBox(
              child: DefaultButton(
                imageSrc: "Images/contact_icon.png",
                text: "Contact Me!",
                press: () {

                  customerApi.sendRequest(firstName, email, description,budgetProject,category).then((value) {
                    print(value.email);
                  });

                  },
              ),
            ),
          )
        ],
      ),
    );
  }
}
class itemChechbox {
   CategoryModel categoryModel;
   bool check;

   itemChechbox(this.categoryModel, this.check);
}
