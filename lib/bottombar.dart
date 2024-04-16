import 'package:flutter/material.dart';
import 'package:paynow/credit.dart';
import 'package:paynow/history.dart';
import 'package:paynow/homepage.dart';
import 'package:paynow/settings.dart';
import 'package:paynow/source.dart';
class bottom_b extends StatefulWidget {
  const bottom_b({super.key});

  @override
  State<bottom_b> createState() => _bottom_bState();
}

class _bottom_bState extends State<bottom_b> {
  int index = 0;

List ic=[
    home_p(),
    credit(),
    history(),
    // settings(),
] ;
void tap(indexs){
  setState(() {
    index = indexs;
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.grey, // Change default color here
        ),
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20)),
          ),
          child: BottomNavigationBar(
            useLegacyColorScheme: true,
            elevation: 40,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            items: [
              BottomNavigationBarItem(
                icon: Image.asset('lib/iconpro/homeic.png', width: 24, height: 24),
                label: "home",
              ),
              BottomNavigationBarItem(
                icon: Image.asset('lib/iconpro/creditic.png', width: 24, height: 24),
                label: "credit",
              ),
              BottomNavigationBarItem(
                icon: Image.asset('lib/iconpro/historyic.png', width: 24, height: 24),
                label: "history",
              ),
              // BottomNavigationBarItem(
              //   icon: Image.asset('lib/iconpro/setting.gif', width: 24, height: 24),
              //   label: "settings",
              // ),
            ],
            currentIndex: index,
            onTap: tap,
            selectedLabelStyle: TextStyle(color: Colors.black),
            selectedItemColor: Colors.blue,
            unselectedFontSize: 14,
            selectedFontSize: 16,
            unselectedItemColor: b,
          ),
        ),
      ),
      body: ic[index],
    );

  }
}
