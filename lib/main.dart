import 'package:flutter/material.dart';
import 'package:my_portafoglio/Desktop/home_desktop.dart';
import 'package:my_portafoglio/Routers/FluroRoutes.dart';
import 'package:my_portafoglio/Style/Style_colors.dart';





void main() {



  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Flurorouter.setupRouter();
  }
  @override
  Widget build(BuildContext context) {

    return MaterialApp(



      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      color: StyleColors.PrimoColore,
      initialRoute: '/',
      onGenerateRoute: Flurorouter.router.generator,
      /*routes: {
        DetailWork.route: (context) => DetailWork(ModalRoute.of(context).settings.arguments),
        ProfileMe.route : (context) => ProfileMe(),
      },*/
      /*builder: (context, child) => MyHomePage(child :child ),
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: RoutesName.FIRST_PAGE,*/



      //home: MyHomePage(),
      /*routerDelegate: HomeRouterDelegate(),
      routeInformationParser: HomeRouteInformationParser(),*/
      /*routeInformationParser: VxInformationParser(),
      routerDelegate: VxNavigator(routes: {

        "/": (_,__)=> MaterialPage(child: HomeDesktop()),
        RoutesName.SECOND_PAGE : (_,__) => MaterialPage(child: ProfileMe()),
        RoutesName.Detail_PAGE : (_,params) {

          return MaterialPage(child: DetailWork(params));
        }
      }),*/

    );
  }
}





class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: StyleColors.PrimoColore,
      body: HomeDesktop(),
    );
  }
}
