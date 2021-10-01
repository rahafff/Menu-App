import 'package:injectable/injectable.dart';
import 'package:flutter/material.dart';
import 'package:rightware/module_category/category_routes.dart';
import 'package:rightware/utils/images/images.dart';

  @injectable
  class SplashScreen extends StatefulWidget {

  SplashScreen();
    @override
    _SplashScreenState createState() => _SplashScreenState();
  }
  
  class _SplashScreenState extends State<SplashScreen> {
    @override
  void initState() {
    super.initState();
        WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      _getNextRoute().then((route) {
       Navigator.of(context).pushNamedAndRemoveUntil(route, (route) => false);
      });
    });
  }
    @override
    Widget build(BuildContext context) {
      var paddingOfImage = MediaQuery.of(context).size.height * 0.08;
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImageAsset.SPLASH),
                fit: BoxFit.cover,
              ))));
    }
    
  Future<String> _getNextRoute() async {
      await Future.delayed(Duration(seconds: 4));
    return CategoryRoutes.CATEGORIES;
      // return MainRoutes.MAIN_SCREEN;
  }

  }
