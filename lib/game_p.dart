import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:paynow/source.dart';
class games extends StatefulWidget {
  const games({super.key});

  @override
  State<games> createState() => _gamesState();
}

class _gamesState extends State<games> {
List games = [
  "asset/game1.jpeg",
  "asset/game2.png",
  "asset/game3.jpg",
  "asset/game4.jpeg",
  "asset/game5.png",
  "asset/game6.jpg",
  "asset/game7.jpg",
  "asset/game8.jpeg",
  "asset/game9.png",
  "asset/game10.jpg",
  "asset/game3.jpg",
  "asset/game4.jpeg",
  "asset/game5.png",
  "asset/game6.jpg",
  "asset/game5.png",
  "asset/game6.jpg",
  "asset/game7.jpg",
  "asset/game8.jpeg",
  "asset/game6.jpg",
  "asset/game7.jpg",
  "asset/game8.jpeg",
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(40),
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25)),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.grey, Colors.blueGrey],
            ),
          ),
        ),
        leading:  IconButton(onPressed: (){
          Get.back();
        }, icon: Icon(Icons.arrow_back,color: a,),),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.more_vert,color: a,),),
        ],

        title: Text("Play & Earn",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,color: Colors.white),),

      ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: GridView.builder(
            gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
            ),
            itemCount: games.length,
            itemBuilder: (BuildContext context,int index){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(

                  child: Container(
                    height: 40,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20),
                      color  : Colors.black.withOpacity((0.2)),
                      image: DecorationImage(
                        image: AssetImage(games[index]),
                        fit: BoxFit.cover
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
    );
  }
}
