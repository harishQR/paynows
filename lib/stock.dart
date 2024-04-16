import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:paynow/source.dart';
class stock extends StatefulWidget {
  const stock({super.key});

  @override
  State<stock> createState() => _stockState();
}

class _stockState extends State<stock> {
  List img = [
    "asset/off1.jpeg",
    "asset/off2.jpeg",
    "asset/off3.png",
    "asset/off4.jpeg",
    "asset/off5.jpeg",
    "asset/off6.jpeg",
    "asset/off7.jpeg",
    "asset/off8.jpeg",
    "asset/off9.jpeg",
    "asset/ins2.jpeg",
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

                    Text("stocks",style: TextStyle(color: a,fontWeight: FontWeight.bold,fontSize: 24),),
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
