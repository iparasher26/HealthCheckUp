import 'package:flutter/material.dart';

import '../reusuable_widgets/TestCard.dart';

class CartProvider with ChangeNotifier{

  List<TestInfo> cartItems = [];

  int _count=0;
  int get count => _count;
  // OUTSIDER cannot change values externally

  // _variable : private
  // bool _isTextNotEmpty = false;
  // bool get isTextNotEmpty => _isTextNotEmpty;
  // OUTSIDER cannot change values externally

  // void clearText(){
  //   _isTextNotEmpty=false;
  //   notifyListeners();
  // }

  void addToCart(TestInfo input){
    cartItems.add(input);
    notifyListeners();
  }

  void undoCart(TestInfo input){
    cartItems.remove(input); //clear=> entire list cleared out
    notifyListeners();
  }


}