import 'package:flutter/material.dart';
import 'package:hackathon_expense_tracker/HomePage.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AddUserIncome extends StatefulWidget {


  @override
  State<AddUserIncome> createState() => _AddUserIncomeState();
}

class _AddUserIncomeState extends State<AddUserIncome> {

  Color iconColor = Color(0xFF009CB2);

  Color fontColor = Color(0xFF1C3A44);

  static const KEYFORNAME = "profileName";
  static const KEYFORADDRESS = "profileAddress";
  static const KEYFOREMAIL = "profileEmail";
  static const KEYFORNUMBER = "profileNumber";

  String selectedValueForPaymentMethods = "Cash";
  List<String> paymentMethodForExpense = [

    "Cash",
    "Online",
    "Cheque",
  ];



  String name = "";
  String address = "";

  bool checkStroredValue = false;

  var dateForExpenseTextField = TextEditingController();
  var incomeSourceTextField = TextEditingController();
  var amountTextField = TextEditingController();

  DateTime date = DateTime.now();

  @override
  void initState() {
    super.initState();

    dateForExpenseTextField.text= DateFormat('yMMMMd').format(date).toString();
    print("The Date is : $dateForExpenseTextField");


  }
  void datePicker() async
  {
    DateTime? selectedDateForExpense = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),

        firstDate: DateTime(1999),
        lastDate: DateTime(2026)
    );

    if(selectedDateForExpense !=null)
    {
      setState(() {

        dateForExpenseTextField.text= DateFormat('yMMMMd').format(selectedDateForExpense).toString();

        print("The Date is $dateForExpenseTextField");
      });
    }


  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          leading: Container(
            width: 5,
            height: 10,
            decoration: BoxDecoration(
              color: iconColor,
              borderRadius: BorderRadius.only(topRight: Radius.circular(50.0), bottomRight: Radius.circular(50.0)),
            ),

            child: IconButton(
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) => Home("", "", "", "", "")
                ));
              },
              icon: Icon(Icons.arrow_back_ios, color: Colors.white,),
            ),
          ),
          // leading: IconButton(
          //     onPressed: () {
          //       Navigator.pushReplacement(context, MaterialPageRoute(
          //           builder: (context) => Home("", "", "", "")
          //       ));
          //     },
          //     icon: Icon(Icons.arrow_back_ios),
          // ),
          title: Text("Add Income", style: TextStyle(
            fontWeight: FontWeight.bold,
          ),),
          centerTitle: true,
        ),
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
                right: 0,
                left: 0,
                top: 0,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: 300,
                    // height: 400,
                    // color: Colors.cyan,
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(left: 0.0, right: 6.0),
                          margin: EdgeInsets.only(left: 0.0, right: 0.0, bottom: 0, top: 50.0),
                          decoration: BoxDecoration(
                            color: iconColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10),

                          ),

                          child: TextField(
                            controller: incomeSourceTextField,
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                              hintText: "Salary",
                              hintStyle: TextStyle(
                                fontSize: 15,
                                color: iconColor.withOpacity(0.3),
                              ),
                              label: Text("Income Source", style: TextStyle(
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
                            color: iconColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10),

                          ),

                          child: TextField(
                            controller: amountTextField,
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(

                              label: Text("Amount", style: TextStyle(
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
                          padding: EdgeInsets.only(left: 10.0, right: 6.0, bottom: 7.0, top: 7.0),
                          margin: EdgeInsets.only(left: 0.0, right: 0.0, bottom: 0, top: 50.0),
                          decoration: BoxDecoration(
                            color: iconColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10),

                          ),
                          child: TextField(
                            controller: dateForExpenseTextField,
                            readOnly: true,
                            onTap: datePicker,
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: iconColor,
                            ),
                            decoration: InputDecoration(
                              // hintText: "${DateFormat('yMMMMd').format(date)}",
                              icon: Icon(Icons.date_range, color: iconColor,),

                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  )
                              ),

                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  )
                              ),

                              disabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  )
                              ),
                            ),

                          ),
                        ),

                        SizedBox(
                          height: 50.0,
                        ),

                        Container(
                          padding: EdgeInsets.only(left: 10.0, right: 6.0, top: 7.0, bottom: 7.0),
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

                        SizedBox(
                          height: 50.0,
                        ),
                        SizedBox(
                          width: 150,
                          height: 45,
                          child: ElevatedButton(onPressed: () {
                            if(incomeSourceTextField.text.isEmpty || amountTextField.text.isEmpty)
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

                            for(int i = 0; i<amountTextField.text.length; i++)
                            {
                              String checkNumber = amountTextField.text[i];
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

                            if(amountTextField.text.length > 10)
                            {
                              showDialog(context: context, builder: (context) => AlertDialog(
                                title: Text("Error", style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,

                                ),),
                                content: Text("Only upto 10000000 expense is supported", style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,

                                ),),
                                actions: [
                                  ElevatedButton(
                                      onPressed: () {
                                        amountTextField.text = "";
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

                            Navigator.pushReplacement(context, MaterialPageRoute(
                                builder: (context) => Home("Income", amountTextField.text, selectedValueForPaymentMethods, dateForExpenseTextField.text, incomeSourceTextField.text)
                            ));
                            print(selectedValueForPaymentMethods);
                            print(incomeSourceTextField.text);
                            print(amountTextField.text);
                            print(dateForExpenseTextField.text);
                          },
                            child: Text("Save", style: TextStyle(
                              fontWeight: FontWeight.w900,
                            ),),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: iconColor,
                              foregroundColor: Colors.white,
                            ),),
                        ),

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
