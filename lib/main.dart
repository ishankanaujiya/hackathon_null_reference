import 'package:flutter/material.dart';
import 'package:hackathon_expense_tracker/HomePage.dart';
import 'package:hackathon_expense_tracker/NotificationGenerator.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().initNotification();



  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    // home: Home(categoriesSelected,amountSelected,paymentMethodSelected,dateSelected),
    home: Home(),
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
