import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:paynow/source.dart';
class help extends StatefulWidget {
  const help({super.key});

  @override
  State<help> createState() => _helpState();
}

class _helpState extends State<help> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 100,
                ),
               Container(
                 width: 200,
                 height: 200,
                 decoration: BoxDecoration(
                   image: DecorationImage(image: AssetImage("asset/mec.png"),),
                 ),
               ),
                SizedBox(height: 5,),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 4,
                    ),
                      onPressed: (){}, child: Text("Having issue?",style: TextStyle(fontWeight: FontWeight.bold,),)),
                ),
                SizedBox(height:6),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Active tickets",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),),
                      Text("view all",style: TextStyle(color: Colors.blue,fontSize: 14,fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(left: 14,right: 14),
                  child: Card(
                    elevation: 5,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 260,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  radius: 40,
                                  backgroundImage: AssetImage("asset/picM.jpg"),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top:8.0),
                                  child: Column(
                                    children: [
                                      Text("suresh",style: TextStyle(fontWeight: FontWeight.bold,fontSize:24),),
                                      Text("Aug 8,2023\n9:54 AM\nPayment \nissue",style: TextStyle(fontWeight: FontWeight.normal,fontSize:16,color: Colors.black54 ),),

                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Text("₹7,655",style: TextStyle(fontWeight: FontWeight.bold,fontSize:18,color: Colors.blue),),
                                ),

                              ],
                            ),
                          ),
                          SizedBox(height: 20,),
                          Divider(color: b,),
                          SizedBox(height: 20,),
                    
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset("lib/iconpro/caution.png",width: 24,height: 24,),
                             Text("#NM5MY\nneeds action",style: TextStyle(color: Colors.black54,fontSize: 15),),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey,
                                  foregroundColor: Colors.white,
                                ),
                                onPressed: (){}, child: Text("Needs action"))
                            ],
                                                ),
                          )
                        ],
                      ),
                    ),
                  ),
                ) ,

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
                    SizedBox(width: 10,),

                    Text("Help!",style: TextStyle(color: a,fontWeight: FontWeight.bold,fontSize: 24),),
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
