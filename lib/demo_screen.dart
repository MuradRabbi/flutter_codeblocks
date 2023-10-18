import 'package:flutter/material.dart';



class DemoScreen extends StatefulWidget {
  const DemoScreen({Key? key}) : super(key: key);

  @override
  State<DemoScreen> createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30)
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 15,),

                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        height: 45,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border.all(width: 2, color: Colors.red)
                        ),
                        child: TextField(),
                      ),

                      SizedBox(height: 15,),

                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        height: 45,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.red)
                        ),
                        child: TextField(),
                      ),

                      SizedBox(height: 15,),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        height: 45,
                        width: double.infinity,
                        color: Colors.red,
                      ),
                      SizedBox(height: 15,),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        height: 45,
                        width: double.infinity,
                        color: Colors.red,
                      )
                    ],
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
