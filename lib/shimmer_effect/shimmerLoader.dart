import 'package:flutter/material.dart';

import 'item_skeleton.dart';







class ShimmerLoader extends StatefulWidget {
  const ShimmerLoader({Key? key}) : super(key: key);

  @override
  State<ShimmerLoader> createState() => _ShimmerLoaderState();
}

class _ShimmerLoaderState extends State<ShimmerLoader> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: allGridItem(),
    );
  }


  Widget allGridItem() {
    var _crossAxisSpacing = 1;
    var _screenWidth = MediaQuery.of(context).size.width;
    var _crossAxisCount = MediaQuery.of(context).size.width <= 500 ? 2 : 3;
    var width = (_screenWidth - ((_crossAxisCount - 1) * _crossAxisSpacing)) /
        _crossAxisCount;
    var cellHeight = 280;
    var _aspectRatio = width / cellHeight;
    return Container(
        padding: const EdgeInsets.all(15),
        child: GridView.builder(
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          itemCount: 6,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            return gridSkeletonItem();
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: _crossAxisCount,
              childAspectRatio: _aspectRatio,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              mainAxisExtent: 280),
        ));
  }

  Container gridSkeletonItem() {

    return Container(
      width: 210,
      height: 280,
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.15),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 15,),
          const Spacer(),
          ItemSkeleton.rectangular(
            height: 22,
            width: 220,
            borderRadius: 10,
          ),
          const SizedBox(
            height: 8,
          ),
          ItemSkeleton.rectangular(
            height: 16,
            width: 260,
            borderRadius: 10,
          ),
          const SizedBox(
            height: 3,
          ),
          ItemSkeleton.rectangular(
            height: 16,
            width: 260,
            borderRadius: 10,
          ),
          const SizedBox(
            height: 3,
          ),
          ItemSkeleton.rectangular(
            height: 16,
            width: 260,
            borderRadius: 10,
          ),
          const SizedBox(
            height: 12,
          ),
          ItemSkeleton.rectangular(
            height: 50,
            width: 130,
            borderRadius: 10,
          ),

          const SizedBox(
            height: 12,
          ),
          ItemSkeleton.rectangular(
            height: 20,
            width: 260,
            borderRadius: 10,
          ),
          const Spacer()
        ],
      ),
    );
  }
}



