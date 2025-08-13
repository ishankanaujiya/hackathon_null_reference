import 'package:flutter/material.dart';
import 'package:hackathon_expense_tracker/Screens/AddForNavBar.dart';
import 'package:hackathon_expense_tracker/Screens/CategoriesForNavBar.dart';
import 'package:hackathon_expense_tracker/Screens/HomeForNavBar.dart';
import 'package:hackathon_expense_tracker/Screens/ProfileForNavBar.dart';
class Home extends StatefulWidget {

  String categoriesSelected ;
  String amountSelected;
  String paymentMethodSelected ;
  String dateSelected ;

  String remark;

  Home(this.categoriesSelected,this.amountSelected,this.paymentMethodSelected,this.dateSelected, this.remark);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // _HomeState(this.categoriesSelected,this.amountSelected,this.paymentMethodSelected,this.dateSelected);
  int indexForNavBarSwitch = 0;



  void initState()
  {
    super.initState();
    // widget.categoriesSelected = "";
    // widget.amountSelected = "";
    // widget.paymentMethodSelected = "" ;
    // widget.dateSelected = "" ;
  }



  void screenSwitcher(int index)
  {
    // indexForNavBarSwitch = index;
    setState(() {
      indexForNavBarSwitch = index;
      widget.categoriesSelected = "";
      widget.amountSelected = "";
      widget.paymentMethodSelected = "";
      widget.dateSelected = "";
      widget.remark = "";
    });
  }

  Color iconColor = Color(0xFF009CB2);

  Color fontColor = Color(0xFF1C3A44);
  @override
  Widget build(BuildContext context) {
    List<Widget> screensForBottomNavigationBar = [
      HomeForBottomNavBar(
        widget.categoriesSelected,
        widget.amountSelected,
        widget.paymentMethodSelected,
        widget.dateSelected,
        widget.remark,
      ),
      CategorieForBottomNavBar(),
      AddForBottomNavBar(),
      ProfileNavBar(),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: screensForBottomNavigationBar[indexForNavBarSwitch],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap: screenSwitcher,

        selectedItemColor: iconColor,
        unselectedItemColor: fontColor,
        currentIndex: indexForNavBarSwitch,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 30,),
            label: "Home",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper_outlined, size: 30,),
            label: "Categories",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.add, size: 35,),
            label: "Add",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 35,),
            label: "Profile",
          ),


        ],
      ),

    );

    return Scaffold(
      body: Center(child: ElevatedButton(onPressed: () {}, child: Text("Button"))),
    );
  }
}
