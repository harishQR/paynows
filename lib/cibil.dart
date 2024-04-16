import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_arc_text/flutter_arc_text.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:paynow/source.dart';
import 'dart:math' as math;
import 'cibils/CustomPainterAnalogMeter.dart';
import 'cibils/CustomPainterArrowIndicator.dart';
import 'cibils/CustomPainterBackground.dart';

class cibil extends StatefulWidget {
  const cibil({super.key});



  @override
  _cibilState createState() => _cibilState();
}

class _cibilState extends State<cibil> with TickerProviderStateMixin {
  late AnimationController controller;
  late AnimationController controller2;
  late AnimationController controllerColor;
  late Animation<Color?> colorTween;
  List<int> list = [1, 2, 3, 4];
  bool animationStarted = false;
  @override
  void initState() {
    super.initState();
    startAnimation();
  }

  @override
  void dispose() {
    controller.dispose();
    controller2.dispose();
    controllerColor.dispose();
    super.dispose();
  }

  startAnimation() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 5000),
    )..addListener(() {
      setState(() {});
    });

    controller2 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 7600),
    )..addListener(() {
      setState(() {});
    });

    controllerColor = AnimationController(
      duration: const Duration(
        milliseconds: 7600,
      ),
      vsync: this,
    )..addListener(() {
      setState(() {});
    });

    colorTween = ColorTween(begin: Colors.red, end: Colors.green.shade400)
        .animate(CurvedAnimation(
      parent: controllerColor,
      curve: Curves.easeOutSine,
    ));

    controller.forward();
    controller2.forward();
    controllerColor.forward();
  }
  List img = [
    "lib/iconpro/clockic.png",
    "lib/iconpro/meteric.png",
    "lib/iconpro/helpic.png",

  ];
  List cnt = [
    "on-time Payments",
    "Credit utilisation",
    "Credit enquiries",
  ] ;
  List num = [
    "100%",
    "37%",
    "0"
  ];
  List remark = [
    "Excellent",
    "Good     ",
    "Excellent",
  ];
  List ic = [
    "lib/iconpro/frwdic.png",
    "lib/iconpro/frwdic.png",
    "lib/iconpro/frwdic.png",


  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  const SizedBox(
                    height: 150,
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            height: 170,
                            width: 170,
                            child: CustomPaint(
                              painter: CustomPainterBackground(),
                            ),
                          ),
                          CustomPaint(
                            size: const Size(400, 400),
                            painter: CustomPainterAnalogMeter(value: controller.value),
                            child: Transform.rotate(
                              angle: -90,
                              child: Transform.rotate(
                                angle: controller2.value * 2 * math.pi > 4.1
                                    ? 4.1
                                    : controller2.value * 2 * math.pi,
                                child: SizedBox(
                                  width: 150,
                                  height: 150,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Positioned(
                                        top: 5,
                                        left: 60,
                                        right: 60,
                                        child: CustomPaint(
                                          size: const Size(40, 20),
                                          painter: CustomPainterArrowIndicator(
                                            color: colorTween.value,
                                          ),
                                        ),
                                      ),
                                      Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Container(
                                            width: 110,
                                            height: 110,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              boxShadow: [
                                                BoxShadow(
                                                  spreadRadius: 4,
                                                  blurRadius: 9,
                                                  color: Colors.black12,
                                                ),
                                              ],
                                              color: Colors.white,
                                            ),
                                          ),
                                          Container(
                                            width: 90,
                                            height: 90,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.grey,
                                                width: 0.7,
                                              ),
                                              shape: BoxShape.circle,
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          if (!animationStarted) { // Added condition to check if animation is not started
                            startAnimation();
                            animationStarted = true; // Set animationStarted to true after starting animation
                          }
                          int element = list[math.Random().nextInt(list.length)];
                          Future.delayed(Duration(seconds: element), () {
                            controller.stop();
                            controller2.stop();
                            controllerColor.stop();
                          });
                        },
                        child: Container(
                          width: 90,
                          height: 90,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              "${(controller.value * 1000).round()}",
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const ArcText(
                        radius: 100,
                        text: '100                      300                   500              600                          1000',
                        textStyle: TextStyle(fontSize: 14, color: Colors.black),
                        startAngle: -math.pi / 1.51,
                        startAngleAlignment: StartAngleAlignment.start,
                        placement: Placement.outside,
                        direction: Direction.clockwise,
                      ),
                    ],
                  ),
                  SizedBox(height: 50,),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (!animationStarted) {
                          startAnimation();
                          animationStarted = true;
                        }
                        controller.value = 0.8;
                        controller2.value = 0.6;
                      });
                    },
                    child: Text('Check'),
                  ),

                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child:  ListView.builder(itemCount:img.length,itemBuilder: (BuildContext context ,int index){
                      return Card(
                        child: ListTile(
                          leading: Image.asset(img[index],width: 24,height: 24,),
                          title: Text(cnt[index]),
                          trailing: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Image.asset(ic[index],width: 24,height: 24,),
                                Text(remark[index],style: TextStyle(color: Colors.green,fontSize: 11),)
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                    ),

                  ),
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

                    Text("Cibil score",style: TextStyle(color: a,fontWeight: FontWeight.bold,fontSize: 24),),
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
