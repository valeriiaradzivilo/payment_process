import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FailedPaymentScreen extends StatefulWidget {
  const FailedPaymentScreen({Key? key}) : super(key: key);

  @override
  State<FailedPaymentScreen> createState() => _FailedPaymentScreenState();
}

class _FailedPaymentScreenState extends State<FailedPaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text("There was a mistake while processing your card, try another one",
                  textAlign: TextAlign.center,),
              ),
              Icon(Icons.error_outline),
            ],
          ),
        ),
      ),
    );
  }
}
