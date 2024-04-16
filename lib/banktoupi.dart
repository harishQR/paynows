import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'homepage.dart';

class BtoU extends StatefulWidget {
  const BtoU({Key? key}) : super(key: key);

  @override
  State<BtoU> createState() => _BtoUState();
}

class _BtoUState extends State<BtoU> {
List bank = [
  "Mr.Harish Ragavendhirar",
  "Mr.Harish Ragavendhirar",
];
List bankimg = [
  "asset/sbi.jpg",
  "asset/tmb.jpeg",

];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(Icons.arrow_back),
          ),
          bottom: TabBar(
            labelColor: Colors.black,
            indicatorColor: Colors.black,
            tabs: [
              Tab(
                child: Text("Bank\nAccounts"),
              ),
              Tab(
                child: Text("UPI ID"),
              ),
              Tab(
                child: Text("   UPI Number"),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(itemCount:bank.length,itemBuilder: (BuildContext context ,int index){
               return Card(
                 child: ListTile(
                   leading: CircleAvatar(
                     radius: 20,
backgroundImage: AssetImage(bankimg[index]),

                   ),
                   title: Text(bank[index]),
                   trailing: Icon(Icons.more_vert),
                 ),
               );
            }
            ),
            Container(
              child: Column(
                children: [
                  SizedBox(height: 80,),
                  Center(
                    child: Text("Send money to any UPI\n"
                        "    ID across any app",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  ),
                  SizedBox(height: 10,),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          width: 300 ,
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image.asset("asset/upiwall.jpg"),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                      ),
                      onPressed: (){}, child: Text("ADD UPI ID",style: TextStyle(color: Colors.white),))
                ],
              ),

            ),
            Container(
              child: Column(
                children: [
                  SizedBox(height: 50,),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          width: 300 ,
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image.asset("asset/upiwall.jpg"),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  Center(
                    child: Text("Send money to any UPI\n"
                        "    ID across any app",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  ),
                  SizedBox(height: 20,),

                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                      ),
                      onPressed: (){}, child: Text("ADD UPI Number",style: TextStyle(color: Colors.white),))
                ],
              ),

            ),

          ],
        ),
      ),
    );
  }
}
