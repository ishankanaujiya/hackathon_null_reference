import 'package:flutter/material.dart';
import 'package:hackathon_expense_tracker/Screens/CategoriesForNavBar.dart';
class DisplayCategoryDetails extends StatefulWidget {

  String categories;
  List<String> amount = [];
  List<String> paymentMethod = [];
  List<String> date = [];
  List<String> remark = [];




  DisplayCategoryDetails(this.categories, this.amount, this.paymentMethod, this.date, this.remark);

  @override
  State<DisplayCategoryDetails> createState() => _DisplayCategoryDetailsState();
}

class _DisplayCategoryDetailsState extends State<DisplayCategoryDetails> {
  bool contentSelector = false;

  Color fontColor = Color(0xFF1C3A44);

  Color amountColor = Color(0xFFF7352C);
  Color iconColor = Color(0xFF009CB2);

  var totalExpenses = 0;

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

  void initState()
  {
    super.initState();

    if(widget.amount.isNotEmpty)
      {
        contentSelector = true;
      }
    else
      {
        contentSelector = false;
      }
    getTotalExpense();

  }

  void getTotalExpense()
  {
    setState(() {
      List<int> stringToInt = widget.amount.map((e) =>int.parse(e)).toList();
      int sumExpenses = 0;
      totalExpenses = 0;
      for(int i = 0; i<stringToInt.length; i++)
      {
        sumExpenses += stringToInt[i];

      }
      totalExpenses = sumExpenses;

    });
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
                  builder: (context) => CategorieForBottomNavBar()
              ));
            },
            icon: Icon(Icons.arrow_back_ios, color: Colors.white,),
          ),
        ),
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.pushReplacement(context, MaterialPageRoute(
        //         builder: (context) => CategorieForBottomNavBar()
        //     ));
        //   },
        //   icon: Icon(Icons.arrow_back_ios),
        // ),
        title: Text("${widget.categories} Expenses", style: TextStyle(
          fontWeight: FontWeight.bold,
          color: fontColor,
        ),),
        centerTitle: true,
      ),
      body: contentSelector? Container(
        width: double.infinity,
        // height: 600,
        margin: EdgeInsets.fromLTRB(20, 25, 20, 60),
        // padding: EdgeInsets.only(left: 0.0, right: 20.0, top: 20.0),
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
        // color: Colors.cyan,
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 0.0),
          child: ListView.separated(
            itemCount: widget.amount.length + 1, // +1 for total row
            itemBuilder: (context, index) {
              int reverseIndex = widget.amount.length - 1 - index;
              if (index == widget.amount.length) {
                // Last item - show total
                return Padding(
                  padding: const EdgeInsets.only(right: 20.0, left: 20.0, top: 40, bottom: 10),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total: ", style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          color: widget.categories == "Income" ? Colors.green : amountColor,
                          ),
                        ),
                        Text("RS $totalExpenses", style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: widget.categories == "Income" ? Colors.green : amountColor,
                        ),),
                      ],
                    ),
                  ),
                );
              }

              // Regular list item
              return ListTile(
                leading: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage(
                    picturesforCategories[widget.categories] ?? "assets/food.png",
                  ),
                ),
                title: Text(
                  widget.remark[reverseIndex],
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: fontColor,
                  ),
                ),
                subtitle: Text(
                  "${widget.date[reverseIndex]},    ${widget.paymentMethod[reverseIndex]}",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: fontColor,
                  ),
                ),
                trailing: Text(
                  "Rs ${widget.amount[reverseIndex]}",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                      color: widget.categories == "Income" ? Colors.green : amountColor,
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              // No divider after last item (before total)
              if (index == widget.amount.length - 1) return SizedBox.shrink();
              return Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Divider(
                  height: 40,
                  color: Colors.black12,
                ),
              );
            },
          ),
        ),

      )
          : Container(
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
          child: Center(child: Text("No any Transaction for ${widget.categories}", style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: fontColor,
          ),))),
      
    );
  }
}
