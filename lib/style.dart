import 'package:flutter/material.dart';

class AppColours {
  Color kCardBlue = Color(0xff404d97);
  Color kCardDarkBlue = Color(0xff10217D);
  Color kCardLightBlue = Color(0xff16C2D5);

  //Color kAddedToCart = Color();
}

class AppTextStyle {
  static TextStyle kTitleTextBlue = TextStyle(
    fontSize: 40.0,
    fontWeight: FontWeight.w500,
    color: AppColours().kCardDarkBlue, //23812D
    fontFamily: 'Inter',
  );

  static TextStyle kTitleTextBlack = const TextStyle(
    fontSize: 40.0,
    fontWeight: FontWeight.w500,
    color: Colors.black, //23812D
    fontFamily: 'Inter',
  );
}

class TestCardStyle {
  static TextStyle kMainHeading = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w400,
    color: Colors.black, //23812D
    fontFamily: 'Inter',
  );

  static TextStyle kSubHeading = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w300,
    color: Colors.black, //23812D
    fontFamily: 'Inter',
  );

  static TextStyle kOriginalPriceMRP = const TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    color: Colors.black, //23812D
    fontFamily: 'Inter',
    decoration: TextDecoration.lineThrough,
  );

  static TextStyle kDiscountedPrice = const TextStyle(
    fontSize: 25.0,
    fontWeight: FontWeight.w500,
    color: Colors.black, //23812D
    fontFamily: 'Inter',
  );
}

class PopularPackageStyle {
  static TextStyle kBodyText = const TextStyle(
    fontSize: 25.0,
    fontWeight: FontWeight.w400,
    color: Color(0xff6C87AE), //23812D
    fontFamily: 'Poppins',
  );

  static TextStyle kBodyTextUnderline = const TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w400,
    color: Color(0xff6C87AE), //23812D
    fontFamily: 'Poppins',
    decoration: TextDecoration.underline,
  );

  static TextStyle kMRP = TextStyle(
    fontSize: 40.0,
    fontWeight: FontWeight.w600,
    color: AppColours().kCardLightBlue, //23812D
    fontFamily: 'Inter',
  );
}

class MyCartStyle {

  static BoxDecoration kMyCartBoxDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
    border: Border.all(
      color: Colors.black45, // Set the border color
      width: 0.5, // Set the border width
    ),
  );

  static BoxDecoration kScheduleButtonStyle = BoxDecoration(
    color: AppColours().kCardDarkBlue,
    borderRadius: BorderRadius.circular(10),
    border: Border.all(
      color: Colors.black45, // Set the border color
      width: 0.5, // Set the border width
    ),
  );

  static TextStyle kTestTitle =  const TextStyle(
    fontSize: 25,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  static TextStyle kScheduleText =  const TextStyle(
    fontSize: 28,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  static TextStyle kTestTextBlack = const TextStyle(
    fontSize: 30.0,
    fontWeight: FontWeight.w500,
    color: Colors.black, //23812D
    fontFamily: 'Inter',
  );

  static TextStyle kBuyingPrice = TextStyle(
    fontSize: 35.0,
    fontWeight: FontWeight.w600,
    color: AppColours().kCardLightBlue, //23812D
    fontFamily: 'Inter',
  );

  static TextStyle kPreviousPrice = const TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w400,
    color: Color(0xff6C87AE), //23812D
    fontFamily: 'Poppins',
    decoration: TextDecoration.lineThrough,
  );

  static TextStyle kBlueText = TextStyle(
    fontSize: 25.0,
    fontWeight: FontWeight.w500,
    color: AppColours().kCardDarkBlue, //23812D
    fontFamily: 'Inter',
  );
}

class SelectDateCubeStyle{
  static TextStyle kBlueText = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w500,
    color: AppColours().kCardDarkBlue, //23812D
    fontFamily: 'Inter',
  );

}

class TotalBillStyle{

  static TextStyle kLabelTextBlack = const TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w400,
    color: Colors.black54, //23812D
    fontFamily: 'Inter',
  );

  static TextStyle kLabelTextLarge = const TextStyle(
    fontSize: 26.0,
    fontWeight: FontWeight.w400,
    color: Colors.black, //23812D
    fontFamily: 'Inter',
  );

  static TextStyle kBigNumberText= TextStyle(
    fontSize: 40.0,
    fontWeight: FontWeight.w600,
    color: AppColours().kCardDarkBlue, //23812D
    fontFamily: 'Inter',
  );

  static TextStyle kMainTextBlue = TextStyle(
    fontSize: 32.0,
    fontWeight: FontWeight.w600,
    color: AppColours().kCardDarkBlue, //23812D
    fontFamily: 'Inter',
  );

}

class ReportStyle{

  static TextStyle kCheckBoxText = const TextStyle(
    fontSize: 22.0,
    fontWeight: FontWeight.w500,
    color: Colors.black, //23812D
    fontFamily: 'Inter',
  );

  static TextStyle kDescription = const TextStyle(
    fontSize: 22.0,
    fontWeight: FontWeight.w400,
    color: Colors.black45, //23812D
    fontFamily: 'Inter',
  );



}

class SuccessCardStyle{

  static TextStyle kMainText = const TextStyle(
    fontSize: 35,
    fontWeight: FontWeight.w400,
    color: Colors.black, //23812D
    fontFamily: 'Inter',
  );

  static TextStyle kSubHeading = const TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w400,
    color: Colors.black45, //23812D
    fontFamily: 'Inter',
  );

}
