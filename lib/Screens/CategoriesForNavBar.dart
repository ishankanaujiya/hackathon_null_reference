import 'package:flutter/material.dart';
import 'package:hackathon_expense_tracker/HomePage.dart';
import 'package:hackathon_expense_tracker/Screens/DisplayCategoriesDetails.dart';
import 'package:shared_preferences/shared_preferences.dart';
class CategorieForBottomNavBar extends StatefulWidget {

  @override
  State<CategorieForBottomNavBar> createState() => _CategorieForBottomNavBarState();
}

class _CategorieForBottomNavBarState extends State<CategorieForBottomNavBar> {

  List<String> categories = [];
  List<String> amount = [];
  List<String> paymentMethod = [];
  List<String> date = [];
  List<String> remark = [];

  List<String> displayCategories = [];
  List<String> displayAmount = [];
  List<String> displayPaymentMethod = [];
  List<String> displayDate = [];
  List<String> displayRemark = [];


  static const KEYTOSTORECATEGORY = "storeCategory";
  static const KEYTOSTOREAMOUNT = "storeAmount";
  static const KEYTOSTOREPAYMENTMETHOD = "storePaymentMethod";
  static const KEYTOSTOREDATE = "storeMethod";
  static const KEYTOSTOREREMARK = "storeRemark";


  Color fontColor = Color(0xFF1C3A44);

  Color iconColor = Color(0xFF009CB2);

  void initState()
  {
    super.initState();
    getValue();
  }

  void getValue() async
  {
    final pref = await SharedPreferences.getInstance();

    // Load existing lists
    categories = pref.getStringList(KEYTOSTORECATEGORY) ?? [];
    amount = pref.getStringList(KEYTOSTOREAMOUNT) ?? [];
    paymentMethod = pref.getStringList(KEYTOSTOREPAYMENTMETHOD) ?? [];
    date = pref.getStringList(KEYTOSTOREDATE) ?? [];
    remark = pref.getStringList(KEYTOSTOREREMARK) ?? [];

    print(categories);

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
          //         builder: (context) => Home("", "", "", "")
          //       ));
          //     },
          //     icon: Icon(Icons.arrow_back_ios),
          // ),
          title: Text("Categories", style: TextStyle(
            fontWeight: FontWeight.bold,
          ),),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.fromLTRB(20, 25, 20, 0),
            padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
            width: double.infinity,
            // height: 500,
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
            // height: 200,


            child: Column(
              children: <Widget>[
                InkWell(
                  onTap: (){
                    print(categories.length);
                    displayCategories.clear();
                    displayAmount.clear();
                    displayPaymentMethod.clear();
                    displayDate.clear();
                    displayRemark.clear();
                    for(int i = 0; i<categories.length; i++)
                    {
                      print("Correct");
                      if(categories[i] == "Food")
                      {
                        print("Correct1");
                        displayCategories.add(categories[i]);
                        displayAmount.add(amount[i]);
                        displayPaymentMethod.add(paymentMethod[i]);
                        displayDate.add(date[i]);
                        displayRemark.add(remark[i]);
                        Navigator.pushReplacement(context,MaterialPageRoute(
                            builder: (context) => DisplayCategoryDetails("Food", displayAmount, displayPaymentMethod, displayDate, displayRemark)
                        ));
                      }
                      else
                      {
                        Navigator.pushReplacement(context,MaterialPageRoute(
                            builder: (context) => DisplayCategoryDetails("Food", displayAmount, displayPaymentMethod, displayDate, displayRemark)
                        ));
                      }
                    }
                    if(categories.isEmpty)
                    {
                      Navigator.pushReplacement(context,MaterialPageRoute(
                          builder: (context) => DisplayCategoryDetails("Food", displayAmount, displayPaymentMethod, displayDate, displayRemark)
                      ));
                    }
                    print(displayAmount);
                  },
                  child: Container(
                    width: double.infinity,
                    // height: 40,
                    // color: Colors.cyan,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          // color: Colors.white,
                          child: Row(
                            children: <Widget>[
                              CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.transparent,
                                backgroundImage: AssetImage("assets/food.png"),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text("Food", style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: fontColor,
                              ),),
                            ],
                          ),
                        ),
                        Container(
                          // width: 60,
                          //  height: 10,
                          // color: Colors.black,
                          child: Icon(Icons.arrow_forward_ios, size: 20,),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: 15,
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  width: double.infinity,
                  height: 1,
                  color: Colors.grey.withOpacity(0.2),
                ),
                SizedBox(
                  height: 20,
                ),

                InkWell(
                  onTap: (){
                    print(categories.length);
                    displayCategories.clear();
                    displayAmount.clear();
                    displayPaymentMethod.clear();
                    displayDate.clear();
                    displayRemark.clear();
                    for(int i = 0; i<categories.length; i++)
                    {
                      print("Correct");
                      if(categories[i] == "Transportation")
                      {
                        print("Correct1");
                        displayCategories.add(categories[i]);
                        displayAmount.add(amount[i]);
                        displayPaymentMethod.add(paymentMethod[i]);
                        displayDate.add(date[i]);
                        displayRemark.add(remark[i]);
                        Navigator.pushReplacement(context,MaterialPageRoute(
                            builder: (context) => DisplayCategoryDetails("Transportation", displayAmount, displayPaymentMethod, displayDate, displayRemark)
                        ));
                      }
                      else
                      {
                        Navigator.pushReplacement(context,MaterialPageRoute(
                            builder: (context) => DisplayCategoryDetails("Transportation", displayAmount, displayPaymentMethod, displayDate, displayRemark)
                        ));
                      }
                    }
                    if(categories.isEmpty)
                    {
                      Navigator.pushReplacement(context,MaterialPageRoute(
                          builder: (context) => DisplayCategoryDetails("Transportation", displayAmount, displayPaymentMethod, displayDate, displayRemark)
                      ));
                    }
                    print(displayAmount);
                  },
                  child: Container(
                    width: double.infinity,
                    // height: 40,
                    // color: Colors.cyan,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          // color: Colors.white,
                          child: Row(
                            children: <Widget>[
                              CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.transparent,
                                backgroundImage: AssetImage("assets/transportation.png"),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text("Transportation", style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: fontColor,
                              ),),
                            ],
                          ),
                        ),
                        Container(
                          // width: 60,
                          //  height: 10,
                          // color: Colors.black,
                          child: Icon(Icons.arrow_forward_ios, size: 20,),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: 15,
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  width: double.infinity,
                  height: 1,
                  color: Colors.grey.withOpacity(0.2),
                ),
                SizedBox(
                  height: 20,
                ),

                InkWell(
                  onTap: (){
                    print(categories.length);
                    displayCategories.clear();
                    displayAmount.clear();
                    displayPaymentMethod.clear();
                    displayDate.clear();
                    displayRemark.clear();
                    for(int i = 0; i<categories.length; i++)
                    {
                      if(categories[i] == "Shopping")
                      {
                        displayCategories.add(categories[i]);
                        displayAmount.add(amount[i]);
                        displayPaymentMethod.add(paymentMethod[i]);
                        displayDate.add(date[i]);
                        displayRemark.add(remark[i]);
                        Navigator.pushReplacement(context,MaterialPageRoute(
                            builder: (context) => DisplayCategoryDetails("Shopping", displayAmount, displayPaymentMethod, displayDate, displayRemark)
                        ));
                      }
                      else
                      {
                        Navigator.pushReplacement(context,MaterialPageRoute(
                            builder: (context) => DisplayCategoryDetails("Shopping", displayAmount, displayPaymentMethod, displayDate, displayRemark)
                        ));
                      }
                    }
                    if(categories.isEmpty)
                    {
                      Navigator.pushReplacement(context,MaterialPageRoute(
                          builder: (context) => DisplayCategoryDetails("Shopping", displayAmount, displayPaymentMethod, displayDate, displayRemark)
                      ));
                    }
                    print(displayAmount);
                  },
                  child: Container(
                    width: double.infinity,
                    // height: 40,
                    // color: Colors.cyan,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          // color: Colors.white,
                          child: Row(
                            children: <Widget>[
                              CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.transparent,
                                backgroundImage: AssetImage("assets/shopping.png"),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text("Shopping", style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: fontColor,
                              ),),
                            ],
                          ),
                        ),
                        Container(
                          // width: 60,
                          //  height: 10,
                          // color: Colors.black,
                          child: Icon(Icons.arrow_forward_ios, size: 20,),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: 15,
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  width: double.infinity,
                  height: 1,
                  color: Colors.grey.withOpacity(0.2),
                ),
                SizedBox(
                  height: 20,
                ),

                InkWell(
                  onTap: (){
                    print(categories.length);
                    displayCategories.clear();
                    displayAmount.clear();
                    displayPaymentMethod.clear();
                    displayDate.clear();
                    displayRemark.clear();
                    for(int i = 0; i<categories.length; i++)
                    {
                      if(categories[i] == "Fees")
                      {
                        displayCategories.add(categories[i]);
                        displayAmount.add(amount[i]);
                        displayPaymentMethod.add(paymentMethod[i]);
                        displayDate.add(date[i]);
                        displayRemark.add(remark[i]);
                        Navigator.pushReplacement(context,MaterialPageRoute(
                            builder: (context) => DisplayCategoryDetails("Fees", displayAmount, displayPaymentMethod, displayDate, displayRemark)
                        ));
                      }
                      else
                      {
                        Navigator.pushReplacement(context,MaterialPageRoute(
                            builder: (context) => DisplayCategoryDetails("Fees", displayAmount, displayPaymentMethod, displayDate, displayRemark)
                        ));
                      }
                    }
                    if(categories.isEmpty)
                    {
                      Navigator.pushReplacement(context,MaterialPageRoute(
                          builder: (context) => DisplayCategoryDetails("Fees", displayAmount, displayPaymentMethod, displayDate, displayRemark)
                      ));
                    }
                    print(displayAmount);
                  },
                  child: Container(
                    width: double.infinity,
                    // height: 40,
                    // color: Colors.cyan,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          // color: Colors.white,
                          child: Row(
                            children: <Widget>[
                              CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.transparent,
                                backgroundImage: AssetImage("assets/fees.png"),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text("Fees", style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: fontColor,
                              ),),
                            ],
                          ),
                        ),
                        Container(
                          // width: 60,
                          //  height: 10,
                          // color: Colors.black,
                          child: Icon(Icons.arrow_forward_ios, size: 20,),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: 15,
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  width: double.infinity,
                  height: 1,
                  color: Colors.grey.withOpacity(0.2),
                ),
                SizedBox(
                  height: 20,
                ),

                InkWell(
                  onTap: (){
                    print(categories.length);
                    displayCategories.clear();
                    displayAmount.clear();
                    displayPaymentMethod.clear();
                    displayDate.clear();
                    displayRemark.clear();
                    for(int i = 0; i<categories.length; i++)
                    {
                      if(categories[i] == "Health Care")
                      {
                        displayCategories.add(categories[i]);
                        displayAmount.add(amount[i]);
                        displayPaymentMethod.add(paymentMethod[i]);
                        displayDate.add(date[i]);
                        displayRemark.add(remark[i]);
                        Navigator.pushReplacement(context,MaterialPageRoute(
                            builder: (context) => DisplayCategoryDetails("Health Care", displayAmount, displayPaymentMethod, displayDate, displayRemark)
                        ));
                      }
                      else
                      {
                        Navigator.pushReplacement(context,MaterialPageRoute(
                            builder: (context) => DisplayCategoryDetails("Health Care", displayAmount, displayPaymentMethod, displayDate, displayRemark)
                        ));
                      }
                    }
                    if(categories.isEmpty)
                    {
                      Navigator.pushReplacement(context,MaterialPageRoute(
                          builder: (context) => DisplayCategoryDetails("Health Care", displayAmount, displayPaymentMethod, displayDate, displayRemark)
                      ));
                    }
                    print(displayAmount);
                  },
                  child: Container(
                    width: double.infinity,
                    // height: 40,
                    // color: Colors.cyan,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          // color: Colors.white,
                          child: Row(
                            children: <Widget>[
                              CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.transparent,
                                backgroundImage: AssetImage("assets/healthcare.png"),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text("Health Care", style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: fontColor,
                              ),),
                            ],
                          ),
                        ),
                        Container(
                          // width: 60,
                          //  height: 10,
                          // color: Colors.black,
                          child: Icon(Icons.arrow_forward_ios, size: 20,),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: 15,
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  width: double.infinity,
                  height: 1,
                  color: Colors.grey.withOpacity(0.2),
                ),
                SizedBox(
                  height: 20,
                ),

                InkWell(
                  onTap: (){
                    print(categories.length);
                    displayCategories.clear();
                    displayAmount.clear();
                    displayPaymentMethod.clear();
                    displayDate.clear();
                    displayRemark.clear();
                    for(int i = 0; i<categories.length; i++)
                    {
                      if(categories[i] == "Groceries")
                      {
                        displayCategories.add(categories[i]);
                        displayAmount.add(amount[i]);
                        displayPaymentMethod.add(paymentMethod[i]);
                        displayDate.add(date[i]);
                        displayRemark.add(remark[i]);
                        Navigator.pushReplacement(context,MaterialPageRoute(
                            builder: (context) => DisplayCategoryDetails("Groceries", displayAmount, displayPaymentMethod, displayDate, displayRemark)
                        ));
                      }
                      else
                      {
                        Navigator.pushReplacement(context,MaterialPageRoute(
                            builder: (context) => DisplayCategoryDetails("Groceries", displayAmount, displayPaymentMethod, displayDate, displayRemark)
                        ));
                      }
                    }
                    if(categories.isEmpty)
                    {
                      Navigator.pushReplacement(context,MaterialPageRoute(
                          builder: (context) => DisplayCategoryDetails("Groceries", displayAmount, displayPaymentMethod, displayDate, displayRemark)
                      ));
                    }
                    print(displayAmount);
                  },
                  child: Container(
                    width: double.infinity,
                    // height: 40,
                    // color: Colors.cyan,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          // color: Colors.white,
                          child: Row(
                            children: <Widget>[
                              CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.transparent,
                                backgroundImage: AssetImage("assets/groceries.png"),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text("Groceries", style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: fontColor,
                              ),),
                            ],
                          ),
                        ),
                        Container(
                          // width: 60,
                          //  height: 10,
                          // color: Colors.black,
                          child: Icon(Icons.arrow_forward_ios, size: 20,),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: 15,
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  width: double.infinity,
                  height: 1,
                  color: Colors.grey.withOpacity(0.2),
                ),
                SizedBox(
                  height: 20,
                ),

                InkWell(
                  onTap: (){
                    print(categories.length);
                    displayCategories.clear();
                    displayAmount.clear();
                    displayPaymentMethod.clear();
                    displayDate.clear();
                    displayRemark.clear();
                    for(int i = 0; i<categories.length; i++)
                    {
                      if(categories[i] == "Income")
                      {
                        displayCategories.add(categories[i]);
                        displayAmount.add(amount[i]);
                        displayPaymentMethod.add(paymentMethod[i]);
                        displayDate.add(date[i]);
                        displayRemark.add(remark[i]);
                        Navigator.pushReplacement(context,MaterialPageRoute(
                            builder: (context) => DisplayCategoryDetails("Income", displayAmount, displayPaymentMethod, displayDate, displayRemark)
                        ));
                      }
                      else
                      {
                        Navigator.pushReplacement(context,MaterialPageRoute(
                            builder: (context) => DisplayCategoryDetails("Income", displayAmount, displayPaymentMethod, displayDate, displayRemark)
                        ));
                      }
                    }
                    if(categories.isEmpty)
                    {
                      Navigator.pushReplacement(context,MaterialPageRoute(
                          builder: (context) => DisplayCategoryDetails("Income", displayAmount, displayPaymentMethod, displayDate, displayRemark)
                      ));
                    }
                    print(displayAmount);
                  },
                  child: Container(
                    width: double.infinity,
                    // height: 40,
                    // color: Colors.cyan,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          // color: Colors.white,
                          child: Row(
                            children: <Widget>[
                              CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.transparent,
                                backgroundImage: AssetImage("assets/income.png"),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text("Income", style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: fontColor,
                              ),),
                            ],
                          ),
                        ),
                        Container(
                          // width: 60,
                          //  height: 10,
                          // color: Colors.black,
                          child: Icon(Icons.arrow_forward_ios, size: 20,),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: 15,
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  width: double.infinity,
                  height: 1,
                  color: Colors.grey.withOpacity(0.2),
                ),
                SizedBox(
                  height: 20,
                ),

                InkWell(
                  onTap: (){
                    print(categories.length);
                    displayCategories.clear();
                    displayAmount.clear();
                    displayPaymentMethod.clear();
                    displayDate.clear();
                    displayRemark.clear();
                    for(int i = 0; i<categories.length; i++)
                    {
                      if(categories[i] == "Others")
                      {
                        displayCategories.add(categories[i]);
                        displayAmount.add(amount[i]);
                        displayPaymentMethod.add(paymentMethod[i]);
                        displayDate.add(date[i]);
                        displayRemark.add(remark[i]);
                        Navigator.pushReplacement(context,MaterialPageRoute(
                            builder: (context) => DisplayCategoryDetails("Others", displayAmount, displayPaymentMethod, displayDate, displayRemark)
                        ));
                      }
                      else
                      {
                        Navigator.pushReplacement(context,MaterialPageRoute(
                            builder: (context) => DisplayCategoryDetails("Others", displayAmount, displayPaymentMethod, displayDate, displayRemark)
                        ));
                      }
                    }
                    if(categories.isEmpty)
                    {
                      Navigator.pushReplacement(context,MaterialPageRoute(
                          builder: (context) => DisplayCategoryDetails("Others", displayAmount, displayPaymentMethod, displayDate, displayRemark)
                      ));
                    }
                    print(displayAmount);
                  },
                  child: Container(
                    width: double.infinity,
                    // height: 40,
                    // color: Colors.cyan,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          // color: Colors.white,
                          child: Row(
                            children: <Widget>[
                              CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.transparent,
                                backgroundImage: AssetImage("assets/others.png"),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text("Others", style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: fontColor,
                              ),),
                            ],
                          ),
                        ),
                        Container(
                          // width: 60,
                          //  height: 10,
                          // color: Colors.black,
                          child: Icon(Icons.arrow_forward_ios, size: 20,),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: 15,
                ),
                // Container(
                //   margin: EdgeInsets.only(left: 10, right: 10),
                //   width: double.infinity,
                //   height: 1,
                //   color: Colors.grey.withOpacity(0.2),
                // ),
                SizedBox(
                  height: 10,
                ),

              ],
            ),
          ),
        )
    );
  }
}
