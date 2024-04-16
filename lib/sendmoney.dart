import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/services.dart';
import 'package:pattern_formatter/pattern_formatter.dart';
import 'package:paynow/source.dart';
import 'package:paynow/transaction_dialougue.dart';

class SendMoney extends StatefulWidget {
  final String name;
  final String avatar;
  const SendMoney({Key? key, required this.name, required this.avatar}) : super(key: key);

  @override
  _SendMoneyState createState() => _SendMoneyState();
}

class _SendMoneyState extends State<SendMoney> {
  var amount = TextEditingController(text: "0");

  FocusNode _focusNode = FocusNode();
  TextEditingController _editingController = TextEditingController();
  bool isFocused = false;

  List<String> _feedbacks = [
    'Thanks🙌',
    'ok👍🏼',
  ];

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(onFocusChanged);
  }

  void onFocusChanged() {
    setState(() {
      isFocused = _focusNode.hasFocus;
    });

    print('focus changed.');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 100,),
                  FadeInDown(
                    from: 100,
                    duration: Duration(milliseconds: 1000),
                    child: Container(
                      width: 130,
                      height: 130,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.pink.shade50,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(widget.avatar)),
                    ),
                  ),
                  SizedBox(height: 10,),
                  FadeInUp(
                      from: 60,
                      delay: Duration(milliseconds: 500),
                      duration: Duration(milliseconds: 1000),
                      child: Text("Send Money To", style: TextStyle(color: Colors.grey),)),
                  SizedBox(height: 10,),
                  FadeInUp(
                      from: 30,
                      delay: Duration(milliseconds: 800),
                      duration: Duration(milliseconds: 1000),
                      child: Text(widget.name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),)),
                  SizedBox(height: 10,),
                  FadeInUp(
                    from: 40,
                    delay: Duration(milliseconds: 800),
                    duration: Duration(milliseconds: 1000),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        width: 180,
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: TextFormField(
                          controller: amount,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true),
                          cursorColor: Colors.black,
                          style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Amount is required';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            // Save the value to your model
                          },
                          onFieldSubmitted: (value) {
                            setState(() {
                              amount.text = "\₹" + value;
                            });
                          },
                          onTap: () {
                            setState(() {
                              if (amount.text == "0") {
                                amount.text = "";
                              } else {
                                amount.text = amount.text.replaceAll(RegExp(r'.00'), '');
                              }
                            });
                          },
                          inputFormatters: [
                            ThousandsFormatter()
                          ],
                          decoration: InputDecoration(
                            hintText: "Enter Amount",
                            hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 8),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  // note textfield
                  FadeInUp(
                    from: 60,
                    delay: Duration(milliseconds: 800),
                    duration: Duration(milliseconds: 1000),
                    child: AnimatedContainer(
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      duration: Duration(milliseconds: 500),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: isFocused ? Colors.indigo.shade400 : Colors.grey.shade200, width: 2),
                        // // boxShadow:
                      ),
                      child: TextFormField(
                        maxLines: 3,
                        focusNode: _focusNode,
                        controller: _editingController,
                        keyboardType: TextInputType.text,
                        cursorColor: Colors.black,
                        style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                            hintText: "note....",
                            hintStyle: TextStyle(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w500),
                            border: InputBorder.none
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  FadeInUp(
                    from: 60,
                    delay: Duration(milliseconds: 800),
                    duration: Duration(milliseconds: 1000),
                    child: Container(
                      height: 50,
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _feedbacks.length,
                        itemBuilder: (context, index) {
                          return FadeInRight(
                            from: 100,
                            delay: Duration(milliseconds: index * 500),
                            duration: Duration(milliseconds: 1000),
                            child: BouncingWidget(
                              duration: Duration(milliseconds: 100),
                              scaleFactor: 1.5,
                              onPressed: () {
                                _editingController.text = _feedbacks[index];
                                _focusNode.requestFocus();
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 20),
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: Colors.grey.shade200, width: 2),
                                ),
                                child: Text(_feedbacks[index], style: TextStyle(
                                    color: Colors.grey.shade800,
                                    fontSize: 16
                                ),),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 50,),
                  FadeInUp(
                    duration: Duration(milliseconds: 1000),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey,
                        child: MaterialButton(
                          onPressed: () {
                            if (_validate()) {
                              _showProgressDialog(context);
                            }
                          },
                          minWidth: double.infinity,
                          height: 50,
                          child: Text("Send", style: TextStyle(color: Colors.white, fontSize: 16),),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                ],
              ),
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

                    Text("Send Money",style: TextStyle(color: a,fontWeight: FontWeight.bold,fontSize: 24),),
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
  bool _validate() {
    if (amount.text.isEmpty || amount.text == "0") {
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
