import 'package:financial_tracker/custom_widget/apptext.dart';
import 'package:flutter/material.dart';


class TransferScreen extends StatefulWidget {
  const TransferScreen({super.key});

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(text: "Transfer",fontWeight: FontWeight.bold,),
      ),
    );
  }
}
