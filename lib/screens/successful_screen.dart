import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SuccessfulScreen extends StatefulWidget {
  const SuccessfulScreen({Key? key}) : super(key: key);

  @override
  State<SuccessfulScreen> createState() => _SuccessfulScreenState();
}

class _SuccessfulScreenState extends State<SuccessfulScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text("Your payment was successful, wait for your delivery from 5 to 7 working days",
                textAlign: TextAlign.center,),
              ),
              Icon(Icons.emoji_emotions_outlined),
            ],
          ),
        ),
      ),
    );
  }
}
