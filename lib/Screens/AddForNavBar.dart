import 'package:flutter/material.dart';
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

        ),
      ),
    );
  }
}
