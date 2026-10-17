import 'dart:developer';
import 'dart:io';

import 'package:financial_tracker/custom_widget/app_textfield.dart';
import 'package:financial_tracker/custom_widget/apptext.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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
  String? selectAccount;

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
        // Optional: Update the dateController text to reflect the picked date
        dateController.text = "${pick.day} ${_getMonthName(pick.month)} ${pick.year}";
      });
    }
  }

  String _getMonthName(int month) {
    const months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
    return months[month - 1];
  }


  File? pickedImage;
  final ImagePicker _picker = ImagePicker();


  Future<void> selectImageFromGallery() async {
    try {

      final XFile? file = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80, // অপটিমাইজেশনের জন্য সাইজ কমাবে
      );


      if (file != null) {
        setState(() {
          pickedImage = File(file.path);
        });
      }
    } catch (e) {
      debugPrint("Error picking image: $e");
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
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 20),
        ),
        title: const AppText(
          text: "Add Expense",
          fontSize: 20,
          fontWeight: FontWeight.bold,
          colors: Colors.black,
        ),
        centerTitle: true,
      ),
      // Clean SingleChildScrollView layout without clashing constraints
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              const SizedBox(height: 15),

              // 2. Category Dropdown Field
              _buildLabel("Category"),
              DropdownButtonFormField<String>(
                value: selectCategory,
                style: const TextStyle(color: Colors.black, fontSize: 16),
                dropdownColor: Colors.deepPurple[50],
                decoration: const InputDecoration(
                  labelText: 'Select Type',
                  border: OutlineInputBorder(),
                ),
                hint: const Text('Choose an option'),
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
              const SizedBox(height: 15),

              // 3. Account Dropdown Field
              _buildLabel("Account"),
              DropdownButtonFormField<String>(
                value: selectAccount,
                style: const TextStyle(color: Colors.black, fontSize: 16),
                dropdownColor: Colors.deepPurple[50],
                decoration: const InputDecoration(
                  labelText: 'Select Type',
                  border: OutlineInputBorder(),
                ),
                hint: const Text('Choose an option'),
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
              const SizedBox(height: 15),

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
                  icon: const Icon(
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
              const SizedBox(height: 20),

              // Image Attachment Box
              GestureDetector(
                onTap: (){
                  selectImageFromGallery();
                },
                child: Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Center(
                    child: Icon(Icons.image,size: 40,),
                  ),
                ),
              ),
              const SizedBox(height: 25),

              // 6. Save Button Section
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0A2558),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {
                    // Save Data Logics
                  },
                  child: const AppText(
                    text: "Save",
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    colors: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
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
        colors: Colors.black, // Fixed spelling typo here from blac
      ),
    );
  }
}
