import 'package:flutter/material.dart';
class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // _HomeState(this.categoriesSelected,this.amountSelected,this.paymentMethodSelected,this.dateSelected);
  Widget build(BuildContext context) {
    // return Scaffold(
    //   backgroundColor: Colors.white,
    //   body: screensForBottomNavigationBar[indexForNavBarSwitch],
    //   bottomNavigationBar: BottomNavigationBar(
    //     type: BottomNavigationBarType.fixed,
    //     backgroundColor: Colors.white,
    //     onTap: screenSwitcher,
    //
    //     selectedItemColor: iconColor,
    //     unselectedItemColor: fontColor,
    //     currentIndex: indexForNavBarSwitch,
    //     items: [
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.home, size: 30,),
    //         label: "Home",
    //       ),
    //
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.newspaper_outlined, size: 30,),
    //         label: "Categories",
    //       ),
    //
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.add, size: 35,),
    //         label: "Add",
    //       ),
    //
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.person, size: 35,),
    //         label: "Profile",
    //       ),
    //
    //
    //     ],
    //   ),
    //
    // );
    return Scaffold(
      body: Center(child: ElevatedButton(onPressed: () {}, child: Text("Button"))),
    );
  }
}
