import 'dart:math';
import 'package:flutter/material.dart';

import '../classes/balance.dart';
import '../classes/paymentClass.dart';

class CreditPayment extends StatefulWidget {
  const CreditPayment({Key? key, required this.itemPrice}) : super(key: key);
  final double itemPrice;

  @override
  State<CreditPayment> createState() => _CreditPaymentState();
}

class _CreditPaymentState extends State<CreditPayment> {
  Random random = Random();
  late Balance balance;

  @override
  void initState() {
    balance = Balance(random.nextDouble()*200, random.nextDouble()*20);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Your balance is : ${balance.getBalance()} and your credit balance is : ${balance.getCredit()}",
                  textAlign: TextAlign.center,),
                ),
              ElevatedButton.icon(onPressed: ()
              {

                CustomerOrder(CreditCard()).makePayment(widget.itemPrice, balance);
              },

                icon:Icon(Icons.credit_card),
                label: Text("Pay"),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
