import 'package:financial_tracker/custom_widget/apptext.dart';
import 'package:flutter/material.dart';

class TranscationScreen extends StatefulWidget {
  const TranscationScreen({super.key});

  @override
  State<TranscationScreen> createState() => _TranscationScreenState();
}

class _TranscationScreenState extends State<TranscationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AppText(text: "Transcations",fontSize: 15,fontWeight: FontWeight.bold,),
      ),
    );
  }
}
