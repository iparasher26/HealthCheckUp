import 'package:flutter/material.dart';

import '../style.dart';

class TotalBill extends StatefulWidget {
  final double h;
  final double w;
  final int totalMRP;
  final int discount;
  final int  toBePaid;
  final int  totalSavings;

  const TotalBill({
    required this.h,
    required this.w,
    required this.discount,
    required this.toBePaid,
    required this.totalMRP,
    required this.totalSavings,
});

  @override
  State<TotalBill> createState() => _TotalBillState();
}

class _TotalBillState extends State<TotalBill> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        decoration: MyCartStyle.kMyCartBoxDecoration,
        width: widget.w,
        height: widget.h,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(50, 30, 50, 20),
          child: Column(
            children: [
              //MRP TOTAL
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("M.R.P Total",style: TotalBillStyle.kLabelTextBlack,),
                  Text(widget.totalMRP.toString(), style: TotalBillStyle.kLabelTextBlack,),
                ],
              ),
              //DISCOUNT
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Discount", style: TotalBillStyle.kLabelTextBlack,),
                  Text(widget.discount.toString(), style: TotalBillStyle.kLabelTextBlack,),
                ],
              ),
              //TO-BE PAID
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 45),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Amount to be paid",style: TotalBillStyle.kMainTextBlue,),
                    Text("₹${widget.toBePaid.toInt().toString()}/-", style: TotalBillStyle.kBigNumberText,),
                  ],
                ),
              ),
              //TOTAL SAVINGS
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Total Savings",style: TotalBillStyle.kLabelTextLarge,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text("₹${widget.totalSavings.toInt().toString()}/-",style: TotalBillStyle.kBigNumberText,),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


