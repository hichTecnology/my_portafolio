import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:my_portafoglio/Desktop/Detail/DetailWork.dart';
import 'package:my_portafoglio/Desktop/Profile/ProfileMe.dart';
import 'package:my_portafoglio/Desktop/home_desktop.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static Handler _homeHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          HomeDesktop());

  static Handler _profileHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          ProfileME(ModalRoute.of(context).settings.arguments));
  static Handler _detailHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          DetailWork(ModalRoute.of(context).settings.arguments));// this one is for one paramter passing...

  // lets create for two parameters tooo...
  /*static Handler _mainHandler2 = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          LandingPage(page: params['name'][0],extra: params['extra'][0],));*/

  // ok its all set now .....
  // now lets have a handler for passing parameter tooo....


  static void setupRouter(){
    router.define(
      '/',
      handler: _homeHandler,
    );
    router.define(
      '/main/:name',
      handler: _profileHandler,
      transitionType: TransitionType.fadeIn,
    );
    router.define(
      '/detail/:name',
      handler: _detailHandler,
      transitionType: TransitionType.fadeIn,
    );

    /*router.define(
      '/main/:name/:extra',
      handler: _mainHandler2,
      transitionType: TransitionType.fadeIn,
    );*/
  }

}