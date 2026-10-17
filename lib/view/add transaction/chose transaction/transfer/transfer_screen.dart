import 'dart:math';

import 'package:financial_tracker/custom_widget/app_textfield.dart';
import 'package:financial_tracker/custom_widget/apptext.dart';
import 'package:flutter/material.dart';

import '../../../../custom_widget/buildCustomDropdown.dart';
import 'package:get/get.dart';

class AddTransferScreen extends StatefulWidget {
  const AddTransferScreen({super.key});

  @override
  State<AddTransferScreen> createState() => _AddTransferScreenState();
}

class _AddTransferScreenState extends State<AddTransferScreen> {
  // Controllers
  final TextEditingController amountController = TextEditingController();
  final TextEditingController dateController = TextEditingController(
    text: "05 Oct 2024",
  );
  final TextEditingController noteController = TextEditingController();

  // Dropdown States
  String selectedCategory = 'Salary';
  final List<String> categories = [
    'Salary',
    'Freelance',
    'Investments',
    'Bonus',
  ];

  String selectedAccount = 'Bank Account';
  final List<String> accounts = [
    'Bank Account',
    'Cash',
    'Card',
    'Mobile Banking',
  ];
  DateTime? selectDate;

  Future<void> pickDate() async {
    final DateTime? pick = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      initialDate: DateTime.now(),
    );
    if (pick != null) {
      setState(() {
        selectDate = pick;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: Icon(
          Icons.arrow_back_ios_new,
          color: Colors.black,
          size: 20,
        ),),
        title: AppText(
          text: "Add Income",
          fontSize: 20,
          fontWeight: FontWeight.bold,
          colors: Colors.black,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Main Input Fields Form
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              children: [
                // 1. Amount Field


                // 2. Category Dropdown Field
                _buildLabel("Category"),
                BuildCustomDropdown(
                  value: selectedCategory,
                  items: categories,
                  prefixIcon: const Icon(
                    Icons.account_balance_wallet_outlined,
                    color: Colors.green,
                  ),
                  onChanged: (value) {
                    setState(() => selectedCategory = value!);
                  },
                ),
                SizedBox(height: 15),

                _buildLabel("Account"),
                BuildCustomDropdown(
                  value: selectedAccount,
                  items: accounts,
                  prefixIcon: const Icon(
                    Icons.account_balance_outlined,
                    color: Colors.indigo,
                  ),
                  onChanged: (value) {
                    setState(() => selectedAccount = value!);
                  },
                ),
                const SizedBox(height: 15),
                _buildLabel("Amount"),
                AppTextField(
                  hintText: "0.00",
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  prefixIcon: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: AppText(
                      text: "৳",
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                // 4. Date Field
                _buildLabel("Date"),
                AppTextField(
                  hintText: "Select Date",
                  controller: dateController,
                  readOnly: true,
                  suffixIcon: IconButton(
                    onPressed: () {
                      pickDate();
                    },
                    icon: Icon(
                      Icons.calendar_today_outlined,
                      color: Colors.indigo,
                    ),
                  ),
                  onTap: () {
                    pickDate();
                  },
                ),
                const SizedBox(height: 15),

                // 5. Note Field
                _buildLabel("Note (Optional)"),
                AppTextField(
                  hintText: "Write a note...",
                  controller: noteController,
                ),
              ],
            ),
          ),

          // 6. Save Button Row Section
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(
                    0xFF0A2558,
                  ), // Deep Blue color input target image layout অনুযায়ী
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  // Save Data Logics
                },
                child: AppText(
                  text: "Save",
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  colors: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper Widget for Text Titles
  Widget _buildLabel(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, top: 4),
      child: AppText(
        text: title,
        fontWeight: FontWeight.w600,
        fontSize: 14,
        colors: Colors.black87,
      ),
    );
  }

// Helper Widget for Custom Dropdowns matching TextField style
}
