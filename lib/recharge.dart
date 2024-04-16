import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:paynow/source.dart';
class recharge extends StatefulWidget {
  const recharge({super.key});

  @override
  State<recharge> createState() => _rechargeState();
}

class _rechargeState extends State<recharge> {
  List img = [
    "asset/re1.jpg",
    "asset/re2.png",
    "asset/re3.png",
    "asset/re4.jpg",
    "asset/re5.jpeg",
    "asset/re6.jpg",
    "asset/re7.jpeg",
    "asset/re8.png",
    "asset/re9.png",
    "asset/off3.png",
    "asset/off4.jpeg",
    "asset/re8.png",
    "asset/re2.png",
    "asset/re1.jpg",

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
                Container(
                  height: 50,
                ),
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
                    Text("Recharge",style: TextStyle(color: a,fontWeight: FontWeight.bold,fontSize: 24),),
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
