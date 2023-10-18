import 'package:flutter/material.dart';

class ViewShowHide extends StatefulWidget {
  const ViewShowHide({super.key});

  @override
  State<ViewShowHide> createState() => _ViewShowHideState();
}

class _ViewShowHideState extends State<ViewShowHide> {
  bool _isVisible = false;
  bool _isVisibleReviewBox = false;
  bool _isVisibleContactAndPriceBox = false;

  TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View Show Hide"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 500), // Animation duration
              curve: Curves.easeInOut, // Easing curve
              height: _isVisible ? 300 : 150,
              color: Colors.white,
              child: allGridItem(),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _isVisible = !_isVisible;
                });
              },
              child: Container(
                color: Colors.blue,
                height: 30.0,
                alignment: Alignment.center,
                child: Text(
                  'Tap to Expand',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            // Product Full Specification
            fullSpecification(),

            writeAReview(),

            contactAndBestPrice(),
            SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }

  Widget allGridItem() {
    var _crossAxisSpacing = 1;
    var _screenWidth = MediaQuery.of(context).size.width;
    var _crossAxisCount = 3;
    var width = (_screenWidth - ((_crossAxisCount - 1) * _crossAxisSpacing)) / _crossAxisCount;
    var cellHeight = 120;
    var _aspectRatio = width / cellHeight;

    return Container(
        padding: EdgeInsets.all(15),
        child: GridView.builder(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          itemCount: 4,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            return gridItem();
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: _crossAxisCount, childAspectRatio: _aspectRatio, crossAxisSpacing: 10, mainAxisSpacing: 10, mainAxisExtent: 120),
        ));
  }

  Container gridItem() {
    return Container(
      alignment: Alignment.center,
      height: 150,
      width: 150,
      color: Colors.blueAccent.withOpacity(0.4),
      child: Text(
        "Grid Item",
        style: TextStyle(color: Colors.black),
      ),
    );
  }



  Widget fullSpecification() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text("Full Specification"),
        ),
        SizedBox(
          height: 15,
        ),
        allListItem(),
        SizedBox(
          height: 25,
        ),
      ],
    );
  }

  Widget allListItem() {
    return Container(
        child: ListView.builder(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          itemCount: 10,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            return listItem();
          },
        ));
  }

  Widget listItem() {
    return Row(
      children: [
        SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 2,
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.25),
                  border: Border.all(
                    width: 1,
                    color: Colors.green.withOpacity(0.35),
                  )),
              child: Text("Model")),
        ),
        Expanded(
          flex: 3,
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 50,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.green.withOpacity(0.35),
                  )),
              child: Text("GS-18CZ/CT")),
        ),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }

  Widget writeAReview() {
    return Card(
      elevation: 1.5,
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _isVisibleReviewBox = !_isVisibleReviewBox;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              color: Colors.white,
              height: 40.0,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Write a review',
                    style: TextStyle(color: Colors.black),
                  ),
                  _isVisibleReviewBox
                      ? Icon(
                          Icons.arrow_drop_up,
                          size: 24,
                        )
                      : Icon(
                          Icons.arrow_drop_down,
                          size: 24,
                        )
                ],
              ),
            ),
          ),
          AnimatedContainer(
            padding: EdgeInsets.symmetric(horizontal: 10),
            duration: Duration(milliseconds: 500), // Animation duration
            curve: Curves.easeInOut, // Easing curve
            height: _isVisibleReviewBox ? 250 : 0,
            color: Colors.white,
            child: Container(
              child: ListView(
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: _commentController,
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: 'Write your review...',
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green)),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      alignment: Alignment.center,
                      height: 35,
                      width: 90,
                      decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(5)),
                      child: Text("SUBMIT"),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget contactAndBestPrice(){
    return Card(
      elevation: 1.5,
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _isVisibleContactAndPriceBox = !_isVisibleContactAndPriceBox;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              color: Colors.white,
              height: 40.0,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Contact & Best Price',
                    style: TextStyle(color: Colors.black),
                  ),
                  _isVisibleContactAndPriceBox
                      ? Icon(
                    Icons.arrow_drop_up,
                    size: 24,
                  )
                      : Icon(
                    Icons.arrow_drop_down,
                    size: 24,
                  )
                ],
              ),
            ),
          ),
          AnimatedContainer(
            padding: EdgeInsets.symmetric(horizontal: 10),
            duration: Duration(milliseconds: 500), // Animation duration
            curve: Curves.easeInOut, // Easing curve
            height: _isVisibleContactAndPriceBox ? 180: 0,
            color: Colors.white,
            child: allContactAndBestPriceItem(),
          )
        ],
      ),
    );
  }

  Widget allContactAndBestPriceItem() {
    return Container(
        child: ListView.builder(

          physics: ScrollPhysics(),
          shrinkWrap: true,
          itemCount: 3,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            return contactAndBestPriceItem();
          },
        ));
  }

  Widget contactAndBestPriceItem(){
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height: 50,
              color: Colors.green.withOpacity(0.25),
            ),
          ),
          SizedBox(width: 5,),
          Expanded(
            flex: 2,
            child: Container(
              height: 50,
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Dhanmondi", style: TextStyle(fontSize: 10),),
                  SizedBox(height: 5,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Icon(Icons.star , color: Colors.yellow,size: 10,),
                      ) ,
                      SizedBox(width: 3,),
                      Container(
                        child: Icon(Icons.star , color: Colors.yellow,size: 10,),
                      ) ,
                      SizedBox(width: 3,),
                      Container(
                        child: Icon(Icons.star , color: Colors.yellow,size: 10,),
                      ) ,
                      SizedBox(width: 3,),
                      Container(
                        child: Icon(Icons.star , color: Colors.yellow,size: 10,),
                      ) ,
                      SizedBox(width: 3,),Container(
                        child: Icon(Icons.star , color: Colors.yellow,size: 10,),
                      ) ,
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(width: 5,),
          Expanded(
            flex: 3,
            child: Container(
              height: 50,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                      alignment: Alignment.center,
                      height: 20,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.blue
                      ),
                      child: Text("Contact Seller", style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),),
                    ),
                  ),
                  SizedBox(height: 5,),
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                      alignment: Alignment.center,
                      height: 20,
                      width: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.green
                      ),
                      child: Text("WhatsApp Msg", style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(width: 5,),
          Expanded(
            flex: 2,
            child: Container(
              height: 50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("৳ 68,800", style: TextStyle(color: Colors.red, fontSize: 14, fontWeight: FontWeight.bold),),
                  Row(
                    children: [
                      Container(
                        height: 24,
                        width: 16,
                        color: Colors.green.withOpacity(0.25),
                      ),
                      SizedBox(width: 5,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("10 years parts", style: TextStyle(fontSize: 8),),
                          Text("10 years service",style: TextStyle(fontSize: 8))
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
