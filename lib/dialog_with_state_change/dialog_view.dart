import 'package:flutter/material.dart';

import 'dialog.dart';



class DialogView extends StatefulWidget {
  const DialogView({super.key});

  @override
  State<DialogView> createState() => _DialogViewState();
}

class _DialogViewState extends State<DialogView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dialog With State Change"),
      ),
      body: Center(
        child: TextButton(
          onPressed: (){notificationSoundDialog(context);},
          child: Text("Show Dialog"),
        ),
      ),
    );
  }
}
