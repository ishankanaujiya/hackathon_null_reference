import 'package:flutter/material.dart';
import 'package:hackathon_expense_tracker/HomePage.dart';
import 'package:intl/intl.dart';
class AddForBottomNavBar extends StatefulWidget {

  @override
  State<AddForBottomNavBar> createState() => _AddForBottomNavBarState();
}

class _AddForBottomNavBarState extends State<AddForBottomNavBar> {

  var dateForExpenseTextField = TextEditingController();

  var amountForExpenseTextField = TextEditingController();

  var initialDateForExpenseTextField = TextEditingController();

  var remarkForExpenseTextField = TextEditingController();


  String selectedValueForCategory = "Food";
  List<String> catagoriesForExpense = [

    "Food",
    "Transportation",
    "Shopping",
    "Health Care",
    "Fees",
    "Groceries",
    "Others",
  ];

  String selectedValueForPaymentMethods = "Cash";
  List<String> paymentMethodForExpense = [

    "Cash",
    "Online",
    "Cheque",
  ];


  String categoriesSelected = "";
  String amountSelected = "";
  String paymentMethodSelected = "" ;
  String dateSelected  = "";
  String remark  = "";

  Color fontColor = Color(0xFF1C3A44);

  DateTime date = DateTime.now();

  Color iconColor = Color(0xFF009CB2);

  // Color fontColor = Color(0xFF1C3A44);


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

  void initState()
  {
    super.initState();

    dateForExpenseTextField.text= DateFormat('yMMMMd').format(date).toString();
    print("The Date is : $dateForExpenseTextField");
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
          title: Text("Add Expenses", style: TextStyle(
            fontWeight: FontWeight.bold,
          ),),
          centerTitle: true,
        ),
        body: Container(
          margin: EdgeInsets.fromLTRB(20, 50, 20, 0),
          padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
          width: double.infinity,
          height: 590,

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                blurRadius: 20,
                spreadRadius: 1,
                offset: Offset(0, 10),



              ),
            ],
            // border: Border.all(
            //   color: Colors.grey.withOpacity(0.2),
            //   width: 2,
            // ),
          ),
          // height: 400,
          // color: Colors.cyan,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Category", style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: iconColor,
                    ),),

                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10.0, right: 6.0, top: 7.0, bottom: 7.0),
                      decoration: BoxDecoration(
                        color: iconColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),

                      ),

                      child: DropdownButtonHideUnderline(

                        child: DropdownButton(
                          value: selectedValueForCategory,
                          isExpanded: true,
                          iconSize: 25,
                          iconEnabledColor: Colors.black,
                          iconDisabledColor: Colors.black,
                          dropdownColor: Colors.white,
                          items: catagoriesForExpense.map((String value){
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value, style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: fontColor,
                              ),),
                            );
                          }).toList(),

                          onChanged: (String ? newValue) {
                            setState(() {
                              if(newValue != null)
                              {
                                selectedValueForCategory = newValue;
                                // print(selectedValueForCategory);
                              }
                            });

                          },
                        ),
                      ),
                    ),
                  ],
                ),
                // SizedBox(
                //   height: 5,
                // ),
                //
                SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Amount", style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: iconColor,
                    ),),
                    Container(
                      padding: EdgeInsets.only(left: 0.0, right: 6.0),
                      decoration: BoxDecoration(
                        color: iconColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),

                      ),

                      child: TextField(
                        controller: amountForExpenseTextField,
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(

                          hintText: "Rs. 100.0",
                          hintStyle: TextStyle(
                            fontSize: 15,
                            color: iconColor.withOpacity(0.3),
                          ),

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
                  ],
                ),

                SizedBox(
                  height: 20,
                ),

                Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Payment Method", style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: iconColor,
                    ),),

                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10.0, right: 6.0, top: 7.0, bottom: 7.0),
                      decoration: BoxDecoration(
                        color: iconColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),

                      ),
                      child: DropdownButtonHideUnderline(

                        child: DropdownButton(
                          value: selectedValueForPaymentMethods,
                          isExpanded: true,
                          iconSize: 25,
                          iconEnabledColor: Colors.black,
                          iconDisabledColor: Colors.black,
                          dropdownColor: Colors.white,
                          items: paymentMethodForExpense.map((String value){
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value, style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: fontColor,
                              ),),
                            );
                          }).toList(),

                          onChanged: (String ? newValue) {
                            setState(() {
                              if(newValue != null)
                              {
                                selectedValueForPaymentMethods = newValue;
                              }
                            });

                          },
                        ),
                      ),
                    ),
                  ],
                ),
                // SizedBox(
                //   height: 6,
                // ),

                SizedBox(
                  height: 20,
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Remark", style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: iconColor,
                    ),),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 0.0, right: 6.0),
                      // margin: EdgeInsets.only(left: 0.0, right: 0.0, bottom: 0, top: 50.0),
                      decoration: BoxDecoration(
                        color: iconColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),

                      ),

                      child: TextField(
                        controller: remarkForExpenseTextField,
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          hintText: "Remark",
                          hintStyle: TextStyle(
                            fontSize: 15,
                            color: iconColor.withOpacity(0.3),
                          ),

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
                  ],
                ),

                SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Date", style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: iconColor,

                    ),),
                    Container(
                      padding: EdgeInsets.only(left: 10.0, right: 6.0, bottom: 7.0, top: 7.0),
                      decoration: BoxDecoration(
                        color: iconColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),

                      ),
                      child: TextField(
                        controller: dateForExpenseTextField,
                        readOnly: true,
                        onTap: datePicker,
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: fontColor,
                        ),
                        decoration: InputDecoration(
                          // hintText: "${DateFormat('yMMMMd').format(date)}",
                          icon: Icon(Icons.date_range, color: Colors.grey.shade600,),

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
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 200,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      categoriesSelected = selectedValueForCategory;
                      paymentMethodSelected = selectedValueForPaymentMethods;
                      amountSelected = amountForExpenseTextField.text ;
                      dateSelected = dateForExpenseTextField.text ;

                      if(amountSelected.isNotEmpty && remarkForExpenseTextField.text.isNotEmpty)
                      {
                        for(int i = 0; i<amountSelected.length; i++)
                        {
                          String checkNumber = amountSelected[i];

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
                        if(amountSelected.length > 10)
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
                                    amountForExpenseTextField.text = "";
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
                            builder: (context) => Home(categoriesSelected, amountSelected, paymentMethodSelected, dateSelected, remarkForExpenseTextField.text)
                        ));

                      }
                      else
                      {
                        showDialog(context: context, builder: (context) => AlertDialog(
                          title: Text("Required", style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,

                          ),),
                          content: Text("Enter all the fields", style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),),
                          backgroundColor: iconColor,
                          actions: [
                            // TextButton(
                            //   onPressed: () {
                            //     Navigator.pop(context);
                            //   },
                            //   child: Text("Ok", style: TextStyle(
                            //     color: Colors.white,
                            //   ),),
                            // ),

                            SizedBox(
                              width: 100,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("OK", style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: iconColor,
                                ),),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: iconColor,
                                  elevation: 0.0,
                                ),
                              ),
                            ),
                          ],
                        ));
                      }

                    },
                    child: Text("Save", style: TextStyle(
                      fontWeight: FontWeight.w900,
                    ),),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: iconColor,
                      foregroundColor: Colors.white,
                    ),
                  ),

                ),
                SizedBox(
                  height: 40,
                ),


              ],
            ),
          ),
        )
    );
  }
}