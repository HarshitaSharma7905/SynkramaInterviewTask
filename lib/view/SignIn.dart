import 'package:flutter/material.dart';
import 'package:fluttertest/view/DashBoard.dart';
import 'package:fluttertest/view/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  void _submitForm() async{
    if (_formKey.currentState?.validate() == true) {
      SharedPreferences prefers =await SharedPreferences.getInstance();
      String _email = _emailController.text.trim();
      String _password =_passwordController.text.trim();
      String? email=prefers.getString('email');
      String? password=prefers.getString('password');
      if(_email==email && password==_password){
        prefers.setBool('isLogged', true);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DashBoard(),));
      }else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Invalid Login Credential"),));
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign In'),centerTitle: true),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'Gmail',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Gmail.';
                  }
                  if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$').hasMatch(value)) {
                    return 'Please enter a valid email address.';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10,),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password.';
                  }
                  if (value.length < 8) {
                    return 'Password must be at least 8 characters long.';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10,),
              Container(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Add logic for 'Forgot Password'
                  },
                  child: Text('Forgot Password'),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                width: 250,
                height: 40,
                child: ElevatedButton(
                  onPressed: _submitForm,
                  child: Text('Sign In'),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                width: 250,
                height: 40,
                child:TextButton(onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => signup(),));
                },child: Text('Dont have account? Sign Up'),)
              ),

            ],
          ),
        ),
      ),
      persistentFooterButtons: [
        Column(
          children: [
            Container(child: Text('Sign In with Social Media Account')),
            Container(
              height: 100,
              child: Row(
                  mainAxisAlignment:MainAxisAlignment.center ,
                  children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(shape:BoxShape.circle ),
                  child:Image.asset('assets/facebook.png'),
                           ),
                SizedBox(width: 30),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(shape:BoxShape.circle ),
                  child:Image.asset('assets/google.png'),
                )
              ]),
      ),
          ],
        )],
    );
  }
}
