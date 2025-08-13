import 'package:flutter/material.dart';
import 'package:hackathon_expense_tracker/HomePage.dart';
import 'package:hackathon_expense_tracker/Screens/EditDetails.dart';
import 'package:hackathon_expense_tracker/Screens/ViewProfile.dart';
import 'package:shared_preferences/shared_preferences.dart';
class ProfileNavBar extends StatefulWidget {


  @override
  State<ProfileNavBar> createState() => _ProfileNavBarState();
}

class _ProfileNavBarState extends State<ProfileNavBar> {

  Color iconColor = Color(0xFF009CB2);

  Color fontColor = Color(0xFF1C3A44);

  static const KEYFORNAME = "profileName";
  static const KEYFORADDRESS = "profileAddress";
  static const KEYFOREMAIL = "profileEmail";
  static const KEYFORNUMBER = "profileNumber";

  String? name;
  String? address;

  void initState()
  {
    super.initState();

    getValue();
  }

  void getValue() async
  {
    var pref = await SharedPreferences.getInstance();

    setState(() {
      name = pref.getString(KEYFORNAME) ?? "";
      address = pref.getString(KEYFORADDRESS) ?? "";
    });


  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.transparent,
        actionsPadding: EdgeInsets.only(right: 0),
        leading: Container(
          width: 5,
          height: 10,
          decoration: BoxDecoration(
            color: iconColor,
            borderRadius: BorderRadius.only(topRight: Radius.circular(50.0), bottomRight: Radius.circular(50.0)),
          ),

          child: IconButton(
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>Home("", "", "", "", "")
              ));
            },
            icon: Icon(Icons.arrow_back_ios, color: Colors.white,),
          ),
        ),
        // leading: IconButton(
        //     onPressed: () {},
        //     icon: Icon(Icons.arrow_back_ios),
        // ),
        actions: [
          Container(

            width: 55,
            height: 60,
            decoration: BoxDecoration(
              color: iconColor,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(50.0), bottomLeft: Radius.circular(50.0)),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>EditUserDetails()
                ));
              },
              icon: Icon(Icons.edit, size: 25, color: Colors.white,),
            ),
          ),
        ],
      ),
      body: Stack(
        // alignment: Alignment.center,
        children: [
          // Positioned(
          //   left: 180,
          //   top: 200,
          //   child: Container(
          //     width: 40,
          //     height: 40,
          //     decoration: BoxDecoration(
          //         color: Colors.transparent,
          //         border: Border.all(
          //           color: iconColor,
          //           width: 3,
          //         ),
          //         borderRadius: BorderRadius.circular(100)
          //     ),
          //   ),
          // ),

          Positioned(
            right: 110,
            top: 60,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                    color: iconColor,
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(100)
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 50,
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 170,
                height: 170,

                decoration: BoxDecoration(
                  // image: DecorationImage(image: NetworkImage("https://media.hswstatic.com/eyJidWNrZXQiOiJjb250ZW50Lmhzd3N0YXRpYy5jb20iLCJrZXkiOiJnaWZcL3BsYXlcLzBiN2Y0ZTliLWY1OWMtNDAyNC05ZjA2LWIzZGMxMjg1MGFiNy0xOTIwLTEwODAuanBnIiwiZWRpdHMiOnsicmVzaXplIjp7IndpZHRoIjo4Mjh9fX0="),
                  //   fit: BoxFit.contain,
                  // ),
                    color: iconColor.withOpacity(0.5),
                  // border: Border.all(
                  //   color: Colors.black,
                  // ),
                  borderRadius: BorderRadius.circular(100)
                ),
                child: Container(
                    child: CircleAvatar(
                      // radius: 10,
                      backgroundColor: Colors.transparent,
                      // backgroundImage: NetworkImage("https://media.hswstatic.com/eyJidWNrZXQiOiJjb250ZW50Lmhzd3N0YXRpYy5jb20iLCJrZXkiOiJnaWZcL3BsYXlcLzBiN2Y0ZTliLWY1OWMtNDAyNC05ZjA2LWIzZGMxMjg1MGFiNy0xOTIwLTEwODAuanBnIiwiZWRpdHMiOnsicmVzaXplIjp7IndpZHRoIjo4Mjh9fX0="),
                      backgroundImage:AssetImage("assets/person.webp"),
                    )
                ),
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
                  color: Colors.white,
                  border: Border.all(
                    color: iconColor,
                    width: 3,
                  ),
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
                  color: Colors.white,
                  border: Border.all(
                    color: iconColor,
                    width: 3,
                  ),
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
                  color: Colors.white,
                  border: Border.all(
                    color: iconColor.withOpacity(0.2),
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(100)
              ),
            ),
          ),

          Positioned(
            right: 95,
            top: 160,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.7),
                  // border: Border.all(
                  //   color: Colors.cyan,
                  //   width: 3,
                  // ),

                  borderRadius: BorderRadius.circular(100)
              ),
              child: Icon(Icons.edit, size: 30, color: Colors.white,),
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
            top: 230,
            child: Container(

              // color: Colors.cyan,
              child: Column(
                children: <Widget>[
                  Text("${name}", style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: fontColor,
                  ),),
                  Text("$address", style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: fontColor,
                    
                  ),),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 320,
            child: Container(

              padding: EdgeInsets.only(left: 25.0,right: 25.0),
              margin: EdgeInsets.only(top: 20.0),
              // color: Colors.cyan,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 10.0,right: 10.0, bottom: 6.0, top: 6.0),
                    width: double.infinity,
                    // height: 60,
                    decoration: BoxDecoration(
                      color: iconColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Row(
                            children: [

                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: iconColor,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Icon(Icons.person_sharp, color: Colors.white, size: 30,),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text("View Profile", style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: fontColor,
                              ),),
                            ],
                          ),
                        ),


                        IconButton(onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ViewUserProfile()
                          ));
                        }, icon: Icon(Icons.arrow_forward_ios, size: 20, color: fontColor,),),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10.0,right: 10.0, bottom: 6.0, top: 6.0),
                    width: double.infinity,
                    // height: 60,
                    decoration: BoxDecoration(
                      color: iconColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(15),
                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Row(
                            children: [

                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: iconColor,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Icon(Icons.mode_edit_outlined, color: Colors.white, size: 27,),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text("Edit Profile", style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: fontColor,
                              ),),
                            ],
                          ),
                        ),


                        IconButton(onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => EditUserDetails()
                          ));
                        }, icon: Icon(Icons.arrow_forward_ios, size: 20, color: fontColor,),),
                      ],
                    ),
                  ),


                ],
              ),
            ),
          ),


        ],

      )
    );
  }
}
