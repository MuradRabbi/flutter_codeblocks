import 'package:flutter/material.dart';
import 'package:fuctional_codeblocs/Rest_Api_Example/user_details.dart';
import 'package:fuctional_codeblocs/Rest_Api_Example/user_model.dart';
import 'api_services.dart';





class RestApiExampleView extends StatefulWidget {
  @override
  _RestApiExampleViewState createState() => _RestApiExampleViewState();
}

class _RestApiExampleViewState extends State<RestApiExampleView> {

  late List<UsersModel>? _userModel = [];
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _userModel = (await ApiService().getUsers())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
        title: Text("Users", textScaleFactor: 1.0, style: TextStyle(color: Colors.black , fontSize: 20, fontWeight: FontWeight.w600),),
      ),
      body: _userModel == null || _userModel!.isEmpty
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        itemCount: _userModel!.length,
        itemBuilder: (context, index) {
          return listItem(_userModel![index],index);
        },
      ),
    );
  }

  GestureDetector listItem(UsersModel usersModel,int index){
    return GestureDetector(
      onTap: (){
           Navigator.of(context).push(MaterialPageRoute(builder: (context)=>UserDetails(usersModel: usersModel,)));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1 , color: Color(0xffbdbdbd)),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                  border: Border.all(width: 1 , color: Colors.green),
                  borderRadius: BorderRadius.circular(3)
              ),
              child: Text(_userModel![index].id.toString() , style: TextStyle(color: Colors.red, fontSize: 16, fontWeight: FontWeight.w800),),
            ),
            SizedBox(width: 16,),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_userModel![index].name!, style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),),
                  Text(_userModel![index].email!, style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),),
                  Text(_userModel![index].website!, style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),)
                ],
              ),
            )
          ],
        ),

      ),

    );
  }
}
