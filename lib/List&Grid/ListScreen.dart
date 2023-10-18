import 'package:flutter/material.dart';






class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {

  Future<List<Map>> _fetchReleaseNewsItemListData() async {
    List<Map> dataList = [];

    Map item = new Map();
    item['id'] = 1;
    item['imageLink'] = "assets/images/list_image1.png";
    item['title'] = "ঢেঁড়স চাষ করতে কি কি প্রয়োজন হয়  জেনে নিন বিস্তারিত";
    item['time'] = "৩ দিন আগে";

    dataList.add(item);

    item = new Map();
    item['id'] = 2;
    item['imageLink'] = "assets/images/list_image1.png";
    item['title'] = "ঢেঁড়স চাষ করতে কি কি প্রয়োজন হয়  জেনে নিন বিস্তারিত";
    item['time'] = "৩ দিন আগে";

    dataList.add(item);

    item = new Map();
    item['id'] = 3;
    item['imageLink'] = "assets/images/list_image1.png";
    item['title'] = "ঢেঁড়স চাষ করতে কি কি প্রয়োজন হয়  জেনে নিন বিস্তারিত";
    item['time'] = "৩ দিন আগে";

    dataList.add(item);

    item = new Map();
    item['id'] = 4;
    item['imageLink'] = "assets/images/list_image1.png";
    item['title'] = "ঢেঁড়স চাষ করতে কি কি প্রয়োজন হয়  জেনে নিন বিস্তারিত";
    item['time'] = "৩ দিন আগে";

    dataList.add(item);

    item = new Map();
    item['id'] = 5;
    item['imageLink'] = "assets/images/list_image1.png";
    item['title'] = "ঢেঁড়স চাষ করতে কি কি প্রয়োজন হয়  জেনে নিন বিস্তারিত";
    item['time'] = "৩ দিন আগে";

    dataList.add(item);

    return dataList;
  }



  Widget _emptyScreenPlaceholder() {
    return Container();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LIST VIEW", style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: allCategoryItemList(),
      ),
    );
  }


  Widget allCategoryItemList() {
    return Container(
      // color: AppColors.BackgroundColor2,
      // padding: EdgeInsets.only(top:15),
      width: double.infinity,
      child: FutureBuilder(
          future: _fetchReleaseNewsItemListData(),
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return _emptyScreenPlaceholder();
            } else {
              return (snapshot.data.length > 0)
                  ? Container(
                  child: ListView.builder(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      return categoryItem(snapshot.data[index], index);
                    },
                  ))
                  : _emptyScreenPlaceholder();
            }
          }),
    );
  }





  Container categoryItem(Map data , int index){
    return Container(
      alignment: Alignment.center,
      height: 60,
      width: double.infinity,
      margin: EdgeInsets.only(top: 15, left: 15,right: 15),
      color: Colors.blueAccent.withOpacity(0.4),
      child: Text(data['title'], style: TextStyle(color: Colors.black),),
    );
  }

}
