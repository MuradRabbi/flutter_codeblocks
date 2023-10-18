import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';




enum AddPhotoOption {
  album,
  camera,
}


class SetProfileAvatar extends StatefulWidget {
  const SetProfileAvatar({Key? key}) : super(key: key);

  @override
  _SetProfileAvatarState createState() => _SetProfileAvatarState();
}

class _SetProfileAvatarState extends State<SetProfileAvatar> {


  File? _attachedImage;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Set Profile Avatar", style: TextStyle(color:Colors.black)),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 1.0,
      ),
      body: Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            ClipRRect( 
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 150,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.withOpacity(0.8)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 5,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: _buildProfileImageWidget()
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: InkWell(
                onTap: (){
                  _createUploadImageDialog();
                },
                child:  Container(
                  height: 35,
                  width:50,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8)
                  ),
                  child: Icon(Icons.add_a_photo_sharp, color: Colors.white,),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }


  void _createUploadImageDialog(){
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context){
          return Container(
            height: 200,
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: Column(
                    children: [
                      _buildUploadFloorPlanDialogOptionItem(
                          Icons.photo,
                          "From Album",
                          0xff000000,
                          AddPhotoOption.album
                      ),
                      SizedBox(height: 5,),
                      Container(
                        height: 1,
                        color: Colors.grey[400],
                      ),
                      SizedBox(height: 5,),
                      _buildUploadFloorPlanDialogOptionItem(
                          Icons.add_a_photo_sharp,
                          "From Camera",
                          0xffD000000,
                          AddPhotoOption.camera
                      ),
                      SizedBox(height: 15),
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 30),
                              alignment: Alignment.center,
                              height: 45,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Text(
                                "Cancel",
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.white,
                                ),
                              ))
                      ),
                      SizedBox(
                        height: 15,
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        }
    );
  }

  Widget _buildUploadFloorPlanDialogOptionItem(
      IconData icon, String optionText, int textColor, var type
      ){
    return InkWell(
      child: Container(
        alignment: Alignment.center,
        height: 47,
        child: Center(
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(width: 90),
                Container(
                    height: 25,
                    width: 25,
                    child: Icon(
                       icon,
                      color: Color(textColor),
                    )),
                SizedBox(width: 20),
                Container(
                    child: Text(
                      optionText,
                      style: TextStyle(
                          fontSize: 22,
                          color: Color(textColor),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
      onTap: () async{
        File? image;
        final ImagePicker _imagePicker = ImagePicker();
        if(type == AddPhotoOption.album){
          final XFile? xFile = await _imagePicker.pickImage(source: ImageSource.gallery);

          if(xFile == null){
            return;
          }

          image = File(xFile.path);
        }
        else if(type == AddPhotoOption.camera){
          final XFile? xFile = await _imagePicker.pickImage(source: ImageSource.camera);

          if(xFile == null){
            return;
          }

          image = File(xFile.path);
        }

        if (image != null){
          setState(() {
            _attachedImage = image;
          });
        }

        Navigator.pop(context);
      },
    );
  }

  Widget _buildProfileImageWidget(){
    var imageUrl = "" ;
    print("imageUrl : $imageUrl");
    if(imageUrl.isNotEmpty){
      return CachedNetworkImage(
        imageUrl: imageUrl,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5), topRight: Radius.circular(5)),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
        placeholder: (context, url) => Container(
            padding: EdgeInsets.all(5),
            child: Center(child: CupertinoActivityIndicator())),
        errorWidget: (context, url, error) => Icon(
          Icons.person,
          size: 50,
        ),
      );
    }

    if (_attachedImage != null) {
      return Image.file(
        _attachedImage!,
        fit: BoxFit.cover,
      );
    } else {
      return Icon(
        Icons.person,
          size: 100,
          color: Colors.grey.withOpacity(0.8),
      );
    }
  }
}
