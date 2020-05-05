import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tollm/API/Services.dart';
import 'package:tollm/pages/homePage.dart';
import '../Color/light_color.dart';

class LoginSignUpPage extends StatefulWidget {
  @override
  _LoginSignUpPageState createState() => _LoginSignUpPageState();
}

class _LoginSignUpPageState extends State<LoginSignUpPage> {
  String carNumber;
  String password;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Services services = Services();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(flex: 1  ,child: Container(),),
           Expanded(
             flex:1,
             child: Column(children: <Widget>[
               Padding(
                 padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                 child: TextFormField(
                   keyboardType: TextInputType.text,
                   decoration: const InputDecoration(
                     hintText: 'Car Number Plate',
                     icon: Icon(
                       Icons.directions_car,
                       color: LightColor.navyBlue2,
                     ),
                   ),
                   validator: (value) =>
                   value.isEmpty ? 'Car Number can\'t be empty' : null,
                  onChanged: (value){
                    carNumber = value.trim();
                  },
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
                 child: TextFormField(
                   obscureText: true,
                   decoration: const InputDecoration(
                     hintText: 'Password',
                     icon: Icon(
                       Icons.lock,
                       color: LightColor.navyBlue2,
                     ),
                   ),
                   validator: (value) =>
                   value.isEmpty ? 'Passwoed can\'t be empty' : null,
                  onChanged: (value) => password = value.trim(),
                 ),
               ),
               Padding(
                 padding: EdgeInsets.fromLTRB(15.0, 40.0, 15.0, 0.0),
                 child: Container(
                   height: 50.0,
                   width: double.infinity,
                   child: RaisedButton(
                     elevation: 5.0,
                     shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(30.0)),
                     color: LightColor.navyBlue2,
                     child: Text('LOGIN',
                         style: TextStyle(fontSize: 20.0, color: Colors.white)),
                     onPressed: () async{
                       Services service = Services();

                       if(await service.login(carNumber,password) == "success"){
                         await Services.getProfile(carNumber);
                         Navigator.push(
                           context,
                           MaterialPageRoute(builder: (context) => HomePage(),),
                         );
                       }
                       else
                         {
                           print('error');
                         }
                     },
                   ),
                 ),
               ),
             ],),
           )
           
          ],
        ),
      ),
    );
  }
}
