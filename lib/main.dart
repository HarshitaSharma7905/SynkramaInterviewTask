import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertest/view/DashBoard.dart';
import 'package:fluttertest/view/SignIn.dart';
import 'package:fluttertest/view/SplashScreen.dart';
import 'package:fluttertest/view/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  runApp(MyApp());

}
class MyApp extends StatelessWidget {

   MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     home: SplashScreen(),
    );
  }
}
