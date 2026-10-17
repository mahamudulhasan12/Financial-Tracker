import 'package:financial_tracker/custom_widget/app_textfield.dart';
import 'package:financial_tracker/custom_widget/apptext.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../custom_widget/buildCustomDropdown.dart';
import 'package:get/get.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  // Controllers
  final TextEditingController amountController = TextEditingController();
  final TextEditingController dateController = TextEditingController(
    text: "05 Oct 2024",
  );
  final TextEditingController noteController = TextEditingController();
  String? selectCategory;
  String ? selectAccount;
  // Dropdown States
  String selectedCategory = 'Salary';
  final List<String> categories = [
    'Salary',
    'Freelance',
    'Investments',
    'Bonus',
  ];

  String selectedAccount = 'Bank Account';
  final List mainCategories = [
    '🏠 Housing & Utilities',
    '🍔 Food & Groceries',
    '🚌 Transportation',
    '🏥 Health & Medical',
    '🎓 Education',
    '🛍️ Shopping & Lifestyle',
    '💳 Bills & Recharge',
    '🎁 Entertainment & Others'
  ];
  final List accounts = [
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
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 20),
        ),
        title: AppText(
          text: "Add Expense",
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
                SizedBox(height: 15),
                // 2. Category Dropdown Field
                _buildLabel("Category"),
                DropdownButtonFormField<String>(
                  value: selectCategory,
                  style: const TextStyle(color: Colors.black, fontSize: 16), // টেক্সট স্টাইল
                  dropdownColor: Colors.deepPurple[50],
                  decoration: InputDecoration(
                    labelText: 'Select Type',
                    border: OutlineInputBorder(),
                  ),
                  hint: Text('Choose an option'),
                  items: mainCategories.map((item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectCategory = value;
                    });
                  },
                ),
                SizedBox(height: 15),
                _buildLabel("Account"),
                DropdownButtonFormField<String>(
                  value: selectAccount,
                  style: const TextStyle(color: Colors.black, fontSize: 16), // টেক্সট স্টাইল
                  dropdownColor: Colors.deepPurple[50],
                  decoration: InputDecoration(
                    labelText: 'Select Type',
                    border: OutlineInputBorder(),
                  ),
                  hint: Text('Choose an option'),
                  items: accounts.map((item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectAccount = value;
                    });
                  },
                ),
                SizedBox(height: 15),
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
                SizedBox(height: 15),
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
                  backgroundColor: Color(0xFF0A2558),
                  // Deep Blue color input target image layout অনুযায়ী
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
          Container(
            height: 100,
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey),
            ),
            padding: EdgeInsets.all(10),
            child:ImagePicker(

            ),
          )
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
}
