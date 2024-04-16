import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paynow/checkbal2.dart';
import 'package:paynow/mpin.dart';
import 'package:paynow/source.dart';
class checkbal extends StatefulWidget {
  const checkbal({super.key});

  @override
  State<checkbal> createState() => _checkbalState();
}

class _checkbalState extends State<checkbal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Get.back();
        },icon: Icon(Icons.arrow_back,color: Colors.white,),),
        title: Text("Check Balance",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,color: Colors.white),),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(50),
          ),
        ),
        flexibleSpace: Container(
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.grey, Colors.blueGrey],
            ),
          ),
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.more_vert,color: a,))
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20,),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("Select account",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: b),),
                ],

              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                onTap: (){
                    Get.to(bal_mpin());
                },
                leading: Container(
                  width: 90,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage("asset/tmb.jpeg"),
                      fit: BoxFit.cover
                    ),

                  ),
                ),
               title: Text("TamilNadu Mercantile Bank",),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                onTap: (){
                  Get.to(bal_mpin());
                },
                leading: Container(
                  width: 90,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage("asset/sbi.jpg"),
                      fit: BoxFit.cover,
                    ),

                  ),
                ),
                title: Text("State Bank of India"),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
