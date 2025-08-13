import 'package:flutter/material.dart';
import 'package:hackathon_expense_tracker/HomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';
class EditUserDetails extends StatefulWidget {


  @override
  State<EditUserDetails> createState() => _EditUserDetailsState();
}

class _EditUserDetailsState extends State<EditUserDetails> {

  Color iconColor = Color(0xFF009CB2);

  Color fontColor = Color(0xFF1C3A44);

  var nameTextField = TextEditingController();
  var addressTextField = TextEditingController();
  var emailTextField = TextEditingController();
  var phoneNumberTextField = TextEditingController();

  static const KEYFORNAME = "profileName";
  static const KEYFORADDRESS = "profileAddress";
  static const KEYFOREMAIL = "profileEmail";
  static const KEYFORNUMBER = "profileNumber";


  void initState()
  {
    super.initState();

    getValue();
  }

  void storeValue() async
  {
    var pref = await SharedPreferences.getInstance();

    pref.setString(KEYFORNAME, nameTextField.text);
    pref.setString(KEYFORADDRESS, addressTextField.text);
    pref.setString(KEYFOREMAIL, emailTextField.text);
    pref.setString(KEYFORNUMBER, phoneNumberTextField.text);

    print("Value Stored");
  }


  void getValue() async
  {
    var pref = await SharedPreferences.getInstance();

    nameTextField.text = pref.getString(KEYFORNAME).toString();
    addressTextField.text = pref.getString(KEYFORADDRESS).toString();
    emailTextField.text = pref.getString(KEYFOREMAIL).toString();
    phoneNumberTextField.text = pref.getString(KEYFORNUMBER).toString();
    setState(() {
      
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(

          actionsPadding: EdgeInsets.only(right: 0),
          leading: Container(
            decoration: BoxDecoration(
              color: iconColor,
              borderRadius: BorderRadius.only(topRight: Radius.circular(50.0), bottomRight: Radius.circular(50.0)),
            ),

            child: IconButton(
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home("", "", "", "", "")
                ));
              },
              icon: Icon(Icons.arrow_back_ios, color: Colors.white,),
            ),
          ),

          title: Text("Edit Profile", style: TextStyle(
            fontWeight: FontWeight.bold,
            color: iconColor,
          ),),
          centerTitle: true,

        ),
        body: Stack(

          children: [

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

            Container(
              padding: EdgeInsets.only(left: 30.0, right: 30.0),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 0.0, right: 6.0),
                    margin: EdgeInsets.only(left: 0.0, right: 0.0, bottom: 0, top: 50.0),
                    decoration: BoxDecoration(
                      color: iconColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),

                    ),

                    child: TextField(
                      controller: nameTextField,
                      // controller: amountForExpenseTextField,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(

                        label: Text("Name", style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: iconColor,
                        ),),
                        
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,

                            )
                        ),

                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,

                            )
                        ),

                        disabledBorder:OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,

                            )
                        ),

                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 0.0, right: 6.0),
                    margin: EdgeInsets.only(left: 0.0, right: 0.0, bottom: 0, top: 50.0),
                    decoration: BoxDecoration(
                      color: iconColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),

                    ),

                    child: TextField(
                      controller: addressTextField,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(

                        label: Text("Address", style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: iconColor,
                        ),),
                        
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,

                            )
                        ),

                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,

                            )
                        ),

                        disabledBorder:OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,

                            )
                        ),

                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 0.0, right: 6.0),
                    margin: EdgeInsets.only(left: 0.0, right: 0.0, bottom: 0, top: 50.0),
                    decoration: BoxDecoration(
                      color: iconColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),

                    ),

                    child: TextField(
                      controller: emailTextField,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(

                        label: Text("Email", style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: iconColor,
                        ),),
                        
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,

                            )
                        ),

                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,

                            )
                        ),

                        disabledBorder:OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,

                            )
                        ),

                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 0.0, right: 6.0),
                    margin: EdgeInsets.only(left: 0.0, right: 0.0, bottom: 0, top: 50.0),
                    decoration: BoxDecoration(
                      color: iconColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),

                    ),

                    child: TextField(
                      controller: phoneNumberTextField,
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(

                        label: Text("Phone Number", style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: iconColor,
                        ),),
                        
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,

                            )
                        ),

                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,

                            )
                        ),

                        disabledBorder:OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,

                            )
                        ),

                      ),
                    ),
                  ),

                  SizedBox(
                    height: 50,
                  ),

                  SizedBox(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        bool containsAtSign = false;
                        print("Check");
                        if(nameTextField.text.isEmpty || addressTextField.text.isEmpty || emailTextField.text.isEmpty || phoneNumberTextField.text.isEmpty)
                          {
                            showDialog(context: context, builder: (context) => AlertDialog(
                              title: Text("Required", style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,

                              ),),
                              content: Text("Enter all the fields", style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,

                              ),),
                              actions: [
                                ElevatedButton(onPressed: () {
                                  Navigator.pop(context);
                                }, child: Text("OK", style: TextStyle(
                                  color: iconColor,
                                  fontWeight: FontWeight.bold,

                                ),))
                              ],
                              backgroundColor: iconColor,
                            ));
                            return;
                          }

                        for(int i = 0; i<phoneNumberTextField.text.length; i++)
                          {
                            String checkNumber = phoneNumberTextField.text[i];
                             print(checkNumber);

                            if(checkNumber.codeUnitAt(0) >= 65 && checkNumber.codeUnitAt(0) <= 90 || checkNumber.codeUnitAt(0) >= 97 && checkNumber.codeUnitAt(0) <= 122 )
                              {
                                showDialog(context: context, builder: (context) => AlertDialog(
                                  title: Text("Error", style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,

                                  ),),
                                  content: Text("Only digits from (0-9) are accepted", style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,

                                  ),),
                                  actions: [
                                    ElevatedButton(onPressed: () {
                                      Navigator.pop(context);
                                    }, child: Text("OK", style: TextStyle(
                                      color: iconColor,
                                      fontWeight: FontWeight.bold,

                                    ),))
                                  ],
                                  backgroundColor: iconColor,
                                ));
                                return;
                                break;

                              }
                          }
                        if(phoneNumberTextField.text.length < 10 || phoneNumberTextField.text.length > 10)
                          {
                            showDialog(context: context, builder: (context) => AlertDialog(
                              title: Text("Error", style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,

                              ),),
                              content: Text("Only 10 Digit numbers acceptable", style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,

                              ),),
                              actions: [
                                ElevatedButton(
                                    onPressed: () {
                                      phoneNumberTextField.text = "";
                                  Navigator.pop(context);
                                }, child: Text("OK", style: TextStyle(
                                  color: iconColor,
                                  fontWeight: FontWeight.bold,

                                ),))
                              ],
                              backgroundColor: iconColor,
                            ));
                            return;
                          }



                        for(int i = 0; i<emailTextField.text.length; i++)
                          {
                            String checkEmail = emailTextField.text[i];

                            if(checkEmail == '@')
                              {
                                containsAtSign = true;
                              }
                          }
                        if(containsAtSign == false)
                          {
                            showDialog(context: context, builder: (context) => AlertDialog(
                              title: Text("Error", style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,

                              ),),
                              content: Text("Enter valid email", style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,

                              ),),
                              actions: [
                                ElevatedButton(onPressed: () {
                                  Navigator.pop(context);
                                }, child: Text("OK", style: TextStyle(
                                  color: iconColor,
                                  fontWeight: FontWeight.bold,

                                ),))
                              ],
                              backgroundColor: iconColor,
                            ));
                            return;
                          }

                        storeValue();
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>Home("", "", "", "", "")
                        ));

                    },
                      child: Text("Save Changes", style: TextStyle(
                      fontWeight: FontWeight.w900,
                    ),),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: iconColor,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),

                ],
              ),
            ),



          ],

        )
    );
  }

}
