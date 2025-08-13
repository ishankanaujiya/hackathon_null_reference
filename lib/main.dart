import 'package:flutter/material.dart';
import 'package:hackathon_expense_tracker/NotificationGenerator.dart';
import 'package:hackathon_expense_tracker/Screens/MainScreen.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().initNotification();

  String categoriesSelected = "";
  String amountSelected = "";
  String paymentMethodSelected = "" ;
  String dateSelected  = "";

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    // home: Home(categoriesSelected,amountSelected,paymentMethodSelected,dateSelected),
    home: PromoteApp(),
    // home: AddUserIncome(),
    theme: ThemeData(
      scaffoldBackgroundColor: Colors.white,
      // Optional other theme settings:
      primaryColor: Colors.white,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        // foregroundColor: Colors.black,
        elevation: 0,
      ),
    ),

  ));
}
