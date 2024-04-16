import 'package:align_positioned/align_positioned.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paynow/sendmoney.dart';
import 'package:paynow/source.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  List<dynamic> _contacts = [
    {'name': 'harish', 'avatar': 'asset/mpic2.png'},
    {'name': 'mahesh', 'avatar': 'asset/prof.png'},
    {'name': 'ajay', 'avatar': 'asset/picM.jpg'},
    {'name': 'arif', 'avatar': 'asset/mpic2.png'},
    {'name': 'bala', 'avatar': 'asset/picM.jpg'},
    {'name': 'somu', 'avatar': 'asset/prof.png'}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 90),
                FadeInUp(
                  duration: Duration(milliseconds: 1000),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Container(
                      width: double.infinity,
                      height: 300,
                      padding: EdgeInsets.all(60.0), // Reduced padding for smaller circle size
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.lightGreen, width: 1.0),
                      ),
                      child: Stack(
                        children: [
                          for (double i = 0; i < 360; i += 60)
                            AnimChain(
                              initialDelay: Duration(milliseconds: i.toInt()),
                            ).next(
                              wait: Duration(milliseconds: 1000),
                              widget: AnimatedAlignPositioned(
                                dx: 0,
                                dy: 150,
                                duration: Duration(seconds: 1),
                                rotateDegrees: 0,
                                touch: Touch.middle,
                                child: user(0, i),
                              ),
                            ).next(
                              wait: Duration(seconds: 2),
                              widget: AnimatedAlignPositioned(
                                dx: i / 360,
                                dy: 150,
                                duration: Duration(seconds: 1),
                                rotateDegrees: i,
                                touch: Touch.middle,
                                child: user(0, i),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                FadeInRight(
                  duration: Duration(milliseconds: 500),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, bottom: 15.0, top: 10.0),
                    child: Text(
                      'Most Recent',
                      style: TextStyle(fontSize: 16, color: Colors.grey.shade900, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Container(
                  height: 90,
                  padding: EdgeInsets.only(left: 20),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _contacts.length,
                    itemBuilder: (context, index) {
                      return FadeInRight(
                        duration: Duration(milliseconds: (index * 100) + 500),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SendMoney(
                                  name: _contacts[index]['name'],
                                  avatar: _contacts[index]['avatar'],
                                ),
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                CircleAvatar(
                                  radius: 30, // Adjusted radius for smaller circle size
                                  backgroundColor: Colors.blueGrey[100],
                                  backgroundImage: AssetImage(_contacts[index]['avatar']),
                                ),
                                SizedBox(height: 10),
                                Text(_contacts[index]['name'], style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20),
                FadeInRight(
                  duration: Duration(milliseconds: 500),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 10.0),
                    child: Text(
                      'All Contacts',
                      style: TextStyle(fontSize: 16, color: Colors.grey.shade900, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height - 200,
                  padding: EdgeInsets.only(left: 20),
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _contacts.length,
                    itemBuilder: (context, index) {
                      return FadeInRight(
                        duration: Duration(milliseconds: (index * 100) + 500),
                        child: Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: Row(
                            children: <Widget>[
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 30, // Adjusted radius for smaller circle size
                                    backgroundColor: Colors.red[100],
                                    backgroundImage: AssetImage(_contacts[index]['avatar']),
                                  ),
                                  SizedBox(width: 10),
                                  Text(_contacts[index]['name'], style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                                ],
                              ),
                              Spacer(),
                              IconButton(
                                icon: Icon(Icons.arrow_forward_ios, color: Colors.black, size: 15),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
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
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(Icons.arrow_back, color: Colors.white),
                    ),
                    SizedBox(width: 5),
                    Text(
                      "Contacts",
                      style: TextStyle(color: a, fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    SizedBox(width: 20),
                    Icon(Icons.more_vert, color: a),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.grey, Colors.blueGrey],
                ),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  user(int index, double number) {
    index = number ~/ 60;
    return FadeInRight(
      delay: Duration(seconds: 1),
      duration: Duration(milliseconds: (index * 100) + 500),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SendMoney(
                name: _contacts[index]['name'],
                avatar: _contacts[index]['avatar'],
              ),
            ),
          );
        },
        child: Container(
          margin: EdgeInsets.only(right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Transform.rotate(
                angle: number / 60 * 5.2,
                child: CircleAvatar(
                  radius: 25, // Adjusted radius for smaller circle size
                  backgroundColor: Colors.green.shade100,
                  backgroundImage: AssetImage(_contacts[index]['avatar']),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container circle(Color color, [double diameter = 30.0]) {
    return Container(
      width: diameter,
      height: diameter,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
