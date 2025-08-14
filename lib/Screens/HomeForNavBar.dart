import 'package:flutter/material.dart';
import 'package:hackathon_expense_tracker/NotificationGenerator.dart';
import 'package:hackathon_expense_tracker/Screens/AddIncome.dart';
import 'package:hackathon_expense_tracker/Screens/DisplayCtegoriesDetailsForHome.dart';
import 'package:hackathon_expense_tracker/Screens/MonthSelection.dart';
import 'package:shared_preferences/shared_preferences.dart';
class HomeForBottomNavBar extends StatefulWidget {

  String categoriesSelected ;
  String amountSelected;
  String paymentMethodSelected ;
  String dateSelected ;

  String remarkSelected;

  HomeForBottomNavBar(this.categoriesSelected,this.amountSelected,this.paymentMethodSelected,this.dateSelected, this.remarkSelected);

  @override
  State<HomeForBottomNavBar> createState() => _HomeForBottomNavBarState(categoriesSelected,amountSelected,paymentMethodSelected,dateSelected, remarkSelected);
}

class _HomeForBottomNavBarState extends State<HomeForBottomNavBar> {
  var totalExpenses = 0;

  var totalBalance = 0;

  var totalIncome = 0;

  var totalBalanceColor;

  String profileName = "";

  static const KEYTOSTORECATEGORY = "storeCategory";
  static const KEYTOSTOREAMOUNT = "storeAmount";
  static const KEYTOSTOREPAYMENTMETHOD = "storePaymentMethod";
  static const KEYTOSTOREDATE = "storeMethod";
  static const KEYTOSTOREREMARK = "storeRemark";
  static const KEYFORNAME = "profileName";

  String categoriesSelected ;
  String amountSelected;
  String paymentMethodSelected ;
  String dateSelected ;
  String remarkSelected;

  Map<String, String> picturesforCategories = {
    "Food" : "assets/food.png",
    "Transportation" : "assets/transportation.png",
    "Shopping" : "assets/shopping.png",
    "Fees" : "assets/fees.png",
    "Health Care" : "assets/healthcare.png",
    "Groceries" : "assets/groceries.png",
    "Others" : "assets/others.png",
    "Income" : "assets/income.png",
  };


  List<String> picturesForScrollView = [
    "assets/food.png",
    "assets/transportation.png",
    "assets/shopping.png",
    "assets/fees.png",
    "assets/healthcare.png",
    "assets/groceries.png",
    "assets/others.png"
        "assets/income.png"
  ];

  List<String> titlesForScrollView = [
    "Food",
    "Transportation",
    "Shopping",
    "Fees",
    "Health Care",
    "Groceries",
    "Others"
  ];
  _HomeForBottomNavBarState(this.categoriesSelected,this.amountSelected,this.paymentMethodSelected,this.dateSelected, this.remarkSelected);

  List<String> categories = [];
  List<String> amount = [];
  List<String> paymentMethod = [];
  List<String> date = [];
  List<String> remark = [];


  List<String> deleteList = [];

  bool isLongPressed = false;

  int? longPressIndex;

  bool contentSelector = false;

  List<String> displayCategories = [];
  List<String> displayAmount = [];
  List<String> displayPaymentMethod = [];
  List<String> displayDate = [];
  List<String> displayRemark = [];

  Color iconColor = Color(0xFFD9F6F4);
  Color fontColor = Color(0xFF1C3A44);
  Color amountColor = Color(0xFFF7352C);
  Color iconColorForNavBar = Color(0xFF009CB2);
  Color incomeColor = Color(0xFF7EEE9C);

  void initState()
  {
    getValueAndStore();
    if(amount.isNotEmpty)
    {
      contentSelector = true;
    }
    else
    {
      contentSelector = false;
    }

  }

  void deleteExpenses(int index) async
  {
    print(categories[index]);
    print(amount[index]);
    // categories.removeAt(index);
    // amount.removeAt(index);
    // paymentMethod.removeAt(index);
    // date.removeAt(index);
    setState(() {
      categories.removeAt(index);
      amount.removeAt(index);
      paymentMethod.removeAt(index);
      date.removeAt(index);
      remark.removeAt(index);
      print(categories);

    });
    var pref = await SharedPreferences.getInstance();
    pref.setStringList(KEYTOSTORECATEGORY, categories);
    pref.setStringList(KEYTOSTOREAMOUNT, amount);
    pref.setStringList(KEYTOSTOREPAYMENTMETHOD, paymentMethod);
    pref.setStringList(KEYTOSTOREDATE, date);
    pref.setStringList(KEYTOSTOREREMARK, remark);

    setState(() {
      List<int> stringToInt = amount.map((e) =>int.parse(e)).toList();
      int sumExpenses = 0;
      totalExpenses = 0;
      for(int i = 0; i<stringToInt.length; i++)
      {
        if(categories[i] != "Income")
        {
          sumExpenses += stringToInt[i];
        }

      }
      totalExpenses = sumExpenses;
      totalExpenses = sumExpenses;
      totalIncome = 0;
      List<int> stringToIntIncome = amount.map((e) =>int.parse(e)).toList();
      int sumIncome = 0;
      for(int i = 0; i<categories.length; i++)
      {
        if(categories[i] == "Income")
        {
          sumIncome += stringToIntIncome[i];
        }
      }
      totalIncome = sumIncome;
      totalBalance = totalIncome - totalExpenses;
      if(totalBalance < 0)
      {
        totalBalanceColor = amountColor;
      }
      else if(totalBalance == 0)
      {
        totalBalanceColor = Color(0xFFFFFFFF);
      }
      else
      {
        totalBalanceColor = incomeColor;
      }
    });

    double percentSpent = 0;
    if (totalIncome > 0) {
      percentSpent = (totalExpenses / totalIncome) * 100;
    }

    // Reset notification flags based on current percentage spent
    if (percentSpent < 50) {
      await pref.setBool('notified50', false);
      await pref.setBool('notified76', false);
      await pref.setBool('notified100', false);
    } else if (percentSpent < 76) {
      await pref.setBool('notified76', false);
      await pref.setBool('notified100', false);
    } else if (percentSpent < 100) {
      await pref.setBool('notified100', false);
    }

  }

  void calculateTotalIncome()
  {
    setState(() {
      totalIncome = 0;
      List<int> stringToInt = amount.map((e) =>int.parse(e)).toList();
      int sumIncome = 0;
      for(int i = 0; i<categories.length; i++)
      {
        if(categories[i] == "Income")
        {
          sumIncome += stringToInt[i];
        }
      }
      totalIncome = sumIncome;
      if(totalBalance < 0)
      {
        totalBalanceColor = amountColor;
      }
      else
      {
        totalBalanceColor = incomeColor;
      }
    });

  }
  void getValueAndStore() async {
    final pref = await SharedPreferences.getInstance();

    bool notified50 = pref.getBool('notified50') ?? false;
    bool notified76 = pref.getBool('notified76') ?? false;
    bool notified100 = pref.getBool('notified100') ?? false;

    // Load existing lists
    List<String> loadedCategories = pref.getStringList(KEYTOSTORECATEGORY) ?? [];
    List<String> loadedAmount = pref.getStringList(KEYTOSTOREAMOUNT) ?? [];
    List<String> loadedPaymentMethod = pref.getStringList(KEYTOSTOREPAYMENTMETHOD) ?? [];
    List<String> loadedDate = pref.getStringList(KEYTOSTOREDATE) ?? [];
    List<String> loadedRemark = pref.getStringList(KEYTOSTOREREMARK) ?? [];

    String userName = pref.getString(KEYFORNAME) ?? "";

    // If new data is passed, add it
    if (categoriesSelected.isNotEmpty) {
      loadedCategories.add(categoriesSelected);
      loadedAmount.add(amountSelected);
      loadedPaymentMethod.add(paymentMethodSelected);
      loadedDate.add(dateSelected);
      loadedRemark.add(remarkSelected);

      // Save updated lists
      await pref.setStringList(KEYTOSTORECATEGORY, loadedCategories);
      await pref.setStringList(KEYTOSTOREAMOUNT, loadedAmount);
      await pref.setStringList(KEYTOSTOREPAYMENTMETHOD, loadedPaymentMethod);
      await pref.setStringList(KEYTOSTOREDATE, loadedDate);
      await pref.setStringList(KEYTOSTOREREMARK, loadedRemark);
    }

    // Set the state to reflect loaded data
    setState(() {
      categories = loadedCategories;
      amount = loadedAmount;
      paymentMethod = loadedPaymentMethod;
      date = loadedDate;
      remark = loadedRemark;
      List<int> stringToInt = amount.map((e) =>int.parse(e)).toList();
      print("The List is: $stringToInt");
      int sumExpenses = 0;
      totalExpenses = 0;
      for(int i = 0; i<stringToInt.length; i++)
      {
        if(categories[i] != "Income")
        {
          sumExpenses += stringToInt[i];
        }

      }
      profileName = userName;
      totalExpenses = sumExpenses;
      totalIncome = 0;
      List<int> stringToIntIncome = amount.map((e) =>int.parse(e)).toList();
      int sumIncome = 0;
      for(int i = 0; i<categories.length; i++)
      {
        if(categories[i] == "Income")
        {
          sumIncome += stringToIntIncome[i];
        }
      }
      totalIncome = sumIncome;
      totalBalance = totalIncome - totalExpenses;
      if(totalBalance < 0)
      {
        totalBalanceColor = amountColor;
      }
      else if(totalBalance == 0)
      {
        totalBalanceColor = Color(0xFFFFFFFF);
      }
      else
      {
        totalBalanceColor = incomeColor;
      }

      // if (totalIncome > 0) {
      //   double percentSpent = (totalExpenses / totalIncome) * 100;
      //
      //   Future<void> showAndSaveNotification(int id, String title, String body, String key) async {
      //     await NotificationService().showNotification(id: id, title: title, body: body);
      //     await pref.setBool(key, true);
      //   }
      //
      //   if (percentSpent >= 50 && percentSpent < 70  && !notified50) {
      //     showAndSaveNotification(
      //       1,
      //       "Budget Alert",
      //       "You have spent 50% of your income. Please control your expenses.",
      //       'notified50',
      //     );
      //   } else if (percentSpent >= 70 && percentSpent <= 90 && !notified76) {
      //     showAndSaveNotification(
      //       2,
      //       "Budget Alert",
      //       "You have spent 76% of your income. Be cautious!",
      //       'notified76',
      //     );
      //   } else if (percentSpent == 100 && !notified100) {
      //     showAndSaveNotification(
      //       3,
      //       "Budget Alert",
      //       "You have spent all your money",
      //       'notified100',
      //     );
      //   }
      //
      // }
    });

    if (totalIncome > 0) {
      double percentSpent = (totalExpenses / totalIncome) * 100;

      print("percentSpent: $percentSpent");
      print(
          "notified50: $notified50, notified76: $notified76, notified100: $notified100");

      Future<void> showAndSaveNotification(
          int id, String title, String body, String key) async {
        await NotificationService().showNotification(id: id, title: title, body: body);
        await pref.setBool(key, true);
      }

      if (percentSpent >= 50 && percentSpent < 70 && !notified50) {
        await showAndSaveNotification(
          1,
          "Budget Alert",
          "You have spent more than 50% of your income. Please control your expenses.",
          'notified50',
        );
      } else if (percentSpent >= 70 && percentSpent < 100 && !notified76) {
        await showAndSaveNotification(
          2,
          "Budget Alert",
          "You have spent more than 70% of your income. Be cautious!",
          'notified76',
        );
      } else if (percentSpent >= 100 && !notified100) {
        await showAndSaveNotification(
          3,
          "Budget Alert",
          "You have spent all your money. Stop Expense",
          'notified100',
        );
      }
    }
  }





  // void storeValue() async
  // {
  //   var pref = await SharedPreferences.getInstance();
  //   pref.setStringList(KEYTOSTORECATEGORY, categories);
  //   pref.setStringList(KEYTOSTOREAMOUNT, amount);
  //   pref.setStringList(KEYTOSTOREPAYMENTMETHOD, paymentMethod);
  //   pref.setStringList(KEYTOSTOREDATE, date);
  //
  //
  // }
  //
  // void getValue() async
  // {
  //   var pref = await SharedPreferences.getInstance();
  //
  //   setState(() {
  //     categories = pref.getStringList(KEYTOSTORECATEGORY) ?? [];
  //     amount = pref.getStringList(KEYTOSTOREAMOUNT) ?? [];
  //     paymentMethod = pref.getStringList(KEYTOSTOREPAYMENTMETHOD) ?? [];
  //     date = pref.getStringList(KEYTOSTOREDATE) ?? [];
  //
  //   });
  //
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   title: Padding(
      //     padding: const EdgeInsets.only(left: 8.0, top: 30.0),
      //     child: Text("Home", style: TextStyle(
      //       fontSize: 30,
      //       fontWeight: FontWeight.bold,
      //     ),),
      //   ),
      //   actions: [
      //    Padding(
      //      padding: const EdgeInsets.only(right: 20.0, top: 25.0),
      //      child: IconButton(
      //       onPressed: () {},
      //       icon: Icon(
      //         Icons.person,
      //         size: 30.0,
      //         color: fontColor,
      //       )),
      //    ),
      //
      //   ],
      // ),

      body:
      Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 30.0),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 280,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    right: 0,
                    left: 0,
                    top: 10,
                    child: Container(
                        padding: EdgeInsets.only(left: 8.0,),
                        width: 100,
                        height: 150,
                        decoration: BoxDecoration(
                          color: iconColorForNavBar.withOpacity(0.8),
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
                        ),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text("Welcome", style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),),
                            ),
                            SizedBox(
                              height: 4.0,
                            ),
                            Text("$profileName", style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),),
                          ],
                        )
                    ),
                  ),
                  Positioned(
                    right: 0,
                    left: 0,
                    top: 90,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                          padding: EdgeInsets.only(left: 20.0, top: 4.0, right: 20.0),
                          width: 330,
                          height: 180,
                          decoration: BoxDecoration(
                            color: iconColorForNavBar,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: iconColorForNavBar.withOpacity(0.5),
                                blurRadius: 20,
                                spreadRadius: 1,
                                offset: Offset(0, 10),

                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Total Balance", style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),),
                                  IconButton(
                                    onPressed: () {
                                      Navigator.pushReplacement(context, MaterialPageRoute(
                                          builder: (context) => AddUserIncome()
                                      ));
                                    },
                                    icon: Icon(Icons.add, size: 20, color: Colors.white,),
                                  ),
                                ],
                              ),
                              Text("Rs $totalBalance", style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: totalBalanceColor,
                              ),),
                              SizedBox(
                                height: 19,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            width: 25,
                                            height: 25,
                                            decoration: BoxDecoration(
                                              color: Colors.white.withOpacity(0.8),
                                              borderRadius: BorderRadius.circular(15),

                                            ),

                                            child: Icon(Icons.arrow_upward_sharp, size: 17, color: Colors.green,),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text("Income", style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white,
                                          ),),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 35.0, top: 6.0),
                                        child: Container(
                                          width: 75,
                                          child: Text("Rs $totalIncome", style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: incomeColor,
                                          ),
                                            overflow: TextOverflow.visible,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            width: 25,
                                            height: 25,
                                            decoration: BoxDecoration(
                                              color: Colors.white.withOpacity(0.8),
                                              borderRadius: BorderRadius.circular(15),

                                            ),

                                            child: Icon(Icons.arrow_downward_sharp, size: 17, color: Colors.red,),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text("Expense", style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white,
                                          ),),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 35.0, top: 6.0),
                                        child: Container(
                                          width: 75,

                                          child: Text("Rs $totalExpenses", style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red,
                                          ),
                                            overflow: TextOverflow.visible,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              // Text("Value1"),
                            ],
                          )

                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Text("Welcome", style: TextStyle(
            //     fontSize: 26,
            //     fontWeight: FontWeight.bold,
            //     color: fontColor,
            //   ),),
            // ),
            // Container(
            //   width: double.infinity,
            //   // color: Colors.cyan,
            //   padding: EdgeInsets.symmetric(vertical: 10),
            //   child: SizedBox(
            //     height: 125, // Slightly increased to avoid overflow
            //     child: ListView.builder(
            //       scrollDirection: Axis.horizontal,
            //       itemCount: picturesForScrollView.length,
            //       itemBuilder: (context, index) {
            //         return InkWell(
            //           onTap: () {
            //             print(index);
            //             showDetails(index);
            //           },
            //           child: Padding(
            //             padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
            //             child: Container(
            //               width: 110, // Equal fixed width
            //               margin: EdgeInsets.symmetric(horizontal: 8.0),
            //               decoration: BoxDecoration(
            //                 color: iconColor,
            //                 borderRadius: BorderRadius.circular(15),
            //                 boxShadow: [
            //                   BoxShadow(
            //                     color: Colors.black12,
            //                     blurRadius: 4,
            //                     offset: Offset(0, 2),
            //                   ),
            //                 ],
            //               ),
            //               padding: EdgeInsets.all(8.0),
            //               child: Column(
            //                 mainAxisAlignment: MainAxisAlignment.center,
            //                 children: <Widget>[
            //                   Container(
            //                     width: 50,
            //                     height: 50,
            //                     child: Image.asset(
            //                       picturesForScrollView[index],
            //                       fit: BoxFit.contain,
            //                     ),
            //                   ),
            //                   SizedBox(height: 8),
            //                   Text(
            //                     titlesForScrollView[index],
            //                     textAlign: TextAlign.center,
            //                     style: TextStyle(
            //                       fontSize: 13,
            //                       fontWeight: FontWeight.w700,
            //                       color: fontColor,
            //                     ),
            //                     maxLines: 2,
            //                     overflow: TextOverflow.ellipsis,
            //                   ),
            //                 ],
            //               ),
            //             ),
            //           ),
            //         );
            //       },
            //     ),
            //   ),
            // ),

            // SizedBox(
            //   height: 20.0,
            // ),
            // Container(
            //   padding: EdgeInsets.only(top: 10, bottom: 10),
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     borderRadius: BorderRadius.circular(15),
            //     boxShadow: [
            //       BoxShadow(
            //         color: Colors.grey.withOpacity(0.2),
            //         blurRadius: 20,
            //         spreadRadius: 1,
            //         offset: Offset(0, 10),
            //
            //
            //
            //       ),
            //     ],
            //     // border: Border.all(
            //     //   color: Colors.grey.withOpacity(0.2),
            //     //   width: 2,
            //     // ),
            //   ),
            //   child: Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: <Widget>[
            //         Text("Total Expense: ", style: TextStyle(
            //           fontSize: 20,
            //           fontWeight: FontWeight.w600,
            //           color: fontColor,
            //         ),),
            //         Text("Rs ${totalExpenses}", style: TextStyle(
            //           fontSize: 26,
            //           fontWeight: FontWeight.w600,
            //           color: Colors.green,
            //         ),),
            //       ],
            //     ),
            //   ),
            // ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 20.0, bottom: 6.0),
                width: double.infinity,
                padding: EdgeInsets.only(top: 15, bottom: 10),
                // decoration: BoxDecoration(
                //   color: Colors.white,
                //   borderRadius: BorderRadius.circular(10),
                //   boxShadow: [
                //     BoxShadow(
                //       color: Colors.grey.withOpacity(0.3),
                //       blurRadius: 20,
                //       spreadRadius: 1,
                //       offset: Offset(0, 10),
                //
                //
                //
                //     ),
                //   ],
                //   // border: Border.all(
                //   //   color: Colors.grey.withOpacity(0.2),
                //   //   width: 2,
                //   // ),
                // ),
                // color: Colors.cyan,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Transactions", style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w900,
                            color: fontColor,
                          ),),

                          IconButton(
                            onPressed: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>MonthlyExpenseSelection()
                              ));
                            },
                            icon: Icon(
                              Icons.filter_list_alt,
                              color: fontColor,
                            ),
                          ),
                        ],
                      ),
                      // Text("Transactions", style: TextStyle(
                      //   fontSize: 22,
                      //   fontWeight: FontWeight.w900,
                      //   color: fontColor,
                      // ),),

                      Expanded(
                        child: Container(
                          width: double.infinity,
                          // color: Colors.transparent,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 6.0, left: 0.0),
                            child: ListView.separated(itemBuilder: (context, index)
                            {
                              int reverseIndex = categories.length - 1 - index;
                              return ListTile(
                                onLongPress: () {
                                  // deleteExpenses(index);
                                  if(longPressIndex == reverseIndex)
                                  {
                                    longPressIndex = null;
                                  }
                                  else
                                  {
                                    longPressIndex = reverseIndex;
                                  }
                                  print(isLongPressed);
                                  setState(() {

                                  });
                                },
                                leading: CircleAvatar(
                                  radius: 25,
                                  backgroundColor: Colors.transparent,
                                  backgroundImage: AssetImage(picturesforCategories[categories[reverseIndex]] ?? "assets/food.png"),
                                ),
                                title: Text("${remark[reverseIndex]}", style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: fontColor,
                                ),),
                                subtitle: Text("${date[reverseIndex]},    ${paymentMethod[reverseIndex]}", style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: fontColor,
                                ),),
                                trailing: longPressIndex == reverseIndex ?
                                Row(
                                  // mainAxisAlignment: MainAxisAlignment.end,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text("Rs ${amount[reverseIndex]}", style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: categories[reverseIndex] == "Income" ? Colors.green : amountColor,
                                    ),),

                                    IconButton(
                                      onPressed: () {
                                        deleteExpenses(reverseIndex);
                                      },
                                      icon: Icon(Icons.delete, color: Colors.red.shade300),
                                    ),
                                  ],
                                ) :
                                Text("Rs ${amount[reverseIndex]}", style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: categories[reverseIndex] == "Income" ? Colors.green : amountColor,


                                ),),
                                // trailing: Text("${amount[index]}", style: TextStyle(
                                //   fontSize: 20,
                                //   fontWeight: FontWeight.w600,
                                //
                                //
                                // ),),
                              );
                            },
                              itemCount: categories.length,
                              separatorBuilder: (context,index)
                              {
                                return Padding(
                                  padding: const EdgeInsets.only(left: 20, right: 20),
                                  child: Divider(
                                    height: 40,
                                    color: Colors.black12,
                                  ),
                                );
                              },
                            ),
                          ),

                        ),
                      ),


                    ],
                  ),
                ),
              ),
            ),

            // Container(
            //   width: double.infinity,
            //   // color: Colors.cyan,
            //   padding: EdgeInsets.symmetric(vertical: 10),
            //   child: SizedBox(
            //     height: 125, // Slightly increased to avoid overflow
            //     child: ListView.builder(
            //       scrollDirection: Axis.horizontal,
            //       itemCount: picturesForScrollView.length,
            //       itemBuilder: (context, index) {
            //         return InkWell(
            //           onTap: () {
            //             print(index);
            //             showDetails(index);
            //           },
            //           child: Container(
            //             width: 100, // Equal fixed width
            //             margin: EdgeInsets.symmetric(horizontal: 8.0),
            //             decoration: BoxDecoration(
            //               color: iconColor,
            //               borderRadius: BorderRadius.circular(15),
            //               boxShadow: [
            //                 BoxShadow(
            //                   color: Colors.black12,
            //                   blurRadius: 4,
            //                   offset: Offset(0, 2),
            //                 ),
            //               ],
            //             ),
            //             padding: EdgeInsets.all(8.0),
            //             child: Column(
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               children: <Widget>[
            //                 Container(
            //                   width: 45,
            //                   height: 45,
            //                   child: Image.asset(
            //                     picturesForScrollView[index],
            //                     fit: BoxFit.contain,
            //                   ),
            //                 ),
            //                 SizedBox(height: 8),
            //                 Text(
            //                   titlesForScrollView[index],
            //                   textAlign: TextAlign.center,
            //                   style: TextStyle(
            //                     fontSize: 12,
            //                     fontWeight: FontWeight.w500,
            //                   ),
            //                   maxLines: 2,
            //                   overflow: TextOverflow.ellipsis,
            //                 ),
            //               ],
            //             ),
            //           ),
            //         );
            //       },
            //     ),
            //   ),
            // ),



          ],
        ),
      ),
      // body: Column(
      //   children: <Widget>[
      //     Padding(
      //       padding: const EdgeInsets.only(left: 25.0, top: 20.0),
      //
      //       child: Container(child: Row(
      //         mainAxisAlignment: MainAxisAlignment.start,
      //         children: [
      //           Text("Home", style: TextStyle(
      //             fontSize: 25,
      //             fontWeight: FontWeight.bold,
      //           ),),
      //         ],
      //       )),
      //     ),
      //     Container(
      //       margin: EdgeInsets.only(left: 0.0, top: 40.0),
      //
      //       width: 350,
      //       height: 200,
      //
      //       decoration: BoxDecoration(
      //         color: Colors.cyan,
      //         borderRadius: BorderRadius.circular(30),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }

  void showDetails(int index)
  {

    if(index == 0)
    {
      displayCategories.clear();
      displayAmount.clear();
      displayPaymentMethod.clear();
      displayDate.clear();
      for(int i = 0; i<categories.length; i++)
      {
        if(categories[i] == "Food")
        {
          displayCategories.add(categories[i]);
          displayAmount.add(amount[i]);
          displayPaymentMethod.add(paymentMethod[i]);
          displayDate.add(date[i]);
          Navigator.pushReplacement(context,MaterialPageRoute(
              builder: (context) =>  DisplayCategoryDetailsForHome("Food", displayAmount, displayPaymentMethod, displayDate)
          ));
        }
        else
        {
          Navigator.pushReplacement(context,MaterialPageRoute(
              builder: (context) =>  DisplayCategoryDetailsForHome("Food", displayAmount, displayPaymentMethod, displayDate)
          ));
        }
      }
      if(categories.isEmpty)
      {
        Navigator.pushReplacement(context,MaterialPageRoute(
            builder: (context) => DisplayCategoryDetailsForHome("Food", displayAmount, displayPaymentMethod, displayDate)
        ));
      }
    }
    else if(index == 1)
    {
      displayCategories.clear();
      displayAmount.clear();
      displayPaymentMethod.clear();
      displayDate.clear();
      for(int i = 0; i<categories.length; i++)
      {
        if(categories[i] == "Transportation")
        {
          displayCategories.add(categories[i]);
          displayAmount.add(amount[i]);
          displayPaymentMethod.add(paymentMethod[i]);
          displayDate.add(date[i]);
          Navigator.pushReplacement(context,MaterialPageRoute(
              builder: (context) =>  DisplayCategoryDetailsForHome("Transportation", displayAmount, displayPaymentMethod, displayDate)
          ));
        }
        else
        {
          Navigator.pushReplacement(context,MaterialPageRoute(
              builder: (context) =>  DisplayCategoryDetailsForHome("Transportation", displayAmount, displayPaymentMethod, displayDate)
          ));
        }
      }
      if(categories.isEmpty)
      {
        Navigator.pushReplacement(context,MaterialPageRoute(
            builder: (context) => DisplayCategoryDetailsForHome("Transportation", displayAmount, displayPaymentMethod, displayDate)
        ));
      }
    }
    else if(index == 2)
    {
      displayCategories.clear();
      displayAmount.clear();
      displayPaymentMethod.clear();
      displayDate.clear();
      for(int i = 0; i<categories.length; i++)
      {
        if(categories[i] == "Shopping")
        {
          displayCategories.add(categories[i]);
          displayAmount.add(amount[i]);
          displayPaymentMethod.add(paymentMethod[i]);
          displayDate.add(date[i]);
          Navigator.pushReplacement(context,MaterialPageRoute(
              builder: (context) =>  DisplayCategoryDetailsForHome("Shopping", displayAmount, displayPaymentMethod, displayDate)
          ));
        }
        else
        {
          Navigator.pushReplacement(context,MaterialPageRoute(
              builder: (context) =>  DisplayCategoryDetailsForHome("Shopping", displayAmount, displayPaymentMethod, displayDate)
          ));
        }
      }
      if(categories.isEmpty)
      {
        Navigator.pushReplacement(context,MaterialPageRoute(
            builder: (context) => DisplayCategoryDetailsForHome("Shopping", displayAmount, displayPaymentMethod, displayDate)
        ));
      }
    }
    else if(index == 3)
    {
      displayCategories.clear();
      displayAmount.clear();
      displayPaymentMethod.clear();
      displayDate.clear();
      for(int i = 0; i<categories.length; i++)
      {
        if(categories[i] == "Fees")
        {
          displayCategories.add(categories[i]);
          displayAmount.add(amount[i]);
          displayPaymentMethod.add(paymentMethod[i]);
          displayDate.add(date[i]);
          Navigator.pushReplacement(context,MaterialPageRoute(
              builder: (context) =>  DisplayCategoryDetailsForHome("Fees", displayAmount, displayPaymentMethod, displayDate)
          ));
        }
        else
        {
          Navigator.pushReplacement(context,MaterialPageRoute(
              builder: (context) =>  DisplayCategoryDetailsForHome("Fees", displayAmount, displayPaymentMethod, displayDate)
          ));
        }
      }
      if(categories.isEmpty)
      {
        Navigator.pushReplacement(context,MaterialPageRoute(
            builder: (context) => DisplayCategoryDetailsForHome("Fees", displayAmount, displayPaymentMethod, displayDate)
        ));
      }
    }
    else if(index == 4)
    {
      displayCategories.clear();
      displayAmount.clear();
      displayPaymentMethod.clear();
      displayDate.clear();
      for(int i = 0; i<categories.length; i++)
      {
        if(categories[i] == "Health Care")
        {
          displayCategories.add(categories[i]);
          displayAmount.add(amount[i]);
          displayPaymentMethod.add(paymentMethod[i]);
          displayDate.add(date[i]);
          Navigator.pushReplacement(context,MaterialPageRoute(
              builder: (context) =>  DisplayCategoryDetailsForHome("Health Care", displayAmount, displayPaymentMethod, displayDate)
          ));
        }
        else
        {
          Navigator.pushReplacement(context,MaterialPageRoute(
              builder: (context) =>  DisplayCategoryDetailsForHome("Health Care", displayAmount, displayPaymentMethod, displayDate)
          ));
        }
      }
      if(categories.isEmpty)
      {
        Navigator.pushReplacement(context,MaterialPageRoute(
            builder: (context) => DisplayCategoryDetailsForHome("Health Care", displayAmount, displayPaymentMethod, displayDate)
        ));
      }
    }
    else if(index == 5)
    {
      displayCategories.clear();
      displayAmount.clear();
      displayPaymentMethod.clear();
      displayDate.clear();
      for(int i = 0; i<categories.length; i++)
      {
        if(categories[i] == "Groceries")
        {
          displayCategories.add(categories[i]);
          displayAmount.add(amount[i]);
          displayPaymentMethod.add(paymentMethod[i]);
          displayDate.add(date[i]);
          Navigator.pushReplacement(context,MaterialPageRoute(
              builder: (context) =>  DisplayCategoryDetailsForHome("Groceries", displayAmount, displayPaymentMethod, displayDate)
          ));
        }
        else
        {
          Navigator.pushReplacement(context,MaterialPageRoute(
              builder: (context) =>  DisplayCategoryDetailsForHome("Groceries", displayAmount, displayPaymentMethod, displayDate)
          ));
        }
      }
      if(categories.isEmpty)
      {
        Navigator.pushReplacement(context,MaterialPageRoute(
            builder: (context) => DisplayCategoryDetailsForHome("Groceries", displayAmount, displayPaymentMethod, displayDate)
        ));
      }

    }
    else if(index == 6)
    {
      displayCategories.clear();
      displayAmount.clear();
      displayPaymentMethod.clear();
      displayDate.clear();
      for(int i = 0; i<categories.length; i++)
      {
        if(categories[i] == "Others")
        {
          displayCategories.add(categories[i]);
          displayAmount.add(amount[i]);
          displayPaymentMethod.add(paymentMethod[i]);
          displayDate.add(date[i]);
          Navigator.pushReplacement(context,MaterialPageRoute(
              builder: (context) =>  DisplayCategoryDetailsForHome("Others", displayAmount, displayPaymentMethod, displayDate)
          ));
        }
        else
        {
          Navigator.pushReplacement(context,MaterialPageRoute(
              builder: (context) =>  DisplayCategoryDetailsForHome("Others", displayAmount, displayPaymentMethod, displayDate)
          ));
        }
      }
      if(categories.isEmpty)
      {
        Navigator.pushReplacement(context,MaterialPageRoute(
            builder: (context) => DisplayCategoryDetailsForHome("Others", displayAmount, displayPaymentMethod, displayDate)
        ));
      }
    }
    else
    {
      print("No Navigator");
    }
  }
}


