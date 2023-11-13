import 'package:flutter/material.dart';


double _sliderValue = 0.5;

Future notificationSoundDialog(BuildContext context){
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: EdgeInsets.all(0),
        content: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState){
            return Stack(
              children: [
                SizedBox(
                  height: 160,
                  child: Column(
                    children: [
                      SizedBox(height: 24,),
                      Text("Set notification sound", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600, fontStyle: FontStyle.normal),),
                      SizedBox(height: 20,),
                      Padding(
                        padding:EdgeInsets.symmetric(horizontal:20),
                        child: const Divider(height: 2.0 ,color: Colors.grey),
                      ),
                      SizedBox(height: 10,),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor:Colors.blueAccent,
                          inactiveTrackColor: Colors.grey,
                          trackShape: RoundedRectSliderTrackShape(),
                          trackHeight: 4.0,
                          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                          thumbColor:  Colors.blueAccent,
                          overlayColor:  Colors.blueAccent,
                          overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
                          tickMarkShape: RoundSliderTickMarkShape(),
                          activeTickMarkColor: Colors.blueAccent,
                          inactiveTickMarkColor:  Colors.blueAccent,
                          valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                          valueIndicatorColor: Colors.blueAccent,
                          valueIndicatorTextStyle: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        child: Slider(
                          label: _sliderValue.toString(),
                          value: _sliderValue,
                          onChanged: (double value) {
                            setState(() {
                              _sliderValue = value;
                            });
                          },
                          min: 0,
                          max: 100,
                          divisions:10,
                        ),
                      ),
                      SizedBox(height: 24,),
                    ],
                  ),
                ),
                Positioned(
                  top: -4,
                  right:-4,
                  child: IconButton(
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.highlight_remove, size: 24,color: Colors.blueAccent, )
                  ),
                )

              ],
            );
          } ,
        ),

      );
    },
  );
}