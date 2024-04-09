import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'color.dart';

class home_p extends StatefulWidget {
  const home_p({Key? key}) : super(key: key);

  @override
  State<home_p> createState() => _home_pState();
}

class _home_pState extends State<home_p> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: a,
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(50),
          ),
        ),
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blue, Colors.cyan],
            ),
          ),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,size: 30,
            color: Colors.white,
          ),
        ),
        title: Text("PayNow",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.notifications,color: Colors.white,)),
          IconButton(onPressed: (){}, icon: Icon(Icons.help,color: Colors.white,)),
        ],
      ),
      body: CustomScrollView(
        slivers:<Widget> [
          SliverToBoxAdapter(
            child: Stack(
              children:[
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    image: DecorationImage(image: AssetImage("asset/paynow1.jpg"),
                    fit: BoxFit.cover,
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      color: Colors.transparent,
                      shadowColor: Colors.black,
                      elevation: 20,
                      child: Container(
                        width: 200,
                        child: TextFormField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
                            hintText: "Search",
                            prefixIcon: Icon(Icons.search,),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(width: 40,color: Colors.white),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            focusedBorder:OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return Container(
                  height: 200,
                  width: 160,
                  child: ListView(
                    physics: ScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 100,
                              width: 140,
                              decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage("asset/paynow1.jpg")),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 100,
                              width: 140,
                              decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage("asset/paynow1.jpg")),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width:200,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 90,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(image: AssetImage("asset/paynow1.jpg"),
                                            fit:BoxFit.cover ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
              // 40 list items
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}
// Widget aa()
// {
//   return ElevatedButton(onPressed: (){}, child: Text(""));
// }
