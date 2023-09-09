import 'package:flutter/material.dart';
import 'package:fluttertest/view/DashBoard.dart';
import 'package:shared_preferences/shared_preferences.dart';
class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  bool checkbool = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  void _submitForm() async{
    if (_formKey.currentState?.validate() == true)  {
      SharedPreferences prefers =await SharedPreferences.getInstance();
      String name = _nameController.text.trim();
      String email = _emailController.text.trim();
      String password = _passwordController.text.trim();
      String cpassword = _confirmPasswordController.text.trim();
     if(checkbool==true){
       if(password==cpassword){
         prefers.setString('name',name);
         prefers.setString('email', email);
         prefers.setString('password', password);
         prefers.setBool('isLogged', true);
         Navigator.push(context, MaterialPageRoute(builder: (context) => DashBoard(),));
       }else{
         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
           content: Text("Password doesnt match"),));
       }
     }else{
       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
         content: Text("Check Term & Condition"),));
     }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up'),centerTitle: true),
     body:
           Container(
             margin: EdgeInsets.all(20),
             child: Form(
               key: _formKey,
               child: Column(
                 children: [
                   TextFormField(
                     controller: _nameController,
                     decoration: InputDecoration(
                       hintText: 'Name',
                       border: OutlineInputBorder(),
                     ),
                     validator: (value) {
                       if (value == null || value.isEmpty) {
                         return 'Please enter your name.';
                       }
                       return null;
                     },
                   ),
                   SizedBox(height: 10,),
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
                   TextFormField(
                     controller: _confirmPasswordController,
                     decoration: InputDecoration(
                       hintText: 'Confirm Password',
                       border: OutlineInputBorder(),
                     ),
                     obscureText: true,
                     validator: (value) {
                       if (value == null || value.isEmpty) {
                         return 'Please confirm your password.';
                       }
                       if (value != _passwordController.text) {
                         return 'Passwords do not match.';
                       }
                       return null;
                     },
                   ),
                   SizedBox(height: 10,),
                   Row(
                     children: [
                       Checkbox(value: checkbool, onChanged: (value) {
                         if(checkbool==false){
                           setState(() {
                             checkbool=true;
                           });
                         }else{
                           setState(() {
                             checkbool=false;
                           });
                         }
                       },),
                       Text('Term & Conditions')
                     ],
                   ),SizedBox(height: 10,),
                   Container(
                     width: 250,
                     height: 40,
                     child: ElevatedButton(
                       onPressed: _submitForm,
                       child: Text('Sign Up'),
                     ),
                   ),
                 ],
               ),
             ),
           ),
    );
  }
}
