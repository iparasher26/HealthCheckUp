import 'package:flutter/material.dart';
import 'package:happyhealth_diagnostics/provider/TestCartProvider.dart';
import 'package:happyhealth_diagnostics/reusuable_widgets/AddToCartTest.dart';
import 'package:happyhealth_diagnostics/reusuable_widgets/EnterButton.dart';
import 'package:happyhealth_diagnostics/reusuable_widgets/SelectDateCube.dart';
import 'package:happyhealth_diagnostics/reusuable_widgets/TestCard.dart';
import 'package:happyhealth_diagnostics/reusuable_widgets/TotalBill.dart';
import 'package:happyhealth_diagnostics/style.dart';
import 'package:provider/provider.dart';

String displayDate='date';

class MyCart extends StatefulWidget {
  const MyCart({Key? key}) : super(key: key);

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {

  addMRP(List<TestInfo> list){
    int result = 0;
    for(TestInfo a in list){
      result+=a.mrp;
    }
    return result;
  }

  addDiscount(List<TestInfo> list){
    int result = 0;
    for(TestInfo a in list){
      result+=a.mrp-a.discountedPrice;
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("My Cart", style: AppTextStyle.kTitleTextBlack),
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text("Order Review", style: AppTextStyle.kTitleTextBlue,),
              ),  //order review
              Consumer<CartProvider>(builder: (context, value, child){
                List<TestInfo> testCardItems = value.cartItems;
                return
                  Container(
                  height: 400.0*testCardItems.length,
                  width: w, //not required, vertical movement
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: testCardItems.length,
                    itemBuilder: (BuildContext context, int index){
                      return AddTestToCart(
                          object: testCardItems[index],
                          h: 390,
                          w: w,
                          testName: testCardItems[index].testName,
                          buyingPrice: testCardItems[index].discountedPrice,
                          previousPrice: testCardItems[index].mrp
                      );
                    },
                  ),
                );
              }),
              SelectDateCube(w: w, h: 100,),
              Consumer<CartProvider>(builder: (context, value, child) {
                return TotalBill(
                    h: 290,
                    w: w,
                    discount: addDiscount(value.cartItems),
                    toBePaid: addMRP(value.cartItems)-addDiscount(value.cartItems),
                    totalMRP: addMRP(value.cartItems),
                    totalSavings: addDiscount(value.cartItems),
                );
              }),
              reportHardCopy(250,w),
              EnterButton(
                h: 100,
                w: w,
                text: 'Schedule',
                function: (){
                  Navigator.pushNamed(context, 'success');
                  },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget reportHardCopy(double h, double w){
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Container(
      decoration: MyCartStyle.kMyCartBoxDecoration,
      width: w,
      height: h,
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            //checkbox text
            Row(
              children: [
                CircularCheckBox(),
                Text(
                  "Hard copy of reports",
                  style: ReportStyle.kCheckBoxText,
                ),
              ],
            ),
            //description
            Padding(
              padding: const EdgeInsets.fromLTRB(42, 0, 20, 0),
              child: Text(
                "Reports will be delivered within 3-4 working days. Hard copy charges are non-refundable once the reports have been dispatched.",
                style: ReportStyle.kDescription,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(42, 20, 20, 10),
              child: Text(
                "₹150 per person",
                style: ReportStyle.kDescription,
              ),
            ),
          ], //description
        ),
      ),
    ),
  );
}

class CircularCheckBox extends StatefulWidget {
  @override
  _CircularCheckBoxState createState() => _CircularCheckBoxState();
}

class _CircularCheckBoxState extends State<CircularCheckBox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value ?? false;
        });
      },
      shape: CircleBorder(),
      activeColor: Colors.blue,
    );
  }
}


