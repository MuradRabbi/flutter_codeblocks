
import 'package:flutter/material.dart';

class SliversDemo extends StatefulWidget {
  @override
  _SliversDemoState createState() => _SliversDemoState();
}

class _SliversDemoState extends State<SliversDemo> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final List<String> _name = ['tester'];

  var count = 0;

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name'),
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Name is required';
        }

        return null;
      },
      onSaved: (String? value) {
        setState(() {
          _name.add(value!);
        });
      },
    );
  }

  Widget _buildFixedList(Color color, String _text) {
    return Container(
      color: color,
      child: Center(
        child: Text(
          _text,
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
    );
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    _formKey.currentState!.save();
  }

  Future<List<Map>> _fetchReleaseNewsItemListData() async {
    List<Map> dataList = [];

    Map item = new Map();
    item['id'] = 1;
    item['name'] = "murad";

    dataList.add(item);

    item = new Map();
    item['id'] = 2;
    item['name'] = "partho";

    dataList.add(item);

    item = new Map();
    item['id'] = 3;
    item['name'] = "sami";

    dataList.add(item);

    item = new Map();
    item['id'] = 4;
    item['name'] = "kobir";

    dataList.add(item);

    item = new Map();
    item['id'] = 5;
    item['name'] = "zahid";

    dataList.add(item);
    count = dataList.length;
    return dataList;
  }


  @override
  Widget build(BuildContext context) {
    print(_name.toString());

    return Scaffold(
      backgroundColor: Color(0xFFEDF2F8),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text('Flutter Slivers Demo',style:
            TextStyle(fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white),),
            backgroundColor: Color(0xFFEDF2F8),
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                  "https://images.unsplash.com/photo-1603785608232-44c43cdc0d70?ixlib=rb-1.2.1&"
                      "ixid=MXwxMjA3fDB8MHx0b3BpYy1mZWVkfDY4fEo5eXJQYUhYUlFZfHxlbnwwfHx8&auto=format&"
                      "fit=crop&w=500&q=60",
                  fit: BoxFit.cover),
            ),
          ),
          SliverHeader(Colors.red, "SliverPersistentHeader 1"),
          SliverHeader(Colors.blue, "SliverPersistentHeader 2"),
          SliverHeader(Colors.purple, "SliverPersistentHeader 3"),
          SliverFixedExtentList(
            itemExtent: 70,
            delegate: SliverChildListDelegate([
              _buildFixedList(Colors.cyan, "Cyan"),
              _buildFixedList(Colors.green, "Green"),
              _buildFixedList(Colors.orange, "Orange"),
              _buildFixedList(Colors.amberAccent, "AmberAccent"),
              _buildFixedList(Colors.blueGrey, "Blue Grey"),
            ]),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                ListView.builder(
                  padding: EdgeInsets.all(0),
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: 15,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      alignment: Alignment.center,
                      height: 60,
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                      color: Colors.pinkAccent,
                      child: Text("List Item",style: TextStyle(color: Colors.white, fontSize: 20), ),
                    );
                  },
                )
              ]
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                margin: EdgeInsets.all(24),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Add Name', style: TextStyle(fontSize: 22)),
                      _buildName(),
                      SizedBox(height: 16),
                      InkWell(
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.deepPurpleAccent
                          ),
                          child: Text('Submit', style: TextStyle(color: Colors.white, fontSize: 20),),
                        ),
                        onTap: _submit,
                      ),
                    ],
                  ),
                ),
              )
            ]),
          ),

          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, mainAxisSpacing: 10, crossAxisSpacing: 10,
                childAspectRatio: 1.5
            ),
            delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
              return Container(
                padding: EdgeInsets.all(8),
                color: _randomColor(index),
                child: Center(
                  child: Text(
                    _name[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              );
            },
                childCount: _name.length
            ),
          ),
          sliverGrid()
        ],
      ),
    );
  }

  Widget SliverHeader(Color backgroundColor , String _title){
    return SliverPersistentHeader(
      pinned: true,
      floating: false,
      delegate: Delegate(backgroundColor, _title),
    );
  }


  // Widget allGridItem() {
  //   var _crossAxisSpacing = 1;
  //   var _screenWidth = MediaQuery.of(context).size.width;
  //   var _crossAxisCount = MediaQuery.of(context).size.width <= 500 ? 2 : 3;
  //   var width = (_screenWidth - ((_crossAxisCount - 1) * _crossAxisSpacing)) /
  //       _crossAxisCount;
  //   var cellHeight = 280;
  //   var _aspectRatio = width / cellHeight;
  //   return Container(
  //       padding: EdgeInsets.all(15),
  //       child: GridView.builder(
  //         physics: ScrollPhysics(),
  //         shrinkWrap: true,
  //         itemCount: 15,
  //         scrollDirection: Axis.vertical,
  //         itemBuilder: (BuildContext context, int index) {
  //           return Container(
  //             alignment: Alignment.center,
  //             height: 150,
  //             width: 150,
  //             color: Colors.teal,
  //              child: Text('Submit', style: TextStyle(color: Colors.white, fontSize: 20),)
  //           );
  //         },
  //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //             crossAxisCount: _crossAxisCount,
  //             childAspectRatio: _aspectRatio,
  //             crossAxisSpacing: 10,
  //             mainAxisSpacing: 10,
  //             mainAxisExtent: 280),
  //       ));
  // }


  // Widget allGridItem() {
  //   var _crossAxisSpacing = 1;
  //   var _screenWidth = MediaQuery.of(context).size.width;
  //   var _crossAxisCount = MediaQuery.of(context).size.width <= 500 ? 2 : 3;
  //   var width = (_screenWidth - ((_crossAxisCount - 1) * _crossAxisSpacing)) /
  //       _crossAxisCount;
  //   var cellHeight = 280;
  //   var _aspectRatio = width / cellHeight;
  //   return Container(
  //     // color: AppColors.BackgroundColor2,
  //     // padding: EdgeInsets.only(top:15),
  //     width: double.infinity,
  //     child: FutureBuilder(
  //         future: _fetchReleaseNewsItemListData(),
  //         builder: (context, AsyncSnapshot snapshot) {
  //           if (!snapshot.hasData) {
  //             return Container(color: Colors.red,);
  //           } else {
  //             return (snapshot.data.length > 0)
  //                 ? SliverGrid(
  //
  //                 delegate: SliverChildBuilderDelegate(
  //                   childCount: snapshot.data.length,
  //                     ( BuildContext context , int index){
  //                       return gridCell(snapshot.data[index], index);
  //                     }
  //                 ),
  //                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //                         crossAxisCount: _crossAxisCount,
  //                         mainAxisSpacing: 10,
  //                         crossAxisSpacing: 10,
  //                         childAspectRatio: _aspectRatio,
  //                         mainAxisExtent: 150
  //                     )
  //             )
  //                 : Container(color: Colors.red,);
  //           }
  //         }),
  //   );
  // }



  Widget allGridItem() {
    var _crossAxisSpacing = 1;
    var _screenWidth = MediaQuery.of(context).size.width;
    var _crossAxisCount = MediaQuery.of(context).size.width <= 500 ? 2 : 3;
    var width = (_screenWidth - ((_crossAxisCount - 1) * _crossAxisSpacing)) /
        _crossAxisCount;
    var cellHeight = 280;
    var _aspectRatio = width / cellHeight;
    return Container(
      // color: AppColors.BackgroundColor2,
      // padding: EdgeInsets.only(top:15),
      width: double.infinity,
      child: FutureBuilder(
          future: _fetchReleaseNewsItemListData(),
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Container(color: Colors.red,);
            } else {
              return (snapshot.data.length > 0)
                  ? SliverGrid(

                  delegate: SliverChildBuilderDelegate(
                      childCount: count,
                          ( BuildContext context , int index){
                        return gridCell(snapshot.data[index], index);

                      }
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: _crossAxisCount,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: _aspectRatio,
                      mainAxisExtent: 150
                  )
              )
                  : Container(color: Colors.red,);
            }
          }),
    );
  }





  SliverGrid  sliverGrid(){
    var _crossAxisSpacing = 1;
    var _screenWidth = MediaQuery.of(context).size.width;
    var _crossAxisCount = 3;
    var width = (_screenWidth - ((_crossAxisCount - 1) * _crossAxisSpacing)) /
        _crossAxisCount;
    var cellHeight = 150;
    var _aspectRatio = width / cellHeight;
    return SliverGrid(
        delegate: SliverChildBuilderDelegate(
          childCount: 5,
              (BuildContext context,int index)
          {
            return FutureBuilder(
                future: _fetchReleaseNewsItemListData(),
                builder: (context, snapshot)
            {

              if(snapshot.hasData){
                return gridCell(snapshot.data![index], index);


              }
              return Text("No more");

            });
          },
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: _crossAxisCount,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: _aspectRatio,
            mainAxisExtent: 150
        )
    );
  }

  Widget gridCell(Map data, int index){
    return Container(
      alignment: Alignment.center,
      height: 150,
      width: 150,
      color: Colors.orange,
      child: Text(data["name"], style: TextStyle(color: Colors.black, fontSize: 20),),
    );
  }
}

Color _randomColor(int index) {
  if (index % 4 == 0) {
    return Colors.blue;
  } else if (index % 4 == 1) {
    return Colors.orange;
  }else if(index % 4 == 2){
    return Colors.cyan;
  }
  return Colors.red;
}


class Delegate extends SliverPersistentHeaderDelegate {
  final Color backgroundColor;
  final String _title;

  Delegate(this.backgroundColor, this._title);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: backgroundColor,
      child: Center(
        child: Text(
          _title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 80;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}






