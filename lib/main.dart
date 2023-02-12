import 'dart:math';

import 'package:flutter/material.dart';
import 'package:payment_process/classes/paymentClass.dart';
import 'package:payment_process/screens/credit_payment_screen.dart';

import 'classes/balance.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Payment',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Payment method'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late double itemPrice;
  Random random = Random();


  @override
  void initState() {
    itemPrice = random.nextDouble()*200;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("It's time to pay for your purchase"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("TOTAL: $itemPrice"),
            ),
            ElevatedButton.icon(onPressed: ()
        {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const CreditPayment()));
        },
              
          icon:Icon(Icons.credit_card),
              label: Text("Credit Card"),
      ),

          ],
        ),
      ),
          );
  }
}
