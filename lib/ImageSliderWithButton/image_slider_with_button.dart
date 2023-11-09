import 'package:flutter/material.dart';



class CustomImageSlider extends StatefulWidget {
  @override
  _CustomImageSliderState createState() => _CustomImageSliderState();
}

class _CustomImageSliderState extends State<CustomImageSlider> {
  List<String> images = [
    "https://images.pexels.com/photos/18510514/pexels-photo-18510514/free-photo-of-a-close-up-of-apples-on-a-tree.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/18684565/pexels-photo-18684565/free-photo-of-old-tenements-in-city.jpeg?auto=compress&cs=tinysrgb&w=1600&lazy=load",
    "https://images.pexels.com/photos/19050720/pexels-photo-19050720/free-photo-of-forest.jpeg?auto=compress&cs=tinysrgb&w=1600&lazy=load",
    "https://images.pexels.com/photos/18957568/pexels-photo-18957568/free-photo-of-landscape.jpeg?auto=compress&cs=tinysrgb&w=1600&lazy=load",
    "https://images.pexels.com/photos/18963466/pexels-photo-18963466/free-photo-of-pots-and-bowls-on-a-table-at-a-rural-house-terrace.jpeg?auto=compress&cs=tinysrgb&w=1600&lazy=load",


    // Add more image paths as needed
  ];

  int currentIndex = 0;
  bool isNextButtonTapped = false;
  bool isPreviousButtonTapped = false;

  void _nextImage() {
    setState(() {
      isNextButtonTapped = true;
      currentIndex = (currentIndex + 1) % images.length;
    });
  }

  void _previousImage() {
    setState(() {
      isPreviousButtonTapped = true;
      currentIndex = (currentIndex - 1 + images.length) % images.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image List'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 250,
                child:  PageView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: images.length,
                  controller: PageController(initialPage: currentIndex),
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return isNextButtonTapped == false ? Image.network(images[index]) : Image.network(images[currentIndex]);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap:() {
                        if (currentIndex > 0) {
                          _previousImage();
                        }

                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.75),
                              spreadRadius: 5,
                              blurRadius: 10,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Icon(Icons.arrow_back_ios_new, size: 20, color: Colors.red,),
                      ),

                    ),

                    GestureDetector(
                      onTap:() {
                        if (currentIndex < images.length - 1) {
                          _nextImage();
                        }

                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.75),
                              spreadRadius: 5,
                              blurRadius: 10,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Icon(Icons.arrow_forward_ios, size: 20, color: Colors.red,),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )

        ],
      ),
    );
  }
}