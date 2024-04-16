import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart'; // Import Fluttertoast package
import 'package:get/get.dart';
import 'package:paynow/bottombar.dart';
import 'package:paynow/transaction_dialougue.dart';
import 'homepage.dart';

class mpin extends StatefulWidget {
  const mpin({Key? key}) : super(key: key);

  @override
  State<mpin> createState() => _mpinState();
}

class _mpinState extends State<mpin> {
  List<TextEditingController> controllers =
  List.generate(4, (_) => TextEditingController());
  List<FocusNode> focusNodes = List.generate(4, (_) => FocusNode());

  @override
  void dispose() {
    // Dispose focus nodes and controllers to avoid memory leaks
    for (var node in focusNodes) {
      node.dispose();
    }
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
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
                MaterialPageRoute(builder: (context) => bottom_b()),
              );
            },
            icon: Icon(
              Icons.cancel,
              size: 40,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 10,
              ),
              Center(
                child: Text(
                  "Enter 4-Digit UPI PIN",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: List.generate(
                  4,
                      (index) => Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: controllers[index],
                        focusNode: focusNodes[index],
                        decoration: InputDecoration(
                          hintText: '0',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          // Automatically move to the next field when a character is entered
                          if (value.isNotEmpty) {
                            if (index < controllers.length - 1) {
                              FocusScope.of(context).requestFocus(
                                  focusNodes[index + 1]);
                            } else {
                              // If the last field is filled, unfocus it
                              focusNodes[index].unfocus();
                            }
                          }
                        },
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      child: IconButton(
                        onPressed: () {
                          bool allFieldsFilled = true;
                          // Check if any field is empty
                          for (var controller in controllers) {
                            if (controller.text.isEmpty) {
                              allFieldsFilled = false;
                              break;
                            }
                          }
                          // If any field is empty, show toast
                          if (!allFieldsFilled) {
                            Fluttertoast.showToast(
                                msg: "Please fill all fields",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          } else {
                            // Otherwise, proceed
                            CircularProgressIndicator();
                            _showProgressDialog(context);
                          }
                        },
                        icon: Icon(Icons.check, color: Colors.black),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.green,
                      ),
                    )
                  ],
                ),
              ),
              Image.asset(
                "lib/iconpro/secure.png",
                width: 200,
                height: 200,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _showProgressDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false, // Prevent dialog dismissal on outside tap
    builder: (BuildContext context) {
      return Center(
        child: CircularProgressIndicator(),
      );
    },
  );

  // Simulate a process by delaying for 3 seconds
  Future.delayed(Duration(seconds: 3), () {
    Navigator.pop(context); // Close the dialog after 3 seconds
    _showAlertDialog(context); // Show the alert dialog
  });
}

void _showAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return transfer_dlg();
    },
  );
}
