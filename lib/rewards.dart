import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:paynow/source.dart';
import 'package:scratcher/scratcher.dart';
import 'package:confetti/confetti.dart'; // Import ConfettiWidget

class reward extends StatefulWidget {
  const reward({Key? key});

  @override
  State<reward> createState() => _rewardState();
}

class _rewardState extends State<reward> {
  late ConfettiController _controller;
  List<int> scratchedIndices = [];
  @override
  void initState() {
    super.initState();
    _controller = new ConfettiController(
      duration: new Duration(seconds: 2),
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the controller when not needed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Expanded(
                flex: 6,
                child: GridView.builder(
                  itemCount: 6,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: MediaQuery.of(context).size.width / 2,
                    crossAxisCount: 2,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: InstaImageViewer(
                          child: Scratcher(
                            brushSize: 150,
                            threshold: 80,
                            color: Colors.red,
                            image: Image.asset(
                              "asset/scratchit.jpg",
                              fit: BoxFit.cover,
                            ),
                            onChange: (value) =>
                                print("Scratch progress: $value%"),
                            onThreshold: () {
                              if (!scratchedIndices.contains(index)) {
                                setState(() {
                                  _controller.play();
                                  scratchedIndices.add(index);
                                });
                              }
                            },
                            child: Container(
                              height: 400,
                              width: 300,
                              color: Colors.white,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "asset/winner.png",
                                    fit: BoxFit.cover,
                                    width: 300,
                                    height: 300,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Column(
                                    children: [
                                      if (!scratchedIndices.contains(index))
                                        ConfettiWidget(
                                          blastDirectionality:
                                              BlastDirectionality.explosive,
                                          confettiController: _controller,
                                          particleDrag: 0.05,
                                          emissionFrequency: 0.05,
                                          numberOfParticles: 100,
                                          gravity: 0.05,
                                          shouldLoop: false,
                                          colors: [
                                            Colors.green,
                                            Colors.red,
                                            Colors.yellow,
                                            Colors.blue,
                                          ],
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
          Positioned(
            child: Container(
              height: 80,
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Rewards",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Icon(Icons.more_vert, color: Colors.white)
                  ],
                ),
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.grey, Colors.blueGrey],
                ),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
