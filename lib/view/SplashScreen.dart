import 'package:flutter/material.dart';
import 'package:fluttertest/view/DashBoard.dart';
import 'package:fluttertest/view/SignIn.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SharedPreferences prefers;
  bool isLogged=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getSharedPreferences();
    sendtonextscreen();
  }
  _getSharedPreferences() async {
    prefers = await SharedPreferences.getInstance();
    // Do something with prefs if needed
   setState(() {
     isLogged=prefers.getBool('isLogged')!;
   });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Task',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
    );
  }
  Future<void> sendtonextscreen() async{
    await Future.delayed(Duration(seconds: 5));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>isLogged?DashBoard():SignIn()));

  }
}
