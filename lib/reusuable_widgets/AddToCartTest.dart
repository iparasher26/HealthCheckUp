import 'package:flutter/material.dart';
import '../provider/TestCartProvider.dart';
import '../style.dart';
import 'package:provider/provider.dart';

import 'TestCard.dart';

class AddTestToCart extends StatefulWidget {
  final TestInfo object;
  final double h;
  final double w;
  final String testName;
  final int buyingPrice;
  final int previousPrice;
  const AddTestToCart({
    required this.h,
    required this.w,
    required this.testName,
    required this.buyingPrice,
    required this.previousPrice,
    required this.object,
});

  @override
  State<AddTestToCart> createState() => _AddTestToCartState();
}

class _AddTestToCartState extends State<AddTestToCart> {

  Widget testHeading(double height){
    return Container(
      height: height,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColours().kCardBlue,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Pathology Tests',
            style: MyCartStyle.kTestTitle,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider=Provider.of<CartProvider>(context,listen: false);
    return Container(
      height: widget.h,
      width: widget.w,
      margin: const EdgeInsets.all(20),
      decoration: MyCartStyle.kMyCartBoxDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          testHeading(60),//Card-heading
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${widget.testName} Profile",
                      style: MyCartStyle.kTestTextBlack,
                    ),
                    const SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("₹ ${widget.buyingPrice.toString()}/-", style: MyCartStyle.kBuyingPrice,),
                        Text(widget.previousPrice.toString(), style: MyCartStyle.kPreviousPrice,),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: (){
                    provider.undoCart(widget.object);
                  },
                  child: OvalButton(
                      icon: Icons.delete,
                      buttonText: "Remove"
                  ),
                ),
                const OvalButton(
                    icon: Icons.upload_rounded,
                    buttonText: "Upload Prescription (optional)"
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OvalButton extends StatelessWidget {
  //final double w;
  final IconData icon;
  final String buttonText;
  const OvalButton({
    //required this.w,
    required this.icon,
    required this.buttonText,
});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Container(
        //width: w,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
          border: Border.all(
            color: AppColours().kCardDarkBlue,
            width: 3.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5, 8, 5, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: (){
                    debugPrint("clicked iconButton of MyCart");
                  },
                  icon: Icon(icon, color: AppColours().kCardDarkBlue, size: 40,),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Text(buttonText, style: MyCartStyle.kBlueText,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



