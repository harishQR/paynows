import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:paynow/self_d.dart';
import 'package:paynow/selfpin.dart';
import 'package:paynow/source.dart';
class selftrans extends StatefulWidget {
  const selftrans({super.key});

  @override
  State<selftrans> createState() => _selftransState();
}

class _selftransState extends State<selftrans> {
  TextEditingController controller = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
         SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 80,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 220,
                      height: 330,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade600,
                        borderRadius: BorderRadius.circular(20),

                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Payment to Self Account",style: TextStyle(color: a,fontSize: 16,fontWeight: FontWeight.bold),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text("₹7,600",style: TextStyle(color: a,fontSize: 20),),

                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text("Transfer from\n"
                                    "Central Bank of india",style: TextStyle(color: a,fontSize: 16),),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text("Transfer to \n"
                                    "state bank of india",style: TextStyle(color: a,fontSize: 16),),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.white10,
                                  radius:15,
                                    backgroundImage:  AssetImage("lib/iconpro/check2.png"),
                                   ),
                                Text("Transferred.mar 21",style: TextStyle(color: a,fontSize: 16),),
                                Image.asset("lib/iconpro/nxtpgic.png",width: 24,height: 24,)
                              ],
                            ),
                          ),
                        ElevatedButton(onPressed: (){}, child: Text("Repeat",style: TextStyle(color: a),),style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey
                        ),),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right:20),
                child: Divider(color: b,),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 220,
                      height: 330,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade600,
                        borderRadius: BorderRadius.circular(20),

                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Payment to Self Account",style: TextStyle(color: a,fontSize: 16,fontWeight: FontWeight.bold),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text("₹8,000",style: TextStyle(color: a,fontSize: 20),),

                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text("Transfer from\n"
                                    "Central Bank of india",style: TextStyle(color: a,fontSize: 16),),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text("Transfer to \n"
                                    "state bank of india",style: TextStyle(color: a,fontSize: 16),),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.white10,
                                  radius:15,
                                  backgroundImage:  AssetImage("lib/iconpro/check2.png"),
                                ),
                                Text("Transferred.jul 1",style: TextStyle(color: a,fontSize: 16),),
                                Image.asset("lib/iconpro/nxtpgic.png",width: 24,height: 24,)
                              ],
                            ),
                          ),
                          ElevatedButton(onPressed: (){}, child: Text("Repeat",style: TextStyle(color: a),),style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueGrey
                          ),),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right:20),
                child: Divider(color: b,),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 220,
                      height: 330,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade600,
                        borderRadius: BorderRadius.circular(20),

                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Payment to Self Account",style: TextStyle(color: a,fontSize: 16,fontWeight: FontWeight.bold),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text("₹1,700",style: TextStyle(color: a,fontSize: 20),),

                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text("Transfer from\n"
                                    "Central Bank of india",style: TextStyle(color: a,fontSize: 16),),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text("Transfer to \n"
                                    "state bank of india",style: TextStyle(color: a,fontSize: 16),),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.white10,
                                  radius:15,
                                  backgroundImage:  AssetImage("lib/iconpro/check2.png"),
                                ),
                                Text("Transferred.Apr 2",style: TextStyle(color: a,fontSize: 16),),
                                Image.asset("lib/iconpro/nxtpgic.png",width: 24,height: 24,)
                              ],
                            ),
                          ),
                          ElevatedButton(onPressed: (){}, child: Text("Repeat",style: TextStyle(color: a),),style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueGrey
                          ),),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
SizedBox(height: 70,),
            ],
          ),
        ),
          Positioned(
              bottom: 0,
              left: MediaQuery.of(context).size.width/2-85,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context, // You need to have access to the BuildContext here
                            builder: (BuildContext context) {
                              return Container(
                                width: 600,
                                height: 300,
                                child: AlertDialog(
                                  title: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text("From:",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                          Expanded(child: Text("Tamilnadu Merchentile Bank",style: TextStyle(fontSize: 17,overflow: TextOverflow.ellipsis,color: Colors.black54),)),

                                        ],
                                      ),
                                      SizedBox(height: 25,),
                                      Row(
                                        children: [
                                          Text("To:",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                          Text("Central Bank of India",style: TextStyle(fontSize: 17,color: Colors.black54),),

                                        ],
                                      ),
                                    ],
                                  ),
                                  content: Form(
                                    key: _formKey,
                                    child: TextFormField(
                                      controller: controller,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        hintText: "Enter amount",
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (controller.text.isEmpty || double.parse(controller.text) <= 0) {
                                          return 'Please enter a valid amount';
                                        }
                                        return null;
                                      },

                                    ),
                                  ),

                                  actions: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,

                                      children: [
                                        ElevatedButton(onPressed: (){
                                          Navigator.pop(context);
                                        }, child: Text("cancel")),
                                        SizedBox(width: 4,),
                                        ElevatedButton(onPressed: (){
                                          if (_validate()) {
                                           Get.to(self_pin());
                                          }

                                        }, child: Text("transfer")),

                                      ],
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: Text("Transfer Money",style: TextStyle(
                        color: a
                      ),),style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey,
                      ),),
                    ),
                  ],
                ),
              )
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

                    Text("Self Transfer",style: TextStyle(color: a,fontWeight: FontWeight.bold,fontSize: 24),),
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

    ]
      ),
    );
  }
  bool _validate() {
    if (controller.text.isEmpty || double.parse(controller.text) <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter a valid amount'),
        ),
      );
      return false;
    }
    return true;
  }

}
bool _isDialogCanceled = false;

void _showProgressDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Center(
        child: CircularProgressIndicator(),
      );
    },
  );

  // Simulate a process by delaying for 3 seconds
  Future.delayed(Duration(seconds: 1), () {
    if (!_isDialogCanceled) {
      Navigator.pop(context);
      _showAlertDialog(context);
    }
  });
}

void _showAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return self_d();
    },
  );
}
