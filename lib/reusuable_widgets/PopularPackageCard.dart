import 'package:flutter/material.dart';
import 'package:happyhealth_diagnostics/style.dart';

class PopularPackageCard extends StatefulWidget {
  final double side;
  final String testName;
  final String body;
  final int mrp;
  const PopularPackageCard({super.key,
    required this.side,
    required this.body,
    required this.testName,
    required this.mrp,
  });

  @override
  State<PopularPackageCard> createState() => _PopularPackageCardState();
}

class _PopularPackageCardState extends State<PopularPackageCard> {

  Widget bigIcon(){
    return Container(
      height: 120,
      width: 120,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xffEAF2FD),
      ),
      child: Center(
        child: Icon(
          Icons.local_hospital_sharp,
          color: AppColours().kCardDarkBlue,
          size: 60,
        ),
      ),
    );
  }
  Widget safe(){
    return Container(
      height: 40,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColours().kCardLightBlue,
      ),
      child: const Padding(
        padding: EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.health_and_safety,
              color: Colors.white,
            ),
            SizedBox(width: 10),
            Text(
              "Safe",
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                fontSize: 20,
                color: Colors.white
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget addToCartButton(){
    int onTap=0;
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: (){
          //setState etc
          print("Popular Package add-to-cart button");
        },
        child: Container(
          height: 60,
          width: 240,
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
              "Add to cart",
              style: TextStyle(
                color: AppColours().kCardDarkBlue,
                fontSize: 32,
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
    return Container(
      width: widget.side,
      height: widget.side,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.black45, // Set the border color
          width: 0.75, // Set the border width
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                bigIcon(),
                const Spacer(),
                safe(),
              ],
            ),
            const SizedBox(height: 40,),
            Text(widget.testName, style: AppTextStyle.kTitleTextBlack,),
            const SizedBox(height: 20,),
            Text(widget.body, style: PopularPackageStyle.kBodyText),
            const SizedBox(height: 10),
            Text("View More", style: PopularPackageStyle.kBodyTextUnderline),
            const SizedBox(height: 50),
            Row(
              children: [
                Text("₹${widget.mrp.toString()}/-",style: PopularPackageStyle.kMRP ),
                const Spacer(),
                addToCartButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


