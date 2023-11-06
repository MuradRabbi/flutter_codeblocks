import 'package:flutter/material.dart';

import 'mercury_widget.dart';


class FlutterMarqueeText extends StatefulWidget {
  const FlutterMarqueeText({Key? key}) : super(key: key);

  @override
  _FlutterMarqueeTextState createState() => _FlutterMarqueeTextState();
}

class _FlutterMarqueeTextState extends State<FlutterMarqueeText> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Marquee Text"),
      ),
      body: const Center(
        child: SizedBox(
          width: 200.0,
          child: MarqueeWidget(
            direction: Axis.horizontal,
            child: Text("This text is to long to be shown in just one line"),
          ),
        ),
      ),
    );
  }
}