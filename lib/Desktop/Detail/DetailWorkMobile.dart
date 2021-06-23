import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:my_portafoglio/CollectionApi/WorkApi.dart';
import 'package:my_portafoglio/Model/WorkModel.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';
class DetailWorkMobile extends StatefulWidget {
  WorkModel workModel;

  DetailWorkMobile(this.workModel);

  @override
  _DetailWorkMobileState createState() => _DetailWorkMobileState();
}

class _DetailWorkMobileState extends State<DetailWorkMobile> {
  WorkApi workApi = WorkApi();
  WorkModel workModel1;
  bool loading = false;
  bool loading1 = false;

  final _currentPageNotifier = ValueNotifier<int>(0);
  @override
  void initState() {
    setState(() {
      loading1 = true;
    });
    if (kIsWeb) {
      var source = Uri.base.fragment;
      var output = source.substring(8,source.length);

        workApi.fetchWorksId(output).then((value) {
          if(value.title != null){
            setState(() {
              loading = true;
              workModel1 =value;
            });
          }
        });
    }else{
      setState(() {
        loading = true;
        workModel1 = widget.workModel;
      });
    }

    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child:loading == false?Container(

        ):
        SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  height: 320,
                  child: PageView.builder(
                      onPageChanged: (int index){
                        _currentPageNotifier.value = index;
                      },
                    itemCount:  workModel1.gallery.length,
                      itemBuilder: (context,index){
                        return Container(
                          child: Image(
                            image: NetworkImage(workModel1.gallery[index]),
                          ),

                        );
                      }),
                ),
              ),

              SizedBox(
               height: 12,
              ),
              Center(
                child:_buildCircleIndicator2() ,
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                height: 65,
                child: Wrap(

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
              SizedBox(height: 12,),
              Container(
                height: 65,
                child: Wrap(

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
              SizedBox(height: 34,),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  child: Center(
                    child: Text(workModel1.description),
                  ),
                ),
              )



            ],
          ),
        ),
      ),
    );
  }
  _buildCircleIndicator2() {
    return CirclePageIndicator(
      size: 10.0,
      selectedSize: 12.0,
      dotColor: Colors.red,
      itemCount:workModel1.gallery.length,
      currentPageNotifier: _currentPageNotifier,
    );
  }
}
