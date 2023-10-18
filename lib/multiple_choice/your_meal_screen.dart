import 'package:flutter/material.dart';

import 'add_daily_meal.dart';




class YourMealScreen extends StatefulWidget {
  const YourMealScreen({Key? key}) : super(key: key);

  @override
  State<YourMealScreen> createState() => _YourMealScreenState();
}

class _YourMealScreenState extends State<YourMealScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Meal"),
        actions: [
          InkWell(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> AddDailyMeal()));
            },
            child: Container(
              margin: EdgeInsets.only(top: 12, bottom: 12),
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(  
                border: Border.all(width: 1, color: Colors.white),
                borderRadius: BorderRadius.circular(6)
              ),
              child: Text("ADD MEAL", style: TextStyle(fontWeight: FontWeight.bold),),
            ),
          ),
          SizedBox(width: 15,)
        ],
      ),
      body: Center(
        child: Text("No Meal Added", style: TextStyle(fontSize: 18),),
      ),
    );
  }
}
