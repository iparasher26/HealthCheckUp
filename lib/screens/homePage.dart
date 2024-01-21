import 'package:flutter/material.dart';
import 'package:happyhealth_diagnostics/reusuable_widgets/PopularPackageCard.dart';
import 'package:happyhealth_diagnostics/reusuable_widgets/TestCard.dart';
import 'package:happyhealth_diagnostics/style.dart';
import '../provider/TestCartProvider.dart';
import 'package:provider/provider.dart';

class LabTestHomePage extends StatefulWidget {
  const LabTestHomePage({Key? key}) : super(key: key);

  @override
  State<LabTestHomePage> createState() => _LabTestHomePageState();
}

class _LabTestHomePageState extends State<LabTestHomePage> {

  List<TestInfo> testInfoCardItems = [
    TestInfo(
        testName: "Thyroid Profile",
        mrp: 1000,
        discountedPrice: 800,
        numbersOfTests: 4,
        getReportInHours: 24
    ),
    TestInfo(
        testName: "Iron Study Test",
        mrp: 1200,
        discountedPrice: 900,
        numbersOfTests: 4,
        getReportInHours: 24
    ),
    TestInfo(
        testName: "Thyroid Profile",
        mrp: 1000,
        discountedPrice: 800,
        numbersOfTests: 4,
        getReportInHours: 24
    ),
    TestInfo(
        testName: "Iron Study Test",
        mrp: 1200,
        discountedPrice: 900,
        numbersOfTests: 4,
        getReportInHours: 24
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    debugPrint("height : $h , width: $w");

    final addToCartProvider=Provider.of<CartProvider>(context,listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text("Logo", style: AppTextStyle.kTitleTextBlack),
        centerTitle: true,
        actions: [
          //Spacer(),
        Consumer<CartProvider>(builder: (context, value, child){
        return
           value.cartItems.isNotEmpty ?
           Container(
            height: 25,
            width: 25,
            decoration: BoxDecoration(
              color: AppColours().kCardLightBlue,
              borderRadius: BorderRadius.circular(30),
            ),
            child:
                Center(child: Text(value.cartItems.length.toString(), style: TextStyle(fontSize: 18))),
          ) :
           Container();
         },
        ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, 'my-cart');
              },
              icon: Icon(
                Icons.shopping_cart_rounded,
                size: 40,
                color: AppColours().kCardDarkBlue,
              ),
            ),
          ),
        ],

      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular lab tests",
                      style: AppTextStyle.kTitleTextBlue,
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, 'my-cart');
                      },
                      child: Text(
                        "View More",
                        style: TextStyle(
                          fontSize: 25,
                          color: AppColours().kCardDarkBlue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Icon(Icons.arrow_forward,
                        color: AppColours().kCardDarkBlue),
                  ],
                ), // Heading & View More  // POPULAR TESTS
                SizedBox(
                  height: h*0.77,
                  child: GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    childAspectRatio: 240/320,
                    crossAxisCount: 2,
                    children: [
                      TestCard(input: testInfoCardItems[0]),
                      TestCard(input: testInfoCardItems[1]),
                      TestCard(input: testInfoCardItems[2]),
                      TestCard(input: testInfoCardItems[3]),
                    ],
                  ),
                ),
                const SizedBox(height: 20), // List of Tests
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Popular Packages",
                        style: AppTextStyle.kTitleTextBlue),
                  ],
                ), // POPULAR PACKAGES
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: PopularPackageCard(
                    testName: "Full Body Checkup",
                    mrp: 2000,
                    body:
                    'Includes 92 tests'
                        '\n\t\t• Blood Glucose Fasting'
                        '\n\t\t• Liver Function Test',
                    side: 600,
                  ),
                ),  // POPULAR PACKAGES
              ],
            ),
          ),
        ),
      ),
    );
  }
}
