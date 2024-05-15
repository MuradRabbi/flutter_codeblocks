import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomSlider extends StatefulWidget {
  @override
  _CustomSliderState createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {


  Future<List<Map>> _fetchReleaseNewsItemListData() async {
    List<Map> dataList = [];

    Map item = new Map();
    item['id'] = 1;
    item['imageLink'] = 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80';
    item['title'] = "Glutten Free Pizza";

    dataList.add(item);

    item = new Map();
    item['id'] = 2;
    item['imageLink'] = 'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80';
    item['title'] = "Cheese Pizza";

    dataList.add(item);

    item = new Map();
    item['id'] = 3;
    item['imageLink'] ='https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80';
    item['title'] = "Margarita Pizza";

    dataList.add(item);

    item = new Map();
    item['id'] = 4;
    item['imageLink'] = 'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80';;
    item['title'] = "Chicken Pizza";

    dataList.add(item);

    item = new Map();
    item['id'] = 5;
    item['imageLink'] = 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80';
    item['title'] = "Beef Pizza";

    dataList.add(item);

    return dataList;
  }



  Widget _emptyScreenPlaceholder() {
    return Container();
  }


  int _currentIndex = 0;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 460,
      child: FutureBuilder(
          future: _fetchReleaseNewsItemListData(),
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return _emptyScreenPlaceholder();
            } else {
              return (snapshot.data.length > 0)
                  ? ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  if(index == _currentIndex){
                    return listItem(snapshot.data[index], index) ;
                  } else {
                    return const SizedBox();
                  }
                },
              )
                  : _emptyScreenPlaceholder();
            }
          }),
    );
  }

  Widget listItem(Map data, int index){
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(left: 30 ,right: index == data.length-1 ? 30 : 0),
              height: 384,
              width: 369,
              child: Image.asset(
                data['imageLink'],
                fit: BoxFit.fill,
              ),
            ),

            SizedBox(height: 20,),
            Padding(
              padding:  EdgeInsets.only(left: 30.0),
              child: Text(
                data['title'],
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.w700),
              ),
            )
          ],
        ),
        Positioned(
          top: 192,
          left: 40,
          child:   GestureDetector(
            onTap: (){
              if(_currentIndex > 0){
                setState(() {
                  _currentIndex = (_currentIndex - 1);
                  if (_currentIndex < 0) {
                    _currentIndex = data.length - 1;
                  }
                });
              }
            },
            child: Container(
              padding: EdgeInsets.only(left: 4),
              height: 31,
              width: 31,
              decoration:  BoxDecoration(
                  color: Color(0xffFFE1CC),
                  borderRadius: BorderRadius.circular(31)
              ),
              child: Icon(Icons.arrow_back_ios, color: Color(0xff9C3F27), size: 16, ),
            ),
          ),
        ),
        Positioned(
          top: 192,
          right: 40,
          child:   GestureDetector(
            onTap: (){
              if(_currentIndex <= data.length){
                setState(() {
                  _currentIndex = (_currentIndex + 1);
                });
              }
            },
            child: Container(
              height: 31,
              width: 31,
              decoration:  BoxDecoration(
                  color: Color(0xffFFE1CC),
                  borderRadius: BorderRadius.circular(31)
              ),
              child: Icon(Icons.arrow_forward_ios, color: Color(0xff9C3F27), size: 16, ),
            ),
          ),
        ),
      ],
    );
  }
}
