import 'package:flutter/material.dart';
import 'package:flutter_qr_bar_scanner/qr_bar_scanner_camera.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:paynow/source.dart';
import 'package:paynow/transaction_F.dart';
import 'package:shared_preferences/shared_preferences.dart';

class scanqr extends StatefulWidget {
  @override
  _scanqrState createState() => _scanqrState();
}

class _scanqrState extends State<scanqr> {
  String? _qrInfo = 'Scan a QR';
  bool camState = false;

  qrCallback(String? code) {
    setState(() {
      camState = false;
      _qrInfo = code;
      if (_qrInfo != null) {
        _saveQRInfo(_qrInfo!);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => transaction_p(qrInfo: _qrInfo.toString()),
          ),
        );
      }
    });
  }
  _saveQRInfo(String qrInfo) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('qr_info', qrInfo);
  }
  @override
  void initState() {
    super.initState();
    setState(() {
      camState = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      floatingActionButton: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  camState = !camState;
                });
              },
              child: Image.asset("lib/iconpro/camf.png",width: 100,height: 100,),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          if (camState)
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: MediaQuery.of(context).size.height / 3+20,
                  width: MediaQuery.of(context).size.width / 2 + 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: QRBarScannerCamera(
                    fit: BoxFit.cover,
                    onError: (context, error) => Text(
                      error.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.red),
                    ),
                    qrCodeCallback: (code) {
                      qrCallback(code);
                    },
                  ),
                ),
              ),
            ),
          if (!camState)
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("lib/iconpro/camg.gif",width: 200,height: 200,),
                  Text(
                    "click camera",
                    style: TextStyle(
                        fontSize: 24,fontWeight: FontWeight.bold
                    ),
                  ),
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

                    Text("PayNow",style: TextStyle(color: a,fontWeight: FontWeight.bold,fontSize: 24),),
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
