import 'package:flutter/material.dart';
import 'package:hackathon_expense_tracker/HomePage.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
class DisplayExpense extends StatefulWidget {

  String selectedMonth;
  String yearSelected;

  DisplayExpense(this.selectedMonth, this.yearSelected);
  @override
  State<DisplayExpense> createState() => _DisplayExpenseState();
}

class _DisplayExpenseState extends State<DisplayExpense> {

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

  List<String> selectedDate = [];
  List<String> selectedYear = [];


  static const KEYTOSTORECATEGORY = "storeCategory";
  static const KEYTOSTOREAMOUNT = "storeAmount";
  static const KEYTOSTOREPAYMENTMETHOD = "storePaymentMethod";
  static const KEYTOSTOREDATE = "storeMethod";
  static const KEYTOSTOREREMARK = "storeRemark";

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


  Color fontColor = Color(0xFF1C3A44);

  Color iconColor = Color(0xFF009CB2);

  Color amountColor = Color(0xFFF7352C);

  var totalExpenses = 0;

  bool contentSelector = false;

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


    selectedDate.clear(); // clear previous values if any
    selectedYear.clear(); // clear previous values if any
    for (int i = 0; i < date.length; i++) {
      String d = date[i];
      if (d.isNotEmpty) {
        try {
          DateTime parsedDate = DateFormat('yMMMMd').parse(d);
          String monthOnly = DateFormat('MMMM').format(parsedDate);
          String yearOnly = DateFormat('y').format(parsedDate);
          selectedDate.add(monthOnly);
          selectedYear.add(yearOnly);
        } catch (e) {
          print("Error parsing date: $d");
        }
      }
    }


    print("Months Only: $selectedDate");
    print(categories);

    displayCategories.clear();
    displayAmount.clear();
    displayPaymentMethod.clear();
    displayDate.clear();
    displayRemark.clear();
    for(int i = 0; i<selectedDate.length; i++)
    {
      if(selectedDate[i] == widget.selectedMonth && selectedYear[i] == widget.yearSelected)
      {
        setState(() {
          displayCategories.add(categories[i]);
          displayAmount.add(amount[i]);
          displayPaymentMethod.add(paymentMethod[i]);
          displayDate.add(date[i]);
          displayRemark.add(remark[i]);
        });

      }
    }
    if(displayCategories.isNotEmpty)
    {
      contentSelector = true;
    }
    else
    {
      contentSelector = false;
    }



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
        title: Text("Filtered Transactions", style: TextStyle(
          fontWeight: FontWeight.bold,
        ),),


        centerTitle: true,
      ),
      body: contentSelector ?
      Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 20.0, bottom: 30.0),
        // color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.only(top: 6.0, left: 0.0),
          child: ListView.separated(itemBuilder: (context, index)
          {
            return ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage(picturesforCategories[displayCategories[index]] ?? "assets/food.png"),
              ),
              title: Text("${displayRemark[index]}", style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: fontColor,
              ),),
              subtitle: Text("${displayDate[index]},    ${displayPaymentMethod[index]}", style: TextStyle(
                fontWeight: FontWeight.w500,
                color: fontColor,
              ),),
              trailing: Text(
                "Rs ${displayAmount[index]}",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: displayCategories[index] == "Income" ? Colors.green : amountColor,
                ),
              ),

              // trailing: Text("${amount[index]}", style: TextStyle(
              //   fontSize: 20,
              //   fontWeight: FontWeight.w600,
              //
              //
              // ),),
            );
          },
            itemCount: displayCategories.length,
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

      ) :
      Container(
          margin: EdgeInsets.fromLTRB(20, 25, 20, 0),
          width: double.infinity,
          height: 100,
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
          child: Center(child: Text("No any Transaction", style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: fontColor,
          ),))),

    );
  }
}
