import 'package:flutter/material.dart';





class GridScreen extends StatefulWidget {
  const GridScreen({Key? key}) : super(key: key);

  @override
  State<GridScreen> createState() => _GridScreenState();
}

class _GridScreenState extends State<GridScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LIST VIEW", style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: Container(
        child: allGridItem(),
      ),
    );
  }

  Widget allGridItem() {

    var _crossAxisSpacing = 1;
    var _screenWidth = MediaQuery.of(context).size.width;
    var _crossAxisCount = 3;
    var width = (_screenWidth - ((_crossAxisCount - 1) * _crossAxisSpacing)) /
        _crossAxisCount;
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
              crossAxisCount: _crossAxisCount,
              childAspectRatio: _aspectRatio,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              mainAxisExtent: 120),
        ));
  }

  Container gridItem(){
    return Container(
      alignment: Alignment.center,
      height: 150,
      width: 150,
      color: Colors.blueAccent.withOpacity(0.4),
      child: Text("Grid Item", style: TextStyle(color: Colors.black),),
    );
  }

}
