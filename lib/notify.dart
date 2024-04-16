import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:paynow/source.dart';
class notify extends StatefulWidget {
  const notify({super.key});

  @override
  State<notify> createState() => _notifyState();
}

class _notifyState extends State<notify> {
List announce =[
  "hey!",
  "good morning!",
  "hello",
  "morning cheif",
  "offer!",
  "hot deal!",
  "dont miss it!",
] ;
List date = [
  "15-04-2024",
  "12-04-2024",
  "28-03-2024",
  "26-03-2024",
  "20-03-2024",
  "18-03-2024",
  "15-03-2024",


];
List cnt = [
  "Participate using your cashback points",
  "say hello to stocks on the paynow app ",
  "your are eligible for loan rupees 50000",
  "dont do that find them in offer",
  "gold prices are highest ever",
  "check out your rewards",
  "Feel the money and spend the money in convinent way in ucoming days",

];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
         SingleChildScrollView(
           child: Column(
            children: [
              SizedBox(height: 100,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 600,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 100,
                        width: 150,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(announce[index],style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                                    Text(date[index],style: TextStyle(color: Colors.black54),),
           
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Row(
                                      children: [
                                        Expanded(child: Text(cnt[index],style: TextStyle(fontSize: 15,overflow: TextOverflow.ellipsis),)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 14),
                                    child: Row(
                                      children: [
                                        Text("from PayNow",style: TextStyle(fontSize: 12,color: Colors.grey),),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ),
                      );
                    },
                    itemCount: cnt.length,
                    scrollDirection: Axis.vertical,
                  ),
                ),
              ),
           SizedBox(height: 30,),
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
      
                    Text("Notifications",style: TextStyle(color: a,fontWeight: FontWeight.bold,fontSize: 24),),
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
          Positioned(
            top: 75,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 40, color: Colors.white),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
            ),
          ),
      
      
      ],
      ),
    );
  }
}
