import 'package:flutter/material.dart';
import 'package:happyhealth_diagnostics/style.dart';
import 'package:happyhealth_diagnostics/style.dart';
import 'package:provider/provider.dart';
import '../provider/TestCartProvider.dart';

class TestCard extends StatefulWidget {
  TestInfo input;
  TestCard({
    required this.input,
  });

  @override
  State<TestCard> createState() => _TestCardState();
}

class _TestCardState extends State<TestCard> {

  Widget testCardHeading(String testName){
    return Container(
      height: 70,
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
            testName,
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
  Widget healthIcon(){
    return Container(
      width: 55,
      height: 50,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8.0),
        color: AppColours().kCardLightBlue, // Set the color you desire for the shield background
      ),
      child: const Center(
        child: Icon(
          Icons.security,
          color: Colors.white, // Set the color you desire for the shield icon
          size: 30, // Set the size you desire for the shield icon
        ),
      ),
    );
  }

  Widget addToCartButton(CartProvider provider, TestInfo objectInfo ){
      int onTap=1;
      print("add task build");
      return Padding(
        padding: const EdgeInsets.all(2.0),
        child: InkWell(
          onTap: () {
            if(!provider.cartItems.contains(objectInfo))
            {
              //ADD TO CART
              provider.addToCart(objectInfo);
            }
            else
            {
              provider.undoCart(objectInfo);
            }
          },
          child: Consumer<CartProvider>(builder: (context, value, child){
          return Container(
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              //value->provider
              color: value.cartItems.contains(objectInfo) ?
               AppColours().kCardLightBlue :
               AppColours().kCardDarkBlue ,
            ),
            child: Center(
              child: Text(
                value.cartItems.contains(objectInfo) ? "Added to cart" : "Add to cart",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          );
          }
        ),
       ),
      );
  }

  Widget viewDetailsButton(){
    int onTap=0;
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: (){
          onTap=1;

          //setState etc
        },
        child: Container(
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            border: Border.all(
              color: AppColours().kCardDarkBlue,
              width: 1,
            ),
          ),
          child: Center(
            child: Text(
              "View Details",
              style: TextStyle(
                color: AppColours().kCardDarkBlue,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final addToCartProvider=Provider.of<CartProvider>(context,listen: false);
    int tapCount=0;
    return Container(
      height: 380,
      width: 240,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.black45, // Set the border color
          width: 0.5,           // Set the border width
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          testCardHeading(widget.input.testName),//Card-heading
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Includes ${widget.input.numbersOfTests} tests",
                      style: TestCardStyle.kMainHeading,
                    ),
                    const SizedBox(width: 10,),
                    healthIcon(),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  "Get reports in ${widget.input.getReportInHours} hours",
                  style: TestCardStyle.kSubHeading,
                ),
                Row(
                  children: [
                    Text(
                      "₹ ${widget.input.discountedPrice}",
                      style: TestCardStyle.kDiscountedPrice,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      widget.input.mrp.toString(),
                      style: TestCardStyle.kOriginalPriceMRP,
                    ),
                  ],
                ),
                const SizedBox(height: 30,),
                addToCartButton(addToCartProvider,widget.input),
                viewDetailsButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TestInfo{
  final String testName;
  final int numbersOfTests;
  final int getReportInHours;
  final int mrp;
  final int discountedPrice;

  TestInfo({
  required this.testName,
  required this.mrp,
  required this.discountedPrice,
  required this.numbersOfTests,
  required this.getReportInHours,
  });
}
