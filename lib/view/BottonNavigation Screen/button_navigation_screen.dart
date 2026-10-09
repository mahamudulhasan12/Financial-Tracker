import 'package:flutter/material.dart';
import 'package:financial_tracker/view/Reports/reorts_screen.dart';
import 'package:financial_tracker/view/addExpense/add_expense_screen.dart';
import 'package:financial_tracker/view/more/more_screen.dart';
import 'package:financial_tracker/view/transactions/transcation_screen.dart';
// ইম্পোর্ট পাথটি অন্যান্য স্ক্রিনের মতো প্যাকেজ আকারে বা সঠিক রিলেটিভ পাথে পরিবর্তন করা হয়েছে
import 'package:financial_tracker/view/homeScren/home_screen.dart';

class NavigatonScreen extends StatefulWidget {
  const NavigatonScreen({super.key});

  @override
  State<NavigatonScreen> createState() => _NavigatonScreenState();
}

class _NavigatonScreenState extends State<NavigatonScreen> {
  int selectedIndex = 0;

  final List<Widget> screens = [
    const HomeScreen(),
    const TranscationScreen(),
    const AddExpenseScreen(),
    const ReortsScreen(),
    const MoreScreen(),
  ];

  static const Color primaryColor = Color(0xff064D82);
  static const Color unselectedColor = Color(0xff8A94A6);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FA),
      body: IndexedStack(
        index: selectedIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: primaryColor,
        unselectedItemColor: unselectedColor,
        showUnselectedLabels: false,
        selectedLabelStyle: const TextStyle(fontSize: 11, fontWeight: FontWeight.w700),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long_outlined),
            activeIcon: Icon(Icons.receipt_long_rounded),
            label: 'Transactions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline_rounded),
            activeIcon: Icon(Icons.add_circle_rounded),
            label: 'Add Expense',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_rounded),
            activeIcon: Icon(Icons.bar_chart_rounded),
            label: 'Reports',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz_rounded),
            activeIcon: Icon(Icons.more_horiz_rounded),
            label: 'More',
          ),
        ],
      ),
    );
  }
}
