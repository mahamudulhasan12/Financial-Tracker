
import 'package:financial_tracker/view/more%20transaction/chose%20transaction/income/add_income_screen.dart';
import 'package:financial_tracker/view/more%20transaction/widget/transaction_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddExpenseScreen extends StatelessWidget {
  const AddExpenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery
          .of(context)
          .size
          .height * 0.45,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Bottom Sheet Handle
          Center(
            child: Container(
              height: 5,
              width: 45,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),

          const SizedBox(height: 25),

          const Text(
            'Add Transaction',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xff064D82),
            ),
          ),

          const SizedBox(height: 6),

          const Text(
            'Choose a transaction type',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 25),

          Row(
            children: [
              // Income Button
              Expanded(
                child: transactionButton(
                  icon: Icons.trending_up,
                  title: 'Income',
                  color: Colors.green,
                  background: const Color(0xffE8F7ED),
                  onTap: () {
                    Get.to(AddIncomeScreen());
                  },
                ),
              ),

              const SizedBox(width: 10),

              // Expense Button
              Expanded(
                child: transactionButton(
                  icon: Icons.trending_down,
                  title: 'Expense',
                  color: Colors.red,
                  background: const Color(0xffFDECEC),
                  onTap: () {
                    // Navigator.pop(context);
                    // এখানে Expense Screen খুলবে
                  },
                ),
              ),

              const SizedBox(width: 10),

              // Transfer Button
              Expanded(
                child: transactionButton(
                  icon: Icons.swap_horiz,
                  title: 'Transfer',
                  color: const Color(0xff064D82),
                  background: const Color(0xffE7F0FA),
                  onTap: () {
                    // Navigator.pop(context);
                    // এখানে Transfer Screen খুলবে
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

}
