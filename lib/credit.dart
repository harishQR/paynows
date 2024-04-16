import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:paynow/cibil.dart';
import 'package:paynow/creditcard.dart';

class credit extends StatefulWidget {
  const credit({super.key});

  @override
  State<credit> createState() => _creditState();
}

class _creditState extends State<credit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Card(
                      elevation: 5,
                      child: ListTile(
                        leading: Image.asset("lib/iconpro/crcardic.png",width: 50,height: 50,),
                        title: Text("Creditcard To UPI",style: TextStyle(fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis
                        ),),
                        trailing: GestureDetector(
                            onTap: (){
                              Get.to(creditcard());
                            },
                            child: Image.asset("lib/iconpro/nxtpgic.png",width: 34,height: 34,)),
                      ),
                    ),
                    SizedBox(height: 30,),
                    Text("Top Creditproviders",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    SizedBox(height: 30,),
                    Row(
                      children: [
                        Text("Personal Loan",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16))
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 60,
                          height:60,
                          decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(20),
                            color: Colors.blue,
                            image: DecorationImage(image: AssetImage("asset/bank1.png"),fit: BoxFit.cover),
                          ),
                        ),
                        Container(
                          width: 60,
                          height:60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blue,
                            image: DecorationImage(image: AssetImage("asset/bank2.jpeg"),fit: BoxFit.cover),

                          ),
                        ),
                        Container(
                          width: 60,
                          height:60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blue,
                            image: DecorationImage(image: AssetImage("asset/bank3.jpeg"),fit: BoxFit.cover),

                          ),
                        ),
                        Container(
                          width: 60,
                          height:60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blue,
                            image: DecorationImage(image: AssetImage("asset/bank4.png",),fit: BoxFit.cover),

                          ),
                        ),
          
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Text("Home Loan",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16))
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 60,
                          height:60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blue,
                            image: DecorationImage(image: AssetImage("asset/bank5.jpeg",),fit: BoxFit.cover),

                          ),
                        ),
                        Container(
                          width: 60,
                          height:60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blue,
                            image: DecorationImage(image: AssetImage("asset/bank6.jpeg",),fit: BoxFit.cover),

                          ),
                        ),
                        Container(
                          width: 60,
                          height:60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blue,
                            image: DecorationImage(image: AssetImage("asset/bank7.jpeg",),fit: BoxFit.cover),

                          ),
                        ),
                        Container(
                          width: 60,
                          height:60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blue,
                            image: DecorationImage(image: AssetImage("asset/bank8.jpeg",),fit: BoxFit.cover),

                          ),
                        ),
          
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Text("Vehicle loan",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16))
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 60,
                          height:60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blue,
                            image: DecorationImage(image: AssetImage("asset/bank9.jpeg",),fit: BoxFit.cover),

                          ),
                        ),
                        Container(
                          width: 60,
                          height:60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blue,
                            image: DecorationImage(image: AssetImage("asset/bank10.jpg",),fit: BoxFit.cover),

                          ),
                        ),
                        Container(
                          width: 60,
                          height:60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blue,
                            image: DecorationImage(image: AssetImage("asset/bank11.jpeg",),fit: BoxFit.cover),

                          ),
                        ),
                        Container(
                          width: 60,
                          height:60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blue,
                            image: DecorationImage(image: AssetImage("asset/bank12.jpeg",),fit: BoxFit.cover),
                          ),
                        ),
          
                      ],
                    ),
                    SizedBox(height: 30,),
                    Card(
                      elevation: 5,
                      child: ListTile(
                        leading:   Text("Check CIBIL",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                        trailing: GestureDetector(
                            onTap: (){
                              Get.to(cibil());
                            },
                            child: Image.asset("lib/iconpro/nxtpgic.png",width: 34,height: 34,)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
