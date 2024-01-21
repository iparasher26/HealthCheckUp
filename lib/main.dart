import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:happyhealth_diagnostics/provider/TestCartProvider.dart';
import 'package:happyhealth_diagnostics/screens/homePage.dart';
import 'package:happyhealth_diagnostics/screens/myCart.dart';
import 'package:happyhealth_diagnostics/screens/success.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  MultiProvider build(BuildContext context) {

    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_)=> CartProvider()),
        ],
    child:  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
        home: LabTestHomePage(),
      routes: {
        'home-page': (context) => LabTestHomePage(),
        'my-cart': (context) => MyCart(),
        'success': (context) => Success(),
      },
     ),
    );
  }
}

//MyCart(),
//LabTestHomePage(),