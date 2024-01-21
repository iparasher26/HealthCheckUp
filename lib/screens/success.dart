import 'package:flutter/material.dart';
import 'package:happyhealth_diagnostics/reusuable_widgets/EnterButton.dart';
import 'package:happyhealth_diagnostics/reusuable_widgets/SuccessfulBooking.dart';

import '../style.dart';

class Success extends StatefulWidget {
  const Success({Key? key}) : super(key: key);

  @override
  State<Success> createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Success", style: AppTextStyle.kTitleTextBlack),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black,size: 25),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: AppColours().kCardLightBlue,size: 40),
            onPressed: () {
              // Handle three-dot menu press
              debugPrint("my cart top-right menu clicked...");
            },
          ),
        ],
        //padding: EdgeInsets.all(16.0),
      ),
      body:  SingleChildScrollView(
        child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50,bottom: 50,left: 20,right: 20),
                child: SuccessfulBooking(h: w*1.15 , w: w),
              ),
              EnterButton(h: 100, w: w, text: 'Back to Home',function: (){Navigator.pushNamed(context, 'home-page');},),
            ],
          ),
      ),
    );
  }
}
