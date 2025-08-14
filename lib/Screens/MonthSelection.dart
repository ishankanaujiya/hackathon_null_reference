
import 'package:flutter/material.dart';
import 'package:hackathon_expense_tracker/HomePage.dart';
import 'package:hackathon_expense_tracker/Screens/DisplayMonthlyExpense.dart';
class MonthlyExpenseSelection extends StatefulWidget {
  @override
  State<MonthlyExpenseSelection> createState() => _MonthlyExpenseSelectionState();
}

class _MonthlyExpenseSelectionState extends State<MonthlyExpenseSelection> {
  Color iconColor = Color(0xFF009CB2);

  Color fontColor = Color(0xFF1C3A44);

  var yearSelected = TextEditingController();

  String selectedValueForPaymentMethods = "January";

  List<String> paymentMethodForExpense = [

    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",

  ];

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
          title: Text("Filter Transactions", style: TextStyle(
            fontWeight: FontWeight.bold,
          ),),


          centerTitle: true,

        ),

        body: Padding(
          padding: const EdgeInsets.only(top: 60.0),
          child: Stack(
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
                        color: iconColor.withOpacity(0.1),
                        width: 3,
                      ),
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
                      color: Colors.white,
                      border: Border.all(
                        color: iconColor.withOpacity(0.1),
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
                        color: iconColor.withOpacity(0.1),
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
                        color: iconColor.withOpacity(0.1),
                        width: 3,
                      ),
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
                right: 0,
                left: 0,
                top: 0,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: 300,
                    padding: EdgeInsets.only(left: 10.0, right: 6.0, top: 7.0, bottom: 7.0),
                    margin: EdgeInsets.only(top: 100.0),
                    decoration: BoxDecoration(
                      color: iconColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),

                    ),

                    child: DropdownButtonHideUnderline(

                      child: DropdownButton(
                        value: selectedValueForPaymentMethods,
                        isExpanded: true,
                        iconSize: 25,
                        iconEnabledColor: iconColor,
                        iconDisabledColor: iconColor,
                        dropdownColor: Colors.white,
                        items: paymentMethodForExpense.map((String value){
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value, style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: iconColor,
                            ),),
                          );
                        }).toList(),

                        onChanged: (String ? newValue) {
                          setState(() {
                            if(newValue != null)
                            {
                              selectedValueForPaymentMethods = newValue;
                              // print(selectedValueForCategory);
                            }
                          });

                        },
                      ),
                    ),
                  ),
                ),
              ),


              Positioned(
                right: 0,
                left: 0,
                top: 150,
                child: Align(
                  alignment: Alignment.topCenter,
                  child:Container(
                    width: 300,
                    padding: EdgeInsets.only(left: 0.0, right: 6.0),
                    margin: EdgeInsets.only(left: 0.0, right: 0.0, bottom: 0, top: 50.0),
                    decoration: BoxDecoration(
                      color: iconColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),

                    ),

                    child: TextField(
                      controller: yearSelected,
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        hintText: "2004",
                        hintStyle: TextStyle(
                          fontSize: 15,
                          color: iconColor.withOpacity(0.3),
                        ),
                        label: Text("Year", style: TextStyle(
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
                ),
              ),


              Positioned(
                right: 0,
                left: 0,
                top: 300,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    width: 150,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {
                        if(yearSelected.text.isEmpty)
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

                              ),),),
                            ],
                            backgroundColor: iconColor,
                          ));
                          return;
                        }

                        for(int i = 0; i<yearSelected.text.length; i++)
                        {
                          String checkNumber = yearSelected.text[i];
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
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DisplayExpense(selectedValueForPaymentMethods, yearSelected.text)
                        ));
                      },
                      child: Text("Filter", style: TextStyle(
                        fontWeight: FontWeight.w700,

                      ),),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: iconColor,
                        foregroundColor: Colors.white,
                      ),
                    ),
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




            ],

          ),
        )
    );
  }
}
