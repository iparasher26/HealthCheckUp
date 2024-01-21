import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../style.dart';

class SuccessfulBooking extends StatefulWidget {
  final double h;
  final double w;
  const SuccessfulBooking({
    required this.h,
    required this.w,
  });

  @override
  State<SuccessfulBooking> createState() => _SuccessfulBookingState();
}

class _SuccessfulBookingState extends State<SuccessfulBooking> {
  
  String _getDate(DateTime dateTime) {
    return DateFormat('DD MMMM, yyyy').format(dateTime);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: MyCartStyle.kMyCartBoxDecoration,
      width: widget.w,
      height: widget.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 100),
            child: Container(
               height: 350.0,
               width: 350.0,
               decoration: const BoxDecoration(
                 image: DecorationImage(
                     image: AssetImage('assets/images/Group 10441.png'),
                     fit: BoxFit.cover,
               ),
             ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:50,left: 50,right: 50),
            child: Container(
              width: 500,
              child: Center(
                child: Text(
                  "Lab tests have been scheduled successfully, You will recieve a mail of the same.",
                  style: SuccessCardStyle.kMainText,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 25),
            child: Container(
              child: Text(
                _getDate(DateTime.now()),
                style: SuccessCardStyle.kSubHeading,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
