import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:paynow/cr_trans.dart';
import 'package:paynow/source.dart';
import '../constants.dart';
import 'card_c/card_alert_dialog.dart';
import 'card_c/card_input_formatter.dart';
import 'card_c/card_month_input_formatter.dart';
import 'card_c/master_card.dart';
import 'card_c/my_painter.dart';

class creditcard extends StatefulWidget {
  const creditcard({Key? key}) : super(key: key);

  @override
  State<creditcard> createState() => _creditcardState();
}

class _creditcardState extends State<creditcard> {
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController cardHolderNameController =
      TextEditingController();
  final TextEditingController cardExpiryDateController =
      TextEditingController();
  final TextEditingController cardCvvController = TextEditingController();

  final FlipCardController flipCardController = FlipCardController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
         SafeArea(
          child: SingleChildScrollView(
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               SizedBox(height: 30,),
               const SizedBox(height: 30),
               FlipCard(
                   fill: Fill.fillFront,
                   direction: FlipDirection.HORIZONTAL,
                   controller: flipCardController,
                   onFlip: () {
                     print('Flip');
                   },
                   flipOnTouch: false,
                   onFlipDone: (isFront) {
                     print('isFront: $isFront');
                   },
                   front: Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 10),
                     child: buildCreditCard(
                       color: kDarkBlue,
                       cardExpiration: cardExpiryDateController.text.isEmpty
                           ? "07/2032"
                           : cardExpiryDateController.text,
                       cardHolder: cardHolderNameController.text.isEmpty
                           ? "Card Holder"
                           : cardHolderNameController.text.toUpperCase(),
                       cardNumber: cardNumberController.text.isEmpty
                           ? "XXXX XXXX XXXX XXXX"
                           : cardNumberController.text,
                     ),
                   ),
                   back: Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 10),
                     child: Card(
                       elevation: 4.0,
                       color: kDarkBlue,
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(14),
                       ),
                       child: Container(
                         height: 190,
                         padding: const EdgeInsets.only(
                             left: 16.0, right: 16.0, bottom: 22.0),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             const SizedBox(height: 0),
                             const Text(
                               'https://www.PayNow.com',
                               style: TextStyle(
                                 color: Colors.white54,
                                 fontSize: 11,
                               ),
                             ),
                             Container(
                               height: 45,
                               width: MediaQuery.of(context).size.width / 1.2,
                               decoration: BoxDecoration(
                                 color: Colors.white.withOpacity(0.2),
                                 borderRadius: BorderRadius.circular(5),
                               ),
                             ),
                             CustomPaint(
                               painter: MyPainter(),
                               child: SizedBox(
                                 height: 35,
                                 width: MediaQuery.of(context).size.width / 1.2,
                                 child: Align(
                                   alignment: Alignment.centerRight,
                                   child: Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: Text(
                                       cardCvvController.text.isEmpty
                                           ? "XXX"
                                           : cardCvvController.text,
                                       style: const TextStyle(
                                         color: Colors.black,
                                         fontSize: 18,
                                       ),
                                     ),
                                   ),
                                 ),
                               ),
                             ),
                             const SizedBox(height: 10),
                           ],
                         ),
                       ),
                     ),
                   )),
               const SizedBox(height: 40),
               Container(
                 height: 55,
                 width: MediaQuery.of(context).size.width / 1.12,
                 decoration: BoxDecoration(
                   color: Colors.grey[200],
                   borderRadius: BorderRadius.circular(15),
                 ),
                 child: TextFormField(
                   controller: cardNumberController,
                   keyboardType: TextInputType.number,
                   decoration: const InputDecoration(
                     border: InputBorder.none,
                     contentPadding:
                         EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                     hintText: 'Card Number',
                     hintStyle: TextStyle(
                       color: Colors.grey,
                       fontSize: 16,
                     ),
                     prefixIcon: Icon(
                       Icons.credit_card,
                       color: Colors.grey,
                     ),
                   ),
                   inputFormatters: [
                     FilteringTextInputFormatter.digitsOnly,
                     LengthLimitingTextInputFormatter(16),
                     CardInputFormatter(),
                   ],
                   onChanged: (value) {
                     var text = value.replaceAll(RegExp(r'\s+\b|\b\s'), ' ');
                     setState(() {
                       cardNumberController.value = cardNumberController.value
                           .copyWith(
                               text: text,
                               selection:
                                   TextSelection.collapsed(offset: text.length),
                               composing: TextRange.empty);
                     });
                   },
                 ),
               ),
               const SizedBox(height: 12),
               Container(
                 height: 55,
                 width: MediaQuery.of(context).size.width / 1.12,
                 decoration: BoxDecoration(
                   color: Colors.grey[200],
                   borderRadius: BorderRadius.circular(15),
                 ),
                   child: TextFormField(
                     controller: cardHolderNameController,
                     keyboardType: TextInputType.name,
                     maxLength: 18, // Set maximum length to 20 characters
                     decoration: const InputDecoration(
                       border: InputBorder.none,
                       contentPadding:
                       EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                       hintText: 'Full Name',
                       hintStyle: TextStyle(
                         color: Colors.grey,
                         fontSize: 16,
                       ),
                       counterText: "",
                       prefixIcon: Icon(
                         Icons.person,
                         color: Colors.grey,
                       ),
                     ),
                     validator: (value) {
                       if (value!.length > 18) {
                         Fluttertoast.showToast(
                           msg: "Maximum 20 characters allowed",
                           toastLength: Toast.LENGTH_SHORT,
                           gravity: ToastGravity.CENTER,
                         );
                         return "Maximum 20 characters allowed";
                       }
                       return null;
                     },
                     onChanged: (value) {
                       setState(() {
                         cardHolderNameController.value =
                             cardHolderNameController.value.copyWith(
                                 text: value,
                                 selection:
                                 TextSelection.collapsed(offset: value.length),
                                 composing: TextRange.empty);
                       });
                     },
                   ),

               ),
               SizedBox(height: 12),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Container(
                     height: 55,
                     width: MediaQuery.of(context).size.width / 2.4,
                     decoration: BoxDecoration(
                       color: Colors.grey[200],
                       borderRadius: BorderRadius.circular(15),
                     ),
                     child: TextFormField(
                       controller: cardExpiryDateController,
                       keyboardType: TextInputType.number,
                       decoration: const InputDecoration(
                         border: InputBorder.none,
                         contentPadding:
                             EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                         hintText: 'MM/YY',
                         hintStyle: TextStyle(
                           color: Colors.grey,
                           fontSize: 16,
                         ),
                         prefixIcon: Icon(
                           Icons.calendar_today,
                           color: Colors.grey,
                         ),
                       ),
                       inputFormatters: [
                         FilteringTextInputFormatter.digitsOnly,
                         LengthLimitingTextInputFormatter(4),
                         CardDateInputFormatter(),
                       ],
                       onChanged: (value) {
                         var text = value.replaceAll(RegExp(r'\s+\b|\b\s'), ' ');
                         setState(() {
                           cardExpiryDateController.value =
                               cardExpiryDateController.value.copyWith(
                                   text: text,
                                   selection: TextSelection.collapsed(
                                       offset: text.length),
                                   composing: TextRange.empty);
                         });
                       },
                     ),
                   ),
                   const SizedBox(width: 14),
                   Container(
                     height: 55,
                     width: MediaQuery.of(context).size.width / 2.4,
                     decoration: BoxDecoration(
                       color: Colors.grey[200],
                       borderRadius: BorderRadius.circular(15),
                     ),
                     child: TextFormField(
                       controller: cardCvvController,
                       keyboardType: TextInputType.number,
                       decoration: const InputDecoration(
                         border: InputBorder.none,
                         contentPadding:
                             EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                         hintText: 'CVV',
                         hintStyle: TextStyle(
                           color: Colors.grey,
                           fontSize: 16,
                         ),
                         prefixIcon: Icon(
                           Icons.lock,
                           color: Colors.grey,
                         ),
                       ),
                       inputFormatters: [
                         FilteringTextInputFormatter.digitsOnly,
                         LengthLimitingTextInputFormatter(3),
                       ],
                       onTap: () {
                         setState(() {
                           Future.delayed(const Duration(milliseconds: 300), () {
                             flipCardController.toggleCard();
                           });
                         });
                       },
                       onChanged: (value) {
                         setState(() {
                           int length = value.length;
                           if (length == 4 || length == 9 || length == 14) {
                             cardNumberController.text = '$value ';
                             cardNumberController.selection =
                                 TextSelection.fromPosition(
                                     TextPosition(offset: value.length + 1));
                           }
                         });
                       },
                     ),
                   ),
                 ],
               ),
               const SizedBox(height: 20 * 3),
               ElevatedButton(
                 style: ElevatedButton.styleFrom(
                   foregroundColor: Colors.black,
                   backgroundColor: Colors.grey,
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(15),
                   ),
                   minimumSize:
                       Size(MediaQuery.of(context).size.width / 1.12, 55),
                 ),
                 onPressed:_validateAndNavigate,
                 child: Text(
                   'Transfer Now'.toUpperCase(),
                   style: const TextStyle(
                     fontSize: 15,
                     fontWeight: FontWeight.w500,
                   ),
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

                    Text("card to UPI",style: TextStyle(color: a,fontWeight: FontWeight.bold,fontSize: 24,overflow: TextOverflow.ellipsis),),
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
  void _validateAndNavigate() {
    if (_isFormValid()) {
      Get.to(cr_trans());
    } else {
      Fluttertoast.showToast(
        msg: "Please fill all the credentials",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    }
  }

  bool _isFormValid() {
    return cardNumberController.text.isNotEmpty &&
        cardHolderNameController.text.isNotEmpty &&
        cardExpiryDateController.text.isNotEmpty &&
        cardCvvController.text.isNotEmpty;
  }

  @override
  void dispose() {
    cardNumberController.dispose();
    cardHolderNameController.dispose();
    cardExpiryDateController.dispose();
    cardCvvController.dispose();
    super.dispose();
  }
}


