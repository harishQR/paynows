import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class history extends StatefulWidget {
  const history({Key? key}) : super(key: key);

  @override
  State<history> createState() => _historyState();
}

class _historyState extends State<history> {
  var Date = "Date";
  var money = "0";
  var name_c = "beneficiar";
  List<Widget> cardWidgets = [];

  @override
  void initState() {
    super.initState();
    // Retrieve QR info from shared preferences and update nameC
    _getStoredQRInfo().then((value) {
      setState(() {
        name_c = value ?? "beneficiar";
      });
      _getStoredTransactionAmount().then((value) {
        setState(() {
          money = value ?? "0"; // If null, use a default value
          // Clear the existing card widgets list
          cardWidgets.clear();
          // Add the new card widget to the list
          cardWidgets.add(buildCard());
        });
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: kToolbarHeight), // Add space for the app bar
                  // Your card widgets here
                  // Example usage:
                  Container(
                    height: 600,
                    child: ListView.builder(
                        itemCount:cardWidgets.length,itemBuilder: (BuildContext context,int index){
                      return
                        cardWidgets[index];
                    }
                    ),
                  ),
                  // Add more card widgets as needed
                ],
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 40, color: Colors.white),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCard() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Container(
          width: 300,
          height: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                // Your card content here
                // Example usage:
                Row(
                  children: [
                    Card(
                      child: Container(
                        width: 140,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "Download Statement",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset("lib/iconpro/arrowic.gif"),
                            ),
                          ),
                          SizedBox(height: 8,),
                          Text(
                            Date.toString(),
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                      SizedBox(width: 30,),
                      Expanded(child: Text("Payment to \n $name_c", style: TextStyle(overflow: TextOverflow.ellipsis),)),
                      SizedBox(width: 5,),
                      Column(
                        children: [
                          Text("₹$money", style: TextStyle(fontSize: 20),),
                          SizedBox(height: 10,),
                          CircleAvatar(
                            radius: 15,
                            child: Image.asset("lib/iconpro/checkic.gif"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<String?> _getStoredQRInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('qr_info');
  }

  Future<String?> _getStoredTransactionAmount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('transaction_amount');
  }
}
