import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';




class ItemSkeleton extends StatelessWidget {

  final double width;
  final double height;
  final double borderRadius;
  // final ShapeBorder shapeBorder;

  const ItemSkeleton.rectangular({
    this.width = double.infinity,
    required this.height,
    required this.borderRadius,
  });

  const ItemSkeleton.circular({
    this.width = double.infinity,
    required this.height,
    required this.borderRadius,

  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Color(0xffE6E6E6),
      highlightColor: Colors.white,
      direction: ShimmerDirection.ltr,
      period: Duration(seconds:3),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12),
          height: height,
          width: width,
          decoration: BoxDecoration(
              color: Color(0xffE6E6E6),
              borderRadius: BorderRadius.circular(borderRadius)
          )
      ),
    );
  }
}