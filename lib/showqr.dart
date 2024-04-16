import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:paynow/source.dart';
class showqr extends StatefulWidget {
  const showqr({super.key});

  @override
  State<showqr> createState() => _showqrState();
}

class _showqrState extends State<showqr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
           Column(
            children: [
              SizedBox(height: 80,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("asset/picM.jpg"),
                    backgroundColor: Colors.white,
                    radius: 70,
                  ),
                ],
              ),
              Text("Harish Ragaven....",style: TextStyle(color: Colors.black54,fontSize: 20),),
              Text("XxxX@okaxis01",style: TextStyle(color: Colors.black54,fontSize: 18),),
             SizedBox(height: 10,),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    image: DecorationImage(image:AssetImage("asset/qr.jpg")),
                      borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                width: 175,
                child: ElevatedButton(onPressed: (){}, child: Row(
                  children: [
                    Image.asset("lib/iconpro/share.png"),
                    SizedBox(width: 4,),
                    Text("share Qr code",style: TextStyle(color: Colors.blueGrey),)
                  ],
                ),),
              ),
            ],
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

                      Text("My QR",style: TextStyle(color: a,fontWeight: FontWeight.bold,fontSize: 24),),
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
