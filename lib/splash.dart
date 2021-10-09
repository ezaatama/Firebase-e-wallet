import 'package:flutter/material.dart';
import 'screens/auth/login.dart';
import 'screens/home/home.dart';
import 'screens/widgets/widgets.dart';

class Splash extends StatefulWidget {
  const Splash({ Key? key }) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState(){
    _checkUserSementara(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: wAppLoading()
    );
  }

  void _checkUserSementara(bool user) async{
    await Future.delayed(Duration(seconds: 3));

    wPushToReplacement(context, user ? Home() : Login());
  }
}