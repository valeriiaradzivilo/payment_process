import 'dart:math';
import 'package:flutter/material.dart';
import 'package:payment_process/screens/failed_payment_screen.dart';
import 'package:payment_process/screens/successful_screen.dart';

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
    balance = Balance(random.nextDouble()*200, random.nextDouble()*200);
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
                  child: Text.rich(
                    TextSpan(

                      children: [
                        const TextSpan(text: "Your balance is : "),
                        TextSpan(text: "${balance.getBalance()}", style: const TextStyle(fontWeight: FontWeight.bold)),
                        const TextSpan(text: " and your credit balance is : "),
                        TextSpan(text: "${balance.getCredit()}", style: const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
              ElevatedButton.icon(onPressed: ()
              {
                bool checkPayment = CustomerOrder(CreditCard()).makePayment(widget.itemPrice, balance);
                StatefulWidget page;
                checkPayment? page = const SuccessfulScreen(): page = const FailedPaymentScreen();
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => page));
              },

                icon:const Icon(Icons.credit_card),
                label: const Text("Pay"),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
