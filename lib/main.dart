import 'package:flutter/material.dart';
import 'package:fuctional_codeblocs/remember_me/loginScreen.dart';
import 'package:fuctional_codeblocs/shimmer_effect/shimmerLoader.dart';
import 'package:fuctional_codeblocs/sliver/sliver_demo.dart';

import 'StreamBuilder/listwithStreamBuilder.dart';
import 'View_Show_Hide/view_show_hide.dart';
import 'cart_screen/cart_screen.dart';
import 'delivery_track_timeline/timeline_component.dart';
import 'demo_screen.dart';
import 'multiple_choice/your_meal_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CartScreen(),
    );
  }
}

