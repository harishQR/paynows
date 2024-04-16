import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'homepage.dart';
import 'mpin.dart';

class cr_trans extends StatefulWidget {
  cr_trans({Key? key}) : super(key: key);

  @override
  State<cr_trans> createState() => _cr_transState();
}

class _cr_transState extends State<cr_trans> {
  TextEditingController controller = TextEditingController();

  String? _validateInput(String? value) {
    if (value == null || value.isEmpty) {
      // Display toast message if input is null or empty
      Fluttertoast.showToast(
        msg: "Invalid transaction",
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
      return "Invalid transaction";
    } else if (int.parse(value) <= 0 ) {
      // Display toast message if amount is less than or equal to 1 rupee
      Fluttertoast.showToast(
        msg: "Transaction must be greater than 1 rupee",
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
      return "Transaction must be greater than 1 rupee";
    }
    return null; // Return null if validation passes
  }

  void _validateAndNavigate() {
    // Validate the input
    String? error = _validateInput(controller.text);
    if (error == null) {
      _saveTransactionAmount(controller.text);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => mpin(),
        ),
      );
    }
  }
  void _saveTransactionAmount(String amount) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('transaction_amount', amount);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading:
        IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            size: 40,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => home_p()),
              );
            },
            icon: Icon(
              Icons.cancel,
              size: 40,
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage("asset/picM.jpg"),
                      backgroundColor: Colors.white,
                      radius: 70,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            Center(
              child: Container(
                width: 300,
                child: Column(
                  children: [
                    Text("Paying",style: TextStyle(fontSize: 18,overflow: TextOverflow.ellipsis)),

                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("₹", style: TextStyle(fontSize: 60),),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            height: 60,
                            width: 200,
                            child: TextFormField(
                              controller: controller,
                              keyboardType: TextInputType.number,
                              style: TextStyle(fontSize: 30),
                              decoration: InputDecoration(
                                hintText: "0",
                                hintStyle: TextStyle(fontSize: 40),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 2, horizontal: 10),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),

                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              validator: _validateInput,
                            ),
                          ),
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: IconButton(
                            onPressed:_validateAndNavigate,
                            icon: Icon(Icons.check,color: Colors.black,),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Image.asset("lib/iconpro/secure.png",width: 200,height: 200,),
          ],
        ),
      ),
    );
  }
}
