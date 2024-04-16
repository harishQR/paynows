import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:paynow/source.dart';
class book extends StatefulWidget {
  const book({super.key});

  @override
  State<book> createState() => _bookState();
}

class _bookState extends State<book> {
  List img = [
    "asset/tr1.jpg",
    "asset/tr2.jpg",
    "asset/tr3.jpeg",
    "asset/tr4.jpeg",
    "asset/tr5.jpg",
    "asset/tr6.jpg",
    "asset/tr7.jpg",
    "asset/tr8.jpg",
    "asset/tr9.jpeg",
    "asset/ins10.jpeg",
    "asset/ins3.jpg",

  ] ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,

      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 50,),
                Padding(
                  padding: const EdgeInsets.only(left: 4,right: 4),
                  child: Container(
                    height: 650,
                    width: double.infinity,
                    child: MasonryGridView.builder(
                      gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemCount: img.length,
                      itemBuilder: (BuildContext context, int index) => Padding(
                        padding: const EdgeInsets.all(2),
                        child: InstaImageViewer(child: Image(image: AssetImage(img[index]))),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
          Positioned(
            top:0,
            right: 0,
            left: 0,
            child: Container(
              height: 80,
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                        onTap:(){
                          Get.back();
                        },
                        child: Icon(Icons.arrow_back,color: Colors.white,)),
                    SizedBox(width: 5,),

                    Text("bookings",style: TextStyle(color: a,fontWeight: FontWeight.bold,fontSize: 24),),
                    SizedBox(width: 20,),
                    Icon(Icons.more_vert,color: a,)
                  ],
                ),
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.grey, Colors.blueGrey],
                ),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),bottomRight: Radius.circular(25)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}