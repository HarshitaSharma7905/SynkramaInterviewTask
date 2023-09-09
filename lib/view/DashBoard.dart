import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'DashBoardSection/Home.dart';
import 'DashBoardSection/Order.dart';
import 'DashBoardSection/profile.dart';
import 'SignIn.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int index=0;
  List screen=[Home(),Order(),Profile()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent,
      title: Text('DashBoard',style: TextStyle(color:  Colors.black)),centerTitle: true,
      bottom: PreferredSize(preferredSize: Size.fromHeight(30),child: Container(
        padding: EdgeInsets.all(10),
        alignment: Alignment.centerRight,
        child: ElevatedButton(onPressed:() async {
          SharedPreferences prefers =await SharedPreferences.getInstance();
          prefers.setBool('isLogged', false);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignIn(),));
        },child: Text('Logout')),
      ), )),
      body: screen[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index=value;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag),label: 'Order'),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Profile'),
        ],
      ),
    );
  }
}
