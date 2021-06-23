import 'package:flutter/material.dart';
import 'package:my_portafoglio/CollectionApi/WorkApi.dart';
import 'package:my_portafoglio/Desktop/Detail/imageCard.dart';
import 'package:my_portafoglio/Model/WorkModel.dart';



class DetailWorkDesktop extends StatefulWidget {
  WorkModel workModelDesktop;

  DetailWorkDesktop(this.workModelDesktop);

  @override
  _DetailWorkDesktopState createState() => _DetailWorkDesktopState();
}

class _DetailWorkDesktopState extends State<DetailWorkDesktop> {
  WorkApi workApi = WorkApi();
  WorkModel workModel1;
  bool loading = false;
  @override
  void initState() {



    var source = Uri.base.fragment;
    var output = source.substring(8,source.length);
    if(idWorkId != ''){
      workApi.fetchWorksId(idWorkId).then((value) {
        if(value.title != null){
          setState(() {
            loading = true;
            workModel1 =value;
          });
        }
      });
    }else{
      workApi.fetchWorksId(output).then((value) {
        if(value.title != null){
          setState(() {
            loading = true;
            workModel1 =value;
          });
        }
      });
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: loading == false ? Container():SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 650,
                child: Row(
                  children: [
                    SingleChildScrollView(
                      child: Container(
                        width: sizeWidth*0.45,
                        margin: EdgeInsets.all(24),
                        child: Center(
                          child: Text(
                            workModel1.description,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: sizeWidth * 0.45,
                      child: Image.network(workModel1.image),
                    )
                  ],
                ),
              ),
              Container(
                height: 65,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(workModel1.category.length,
                            (index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 120,
                            height: 34,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.shade200
                            ),
                            child: Row(
                              children: [
                                Image.network(workModel1.category[index].image),
                                SizedBox(width: 12,),
                                Center(child: Text(workModel1.category[index].name)),
                              ],
                            ),
                          ),
                        ))
                ),
              ),
              Container(
                height: 65,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(workModel1.linguaggio.length,
                            (index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 120,
                            height: 34,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.shade200
                            ),
                            child: Row(
                              children: [
                                Image.network(workModel1.linguaggio[index].image),
                                SizedBox(width: 12,),
                                Center(child: Text(workModel1.linguaggio[index].name)),
                              ],
                            ),
                          ),
                        ))
                ),
              ),
              Container(
                height: 650,

                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(workModel1.gallery.length,
                              (index) => imageCard(workModel1.gallery[index])
                      )),
                ),

              )
            ],
          ),
        ),
      ),
    );
  }
}
