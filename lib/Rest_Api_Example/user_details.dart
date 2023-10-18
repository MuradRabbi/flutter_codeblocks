import 'package:flutter/material.dart';
import 'package:fuctional_codeblocs/Rest_Api_Example/user_model.dart';


import 'api_services.dart';




class UserDetails extends StatefulWidget {
  final UsersModel usersModel;

  const UserDetails({Key? key, required this.usersModel}) : super(key: key);
  @override
  _UserDetailsState createState() => _UserDetailsState();

}

class _UserDetailsState extends State<UserDetails> {



  @override
  void initState() {
    super.initState();

  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Colors.black,
        ),
        centerTitle: true,
        elevation: 0.0,
        title: Text("${widget.usersModel.name} Details", textScaleFactor: 1.0, style: TextStyle(color: Colors.black , fontSize: 20, fontWeight: FontWeight.w600),),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.all(16),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),

            ],

          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Name :", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w800)),
              SizedBox(height: 5,),
              Text(widget.usersModel.name! , style: TextStyle(color: Colors.blueGrey[400], fontSize: 16, fontWeight: FontWeight.w600),),
              SizedBox(height: 5,),
              Text("User Name :", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w800)),
              SizedBox(height: 5,),
              Text(widget.usersModel.username! , style: TextStyle(color: Colors.blueGrey[400], fontSize: 16, fontWeight: FontWeight.w600),),
              SizedBox(height: 5,),
              Text("Email :", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w800)),
              SizedBox(height: 5,),
              Text(widget.usersModel.email! , style: TextStyle(color: Colors.blueGrey[400], fontSize: 16, fontWeight: FontWeight.w600),),
              SizedBox(height: 5,),
              Text("Address :", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w800)),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                padding: EdgeInsets.all(12),
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey.withOpacity(0.4)),
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,

                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),

                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("Street : ", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w800),),
                        Text(widget.usersModel.address!.street! , style: TextStyle(color: Colors.blueGrey[400], fontSize: 16, fontWeight: FontWeight.w600),),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Text("Suite : ", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w800),),
                        Text(widget.usersModel.address!.suite! , style: TextStyle(color: Colors.blueGrey[400], fontSize: 16, fontWeight: FontWeight.w600),),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Text("City : ", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w800),),
                        Text(widget.usersModel.address!.city! , style: TextStyle(color: Colors.blueGrey[400], fontSize: 16, fontWeight: FontWeight.w600),),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Text("Zip Code : ", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w800),),
                        Text(widget.usersModel.address!.zipcode! , style: TextStyle(color: Colors.blueGrey[400], fontSize: 16, fontWeight: FontWeight.w600),),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Geo : ", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w800),),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text("Latitude : ", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w800),),
                                  Text(widget.usersModel.address!.geo!.lat!, style: TextStyle(color: Colors.blueGrey[400], fontSize: 16, fontWeight: FontWeight.w600),),
                                ],
                              ),
                              SizedBox(height: 5,),
                              Row(
                                children: [
                                  Text("Longitude : ", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w800),),
                                  Text(widget.usersModel.address!.geo!.lng! , style: TextStyle(color: Colors.blueGrey[400], fontSize: 16, fontWeight: FontWeight.w600),),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5,),
              Text("Phone :", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w800)),
              SizedBox(height: 5,),
              Text(widget.usersModel.phone! , style: TextStyle(color: Colors.blueGrey[400], fontSize: 16, fontWeight: FontWeight.w600),),
              SizedBox(height: 5,),
              Text("Website :", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w800)),
              SizedBox(height: 5,),
              Text(widget.usersModel.website! , style: TextStyle(color: Colors.blueGrey[400], fontSize: 16, fontWeight: FontWeight.w600),),
              SizedBox(height: 5,),
              Text("Company :", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w800)),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                padding: EdgeInsets.all(12),
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey.withOpacity(0.4)),
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,

                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),

                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("Name : ", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w800),),
                        Text(widget.usersModel.company!.name! , style: TextStyle(color: Colors.blueGrey[400], fontSize: 16, fontWeight: FontWeight.w600),),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Catch Phrase : ", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w800),),
                        Container(
                          width: MediaQuery.of(context).size.width/2.4,
                          child: Text(widget.usersModel.company!.catchPhrase! , style: TextStyle(color: Colors.blueGrey[400], fontSize: 16, fontWeight: FontWeight.w600),),
                        )
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("BS : ", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w800),),
                        Container(
                            width: MediaQuery.of(context).size.width/1.8,
                            child: Text(widget.usersModel.company!.bs! , style: TextStyle(color: Colors.blueGrey[400], fontSize: 16, fontWeight: FontWeight.w600),)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
