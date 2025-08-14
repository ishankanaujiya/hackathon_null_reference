import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hackathon_expense_tracker/HomePage.dart';
import 'package:hackathon_expense_tracker/Screens/CreateAccount.dart';
import 'package:shared_preferences/shared_preferences.dart';
class PromoteApp extends StatefulWidget {


  @override
  State<PromoteApp> createState() => _PromoteAppState();
}

class _PromoteAppState extends State<PromoteApp> {

  Color iconColor = Color(0xFF009CB2);

  Color fontColor = Color(0xFF1C3A44);

  static const KEYFORNAME = "profileName";
  static const KEYFORADDRESS = "profileAddress";
  static const KEYFOREMAIL = "profileEmail";
  static const KEYFORNUMBER = "profileNumber";

  String name = "";
  String address = "";

  bool checkStroredValue = false;

  @override
  void initState() {
    super.initState();
    checkStoredDataAndNavigate();
  }

  void checkStoredDataAndNavigate() async {
    var pref = await SharedPreferences.getInstance();

    name = pref.getString(KEYFORNAME) ?? "";
    address = pref.getString(KEYFORADDRESS) ?? "";

    checkStroredValue = name.isNotEmpty && address.isNotEmpty;

    // Delay splash screen
    await Future.delayed(Duration(seconds: 3));

    if (checkStroredValue) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Home("", "", "", "", "")),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => CreateAccount()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 60.0),
          child: Stack(
            // alignment: Alignment.center,
            children: [

              Positioned(
                right: 110,
                top: 60,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: iconColor.withOpacity(0.1),
                      // border: Border.all(
                      //   color: iconColor.withOpacity(0.2),
                      //   width: 3,
                      // ),
                      borderRadius: BorderRadius.circular(100)
                  ),
                ),
              ),

              Positioned(
                left: 110,
                top: 50,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      color: iconColor.withOpacity(0.1),
                      // border: Border.all(
                      //   color: iconColor.withOpacity(0.2),
                      //   width: 3,
                      // ),
                      borderRadius: BorderRadius.circular(100)
                  ),
                ),
              ),

              Positioned(
                left: 70,
                top: 130,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: iconColor.withOpacity(0.1),
                      // border: Border.all(
                      //   color: iconColor.withOpacity(0.2),
                      //   width: 3,
                      // ),
                      borderRadius: BorderRadius.circular(100)
                  ),
                ),
              ),

              Positioned(
                right: 50,
                top: 220,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: iconColor.withOpacity(0.1),
                      // border: Border.all(
                      //   color: iconColor.withOpacity(0.2),
                      //   width: 3,
                      // ),
                      borderRadius: BorderRadius.circular(100)
                  ),
                ),
              ),




              Positioned(
                right: -165,
                bottom: -20,
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                      color: iconColor.withOpacity(0.1),
                      // border: Border.all(
                      //   color: Colors.cyan,
                      //   width: 3,
                      // ),

                      borderRadius: BorderRadius.circular(100)
                  ),

                ),
              ),

              Positioned(
                left: -160,
                bottom: 350,
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                      color: iconColor.withOpacity(0.1),
                      // border: Border.all(
                      //   color: Colors.cyan,
                      //   width: 3,
                      // ),

                      borderRadius: BorderRadius.circular(100)
                  ),

                ),
              ),

              Positioned(
                left: -15,
                bottom: -6,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      color: iconColor.withOpacity(0.1),
                      // border: Border.all(
                      //   color: iconColor.withOpacity(0.2),
                      //   width: 3,
                      // ),
                      borderRadius: BorderRadius.circular(100)
                  ),
                ),
              ),

              Positioned(
                left: 0,
                bottom: 90,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      color: iconColor.withOpacity(0.1),
                      // border: Border.all(
                      //   color: iconColor.withOpacity(0.2),
                      //   width: 3,
                      // ),
                      borderRadius: BorderRadius.circular(100)
                  ),
                ),
              ),

              Positioned(
                left: 90,
                bottom: 20,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      color: iconColor.withOpacity(0.1),
                      // border: Border.all(
                      //   color: iconColor.withOpacity(0.2),
                      //   width: 3,
                      // ),
                      borderRadius: BorderRadius.circular(100)
                  ),
                ),
              ),

              Positioned(
                left: 100,
                bottom: 110,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      color: iconColor.withOpacity(0.1),
                      // border: Border.all(
                      //   color: iconColor.withOpacity(0.2),
                      //   width: 3,
                      // ),
                      borderRadius: BorderRadius.circular(100)
                  ),
                ),
              ),

              Positioned(
                right: -160,
                top: -20,
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                      color: iconColor.withOpacity(0.1),
                      // border: Border.all(
                      //   color: Colors.cyan,
                      //   width: 3,
                      // ),

                      borderRadius: BorderRadius.circular(100)
                  ),

                ),
              ),

              Positioned(
                left: 0,
                right: 0,
                top: 220,
                child: Container(

                  // color: Colors.cyan,
                  child: Column(
                    children: <Widget>[

                      Container(
                        width: 150,
                        height: 100,
                        decoration: BoxDecoration(
                          color: iconColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(image: AssetImage("assets/expenses.png")),
                        ),
                      ),
                      Text("Expense Tracker", style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: iconColor,
                      ),),
                    ],
                  ),
                ),
              ),

              Positioned(
                left: 0,
                right: 0,
                bottom: 50,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(

                    // color: Colors.cyan,
                    child: Column(
                      children: <Widget>[


                        Text("Powered By: Null Reference", style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: iconColor.withOpacity(0.5),
                        ),),
                      ],
                    ),
                  ),
                ),
              ),



            ],

          ),
        )
    );
  }
}
