import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:paynow/banktoupi.dart';
import 'package:paynow/booking.dart';
import 'package:paynow/checkbal.dart';
import 'package:paynow/fund.dart';
import 'package:paynow/game_p.dart';
import 'package:paynow/help.dart';
import 'package:paynow/ins.dart';
import 'package:paynow/notify.dart';
import 'package:paynow/offer.dart';
import 'package:paynow/recharge.dart';
import 'package:paynow/rewards.dart';
import 'package:paynow/scanqr.dart';
import 'package:paynow/selftransfer.dart';
import 'package:paynow/contact_p.dart';
import 'package:paynow/showqr.dart';
import 'package:paynow/stock.dart';
import 'package:paynow/wallet.dart';
import 'package:url_launcher/url_launcher.dart';
import 'source.dart';

class home_p extends StatefulWidget {
  const home_p({Key? key}) : super(key: key);

  @override
  State<home_p> createState() => _home_pState();
}

class _home_pState extends State<home_p> {
  _home_pState createState() => _home_pState();
  int currentpage = 0;
  List plans = [
    "insurance",
    "offers",
    "Recharge",
    "bookings",
    "fund plans",
    "Stocks",
  ];
  List img =[
    "asset/ad1.png",
    "asset/ad2.png",
    "asset/ad3.jpg",
    "asset/ad4.jpg",
    "asset/ad5.jpg",
    "asset/ad7.png",

  ];
  List img2 =[
    "asset/insure.jpeg",
    "asset/offer.jpg",
    "asset/recharge.png",
    "asset/booking.jpeg",
    "asset/fund.jpeg",
    "asset/stock.jpeg",
  ];
  int currentindex = 0;
  List pg = [
    ins(),
    offer(),
    recharge(),
    book(),
    fund(),
    stock(),
  ];

  @override
  void initState() {
    super.initState();
    _checkLocationService();
  }
  Future<void> _checkLocationService() async {
    bool locationEnabled = await Geolocator.isLocationServiceEnabled();
    if (!locationEnabled) {
      _showLocationAlertDialog();
    }
  }

  Future<void> _showLocationAlertDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Location Services Disabled'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Please enable location services to use this app.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Quit'),
              onPressed: () {
                Navigator.of(context).pop();
                SystemNavigator.pop();
                exit(0);
                // Quit the app if the user refuses to enable location services
                // You can use SystemNavigator.pop() to exit the app
                // Note: This is only available on Android
                // SystemNavigator.pop();
                // Alternatively, you can use exit(0) which exits the app on all platforms
                // However, it's not recommended for production apps.
                // exit(0);
              },
            ),
            TextButton(
              child: Text('Enable'),
              onPressed: () {
                Navigator.of(context).pop();
                // Open the device settings to allow the user to enable location services
                Geolocator.openLocationSettings();
              },
            ),
          ],
        );
      },
    );
  }
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final Uri amaz = Uri.parse('https://www.amazon.com/');
  final Uri bookmys = Uri.parse('https://www.bookmyshow.com/');
  final Uri flip = Uri.parse('https://www.flipkart.com/');
  final Uri jio = Uri.parse('https://www.jio.com/');
  final Uri swig = Uri.parse('https://www.swiggy.com/');
  final Uri zom = Uri.parse('https://www.zomato.com/');
  final Uri rapido = Uri.parse('https://www.rapido.com/');
  final Uri pharm = Uri.parse('https://www.pharmeasy.in/');
@override
  Widget build(BuildContext context) {
    return Scaffold(

      key: _scaffoldKey,
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(50),
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25)),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.grey, Colors.blueGrey],
            ),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          icon: Icon(
            Icons.menu,
            size: 30,
            color: Colors.white,
          ),
        ),
        title: Text(
          "PayNow",
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(showqr());
              },
              icon: Icon(
                Icons.qr_code,
                color: Colors.white,
              )),

          IconButton(
              onPressed: () {
                Get.to(notify());
              },
              icon: Icon(
                Icons.notifications,
                color: Colors.white,
              ),),
          IconButton(
              onPressed: () {
                Get.to(help());
              },
              icon: Icon(
                Icons.help,
                color: Colors.white,
              )),


        ],
      ),
      drawer:
      Drawer(
        width: MediaQuery.of(context).size.width/2+80,
        backgroundColor: Colors.white,
        child: ListView(
          // Remove padding
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Harish',style: TextStyle(fontWeight: FontWeight.bold)),
              accountEmail: Text('google@gmail.com',style: TextStyle(fontWeight: FontWeight.bold),),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.asset(
                    'asset/prof.png',
                    fit: BoxFit.cover,
                    width: 90,
                    height: 90,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                        'asset/userbg.jpg')
                ),
              ),
            ),
            ListTile(
              splashColor: Colors.blueGrey,

              leading: Image.asset("lib/iconpro/languageic.png",width: 24,height: 24,),
              title: Text('Languages'),
              onTap: () => null,
            ),
            ListTile(
              splashColor: Colors.blueGrey,
              leading: Icon(Icons.notifications),
              title: Text('Bill notification'),
              onTap: () => null,
            ),
            ListTile(
              splashColor: Colors.blueGrey,

              leading: Icon(Icons.share),
              title: Text('Share'),
              onTap: () => null,
            ),
            ListTile(
              splashColor: Colors.blueGrey,

              leading: Image.asset("lib/iconpro/theme.gif",width: 24,height: 24,),
              title: Text('theme'),
              onTap: () => null,
            ),

            Divider(),
            ListTile(
              splashColor: Colors.blueGrey,

              leading: Image.asset("lib/iconpro/payic.png",width: 24,height: 24,),
              title: Text('payment request'),
              onTap: () => null,
            ),

            ListTile(
              splashColor: Colors.blueGrey,

              leading: Image.asset("lib/iconpro/lockic.png",width: 24,height: 24,),
              title: Text('password update'),
              onTap: () => null,
            ),

            Divider(),

            ListTile(
              splashColor: Colors.blueGrey,

              title: Text('LogOut'),
              leading: Icon(Icons.exit_to_app),
              onTap: () => null,
            ),
          ],
        ),
      ),


      body: Stack(
        children: [
        CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Column(children: [
                SizedBox(
                  height: 51,
                ),

              ]),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return Container(
                    height: 180,
                    width: double.infinity,
                    child: ListView.builder(
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          width:125,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      width: 130,
                                      height: 70,
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: Image(
                                            image:
                                            AssetImage(img2[index]),
                                            fit: BoxFit.fill,
                                          )),
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Text(plans[index]),
                                ElevatedButton(onPressed: (){
                                  Get.to(pg[index]);
                                }, child: Text("view",style: TextStyle(fontWeight: FontWeight.bold),),style: ElevatedButton.styleFrom(
                                  // side: BorderSide(color: Colors.grey),
                                    shadowColor: Colors.black,
                                    elevation: 3
                                ),),

                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: plans.length,
                      scrollDirection: Axis.horizontal,
                    ),
                  );
                },
                // 40 list items
                childCount: 1,
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          "Transfer Money",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: b,
                              fontSize: 17),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          height: 60,
                                          width: 60,
                                          decoration: BoxDecoration(
                                            color: Colors.black12,
                                            borderRadius:
                                            BorderRadius.circular(20),
                                          ),
                                          child: GestureDetector(
                                              onTap: (){
                                                Get.to(scanqr());
                                              },
                                              child: Image.asset("lib/iconpro/scanqric.png")),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            " ScanQR\n"
                                                "",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              overflow: TextOverflow.ellipsis,
                                                fontSize: 11,
                                               color: Colors.black54,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          height: 60,
                                          width: 60,
                                          decoration: BoxDecoration(
                                            color: Colors.black12,
                                            borderRadius:
                                            BorderRadius.circular(20),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: GestureDetector(
                                                onTap: (){
                                                  Get.to(BtoU());
                                                },
                                                child: Image.asset("lib/iconpro/bankic.png")),
                                          ),
                                        ),

                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            " To bank/\n"
                                                " UPI ID",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,fontSize: 11,
                                               color: Colors.black54
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          height: 60,
                                          width: 60,
                                          decoration: BoxDecoration(
                                            color: Colors.black12,
                                            borderRadius:
                                            BorderRadius.circular(20),
                                          ),
                                          child: GestureDetector(
                                              onTap: (){
                                                Get.to(selftrans());
                                              },
                                              child: Image.asset("lib/iconpro/transferic.png")),
                                        ),

                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "    Self\n transfer",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,fontSize: 12,
                                                color: Colors.black54

                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          height: 60,
                                          width: 60,
                                          decoration: BoxDecoration(
                                            color: Colors.black12,
                                            borderRadius:
                                            BorderRadius.circular(20),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: GestureDetector(
                                                onTap: (){
                                                  Get.to(checkbal());
                                                },
                                                child: Image.asset("lib/iconpro/balanceic.png")),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            " check\nBalance",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,fontSize: 12,
                                                color: Colors.black54

                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          height: 60,
                                          width: 60,
                                          decoration: BoxDecoration(
                                            color: Colors.black12,
                                            borderRadius:
                                            BorderRadius.circular(20),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: GestureDetector(
                                                onTap: (){
                                                  Get.to(reward());
                                                },
                                                child: Image.asset("lib/iconpro/giftic.png")),
                                          ),
                                        ),

                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            " Gift\ncards",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,fontSize: 12,
                                                color: Colors.black54

                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          height: 60,
                                          width: 60,
                                          decoration: BoxDecoration(
                                            color: Colors.black12,
                                            borderRadius:
                                            BorderRadius.circular(20),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: GestureDetector(
                                                onTap: (){
                                                  Get.to(ContactPage());
                                                },
                                                child: Image.asset("lib/iconpro/mobiletransic.png")),
                                          ),
                                        ),

                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            " to mobile\n  number",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,fontSize: 12,
                                                color: Colors.black54

                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          height: 60,
                                          width: 60,
                                          decoration: BoxDecoration(
                                            color: Colors.black12,
                                            borderRadius:
                                            BorderRadius.circular(20),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: GestureDetector(
                                                onTap: (){
                                                  Get.to(wallet());
                                                },
                                                child: Image.asset("lib/iconpro/wallet.png")),
                                          ),
                                        ),

                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            " Wallet\n",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,fontSize: 12,
                                                color: Colors.black54

                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          height: 60,
                                          width: 60,
                                          decoration: BoxDecoration(
                                            color: Colors.black12,
                                            borderRadius:
                                            BorderRadius.circular(20),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: GestureDetector(
                                                onTap: (){
                                                    Get.to(games());
                                                },
                                                child: Image.asset("lib/iconpro/gameic.png")),
                                          ),
                                        ),

                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            " play\n&earn",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,fontSize: 12,
                                                color: Colors.black54

                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          "Sponsers",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: b,
                              fontSize: 17),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                       Container(
                        height: 140,
                        width: MediaQuery.of(context).size.width,
                        child: CarouselSlider.builder(
                          carouselController: CarouselController(),
                          itemCount: img.length,
                          itemBuilder:
                              (BuildContextcontext, int index, int pageViewIndex) {
                            return Card(
                              child: Container(
                                height: 400,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  // border: Border.all(color: Colors.blueGrey),
                                  image: DecorationImage(
                                      image: AssetImage(img[index]),
                                      fit: BoxFit.fill),
                                ),
                              ),
                            );
                          },
                          options: CarouselOptions(
                              height: 400,
                              aspectRatio: 8 / 9,
                              viewportFraction: 1,
                              initialPage: 0,
                              enableInfiniteScroll: true,
                              reverse: false,
                              autoPlay: true,
                              autoPlayInterval: const Duration(seconds: 2),
                              autoPlayAnimationDuration:
                              const Duration(milliseconds: 800),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enlargeCenterPage: true,
                              enlargeFactor: 0.3,
                              scrollDirection: Axis.horizontal,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  currentpage = index;
                                });
                              }),
                        ),
                      ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          left: 0,
                          child:
                        DotsIndicator(
                          dotsCount: img.length,
                          position: currentpage.toInt(),
                          decorator: DotsDecorator(
                            size: Size(5,5 ),
                            activeSize: Size(9,20),
                            activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            color: Colors.grey.shade500,
                            activeColor: Colors.blueGrey,
                          ),
                        ),
                        ),
    ]
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("Switch",style: TextStyle(fontWeight: FontWeight.bold,color: b,fontSize: 18),),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: (()async{
                            launchUrl(amaz);
                            // _launchURL('http://www.instagram.com/atm.zpe');
                          }),
                          child: CircleAvatar(
                            radius:30,
                            backgroundImage: AssetImage("asset/amazon.png"),
                          ),
                        ),
                        InkWell(
                          onTap: (()async{
                            launchUrl(bookmys);
                            // _launchURL('http://www.instagram.com/atm.zpe');
                          }),
                          child: CircleAvatar(
                            radius:30,
                            backgroundImage: AssetImage("asset/bookmy.png"),
                          ),
                        ),
                        InkWell(
                          onTap: (()async{
                            launchUrl(flip);
                            // _launchURL('http://www.instagram.com/atm.zpe');
                          }),
                          child: CircleAvatar(
                            radius:30,
                            backgroundImage: AssetImage("asset/flipkart.png"),
                          ),
                        ),
                        InkWell(
                          onTap: (()async{
                            launchUrl(jio);
                          }),
                          child: CircleAvatar(
                            radius:30,
                            backgroundImage: AssetImage("asset/jio.png"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: (()async{
                            launchUrl(swig);
                          }),
                          child: CircleAvatar(
                            radius:30,
                            backgroundImage: AssetImage("asset/swiggy.png"),
                          ),
                        ),
                        InkWell(
                          onTap: (()async{
                            launchUrl(zom);
                          }),
                          child: CircleAvatar(
                            radius:30,
                            backgroundImage: AssetImage("asset/zomato.png"),
                          ),
                        ),
                        InkWell(
                          onTap: (()async{
                            launchUrl(rapido);
                          }),
                          child: CircleAvatar(
                            radius:30,
                            backgroundImage: AssetImage("asset/rapido.png"),
                          ),
                        ),
                        InkWell(
                          onTap: (()async{
                            launchUrl(pharm);
                          }),
                          child: CircleAvatar(
                            radius:30,
                            backgroundImage: AssetImage("asset/pharm.png"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        width: 260,
                        child: Divider(color: Colors.grey,thickness: 1,)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("People",style: TextStyle(fontWeight: FontWeight.bold,color: b,fontSize: 18),),


                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              radius:30,
                              backgroundImage: AssetImage("asset/men8.png"),
                            ),
                            SizedBox(height: 1,),
                            Text("harish",style: TextStyle(color: Colors.black54,fontSize: 12,),),
                          ],
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                              radius:30,
                              backgroundImage: AssetImage("asset/picM.jpg"),
                            ),
                            SizedBox(height: 1,),
                            Text("surya",style: TextStyle(color: Colors.black54,fontSize: 12,),),
                          ],
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                              radius:30,
                              backgroundImage: AssetImage("asset/men4.png"),
                            ),
                            SizedBox(height: 1,),
                            Text("bala",style: TextStyle(color: Colors.black54,fontSize: 12,),),
                          ],
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                              radius:30,
                              backgroundImage: AssetImage("asset/men5.png"),
                            ),
                            SizedBox(height: 1,),
                            Text("somu",style: TextStyle(color: Colors.black54,fontSize: 12,),),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              radius:30,
                              backgroundImage: AssetImage("asset/men6.png"),
                            ),
                            SizedBox(height: 1,),
                            Text("bharath",style: TextStyle(color: Colors.black54,fontSize: 12,),),
                          ],
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                              radius:30,
                              backgroundImage: AssetImage("asset/men7.png"),
                            ),
                            SizedBox(height: 1,),
                            Text("arif",style: TextStyle(color: Colors.black54,fontSize: 12,),),
                          ],
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                              radius:30,
                              backgroundImage: AssetImage("asset/men8.png"),
                            ),
                            SizedBox(height: 1,),
                            Text("ajay",style: TextStyle(color: Colors.black54,fontSize: 12,),),
                          ],
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                              radius:30,
                              backgroundImage: AssetImage("asset/girlimg.png"),
                            ),
                            SizedBox(height: 1,),
                            Text("yalini",style: TextStyle(color: Colors.black54,fontSize: 12,),),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              radius:30,
                              backgroundImage: AssetImage("asset/men2.jpg"),
                            ),
                            SizedBox(height: 1,),
                            Text("sam",style: TextStyle(color: Colors.black54,fontSize: 12,),),
                          ],
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                              radius:30,
                              backgroundImage: AssetImage("asset/men3.jpg"),
                            ),
                            SizedBox(height: 1,),
                            Text("naveen",style: TextStyle(color: Colors.black54,fontSize: 12,),),
                          ],
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                              radius:30,
                              backgroundImage: AssetImage("asset/girlimg.png"),
                            ),
                            SizedBox(height: 1,),
                            Text("priya",style: TextStyle(color: Colors.black54,fontSize: 12,),),
                          ],
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                              radius:30,
                              backgroundImage: AssetImage("asset/picM.jpg"),
                            ),
                            SizedBox(height: 1,),
                            Text("harish",style: TextStyle(color: Colors.black54,fontSize: 12,),),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height:50),
                ],
              ),
            ),
          ],
        ),
   Positioned(
     bottom: -3,
     left: MediaQuery.of(context).size.width/2-28,
     child:
   Column(
     children: [
       FloatingActionButton(onPressed: (){
         Get.to(scanqr());
       },
         child: Container(
             width: 30,
             height:30,
             child: Image.asset("lib/iconpro/scanqric.png",fit: BoxFit.cover,)),
         backgroundColor: Colors.white,
       ),
       Text("Scan",style: TextStyle(fontWeight: FontWeight.bold,),)
     ],
   ),
   ),
          Positioned(
            top:2,
            right: 0,
            left:0,
            child:
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 310,
                  height: 60,
                  child: TextFormField(
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 0, horizontal: 10),
                      hintText: "Search",
                      hintStyle: TextStyle(color: Colors.black,fontSize: 18),
                      prefixIcon: Icon(
                        Icons.search,color: Colors.black,size: 40,
                      ),
                      border: OutlineInputBorder(
                        borderSide:
                        BorderSide(width: 40, color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                    ),
                  ),
                ),
              ],
            ),

          ),

    ],
      ),
    );
  }
}
