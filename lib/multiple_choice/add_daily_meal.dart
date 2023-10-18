import 'package:flutter/material.dart';



class AddDailyMeal extends StatefulWidget {
  const AddDailyMeal({Key? key}) : super(key: key);

  @override
  State<AddDailyMeal> createState() => _AddDailyMealState();
}

class _AddDailyMealState extends State<AddDailyMeal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Daily Meal"),
      ),
      body: Column(  
        children: [
          SizedBox(height: 50,), 
          Container(
          height: 60,
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: Row(  
              children: [
                Expanded(child: Container(color: Colors.red,)),
                SizedBox(width: 10,),
                InkWell(
                  onTap: (){},
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Colors.blue
                    ),
                    child: Icon(Icons.add),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
