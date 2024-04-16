import 'package:flutter/material.dart';

class CardAlertDialog extends StatefulWidget {
  const CardAlertDialog({Key? key}) : super(key: key);

  @override
  _CardAlertDialogState createState() => _CardAlertDialogState();
}

class _CardAlertDialogState extends State<CardAlertDialog> {
  bool _isLoading = true;
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _isLoading = false;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Center(child: CircularProgressIndicator()) // Display CircularProgressIndicator if isLoading is true
        : AlertDialog(
      content: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            right: -40.0,
            top: -40.0,
            child: InkResponse(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const CircleAvatar(
                backgroundColor: Colors.red,
                child: Icon(Icons.close, color: Colors.white),
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Payment Success',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'For any queries reach our support team !',
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Service charge: 2%',
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600,color: Colors.blue),
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }
}
