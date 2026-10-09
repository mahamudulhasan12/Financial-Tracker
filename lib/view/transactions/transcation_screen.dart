import 'package:financial_tracker/custom_widget/app_button.dart';
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
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white, // Background solid white korar jonno
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0, // AppBar-er default shadow remove korbe
          automaticallyImplyLeading: false,
          title: AppText(
            text: "Transactions",
            fontWeight: FontWeight.bold,
            fontSize: 24, // Text-ti arektu premium look dibe
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search_rounded, size: 30, color: Colors.black),
            ),
            const SizedBox(width: 8),
          ],

          // 🚀 ✨ Perfect Styled TabBar Setup
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: Align(
              alignment: Alignment.centerLeft, // Left theke tab list shuru hobe
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                child: TabBar(
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  dividerColor: Colors.transparent,


                  // unselectedLabelColor: const Color(0xFF6B7280),
                  // unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),

                  // Margin & Spacing fixing
                  labelPadding: const EdgeInsets.symmetric(horizontal: 6.0),
                  indicatorPadding: EdgeInsets.zero,

                  tabs: [
                    _buildTabItem("All"),
                    _buildTabItem("Income"),
                    _buildTabItem("Expense"),
                    _buildTabItem("Transfer"),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(text: "Today,05 Oct 2024",fontWeight: FontWeight.bold,fontSize: 14,),
                      AppText(text: "See All",fontWeight: FontWeight.bold,colors: Colors.blue,)
                    ],
                  ),
                  SizedBox(height: 10,),
                  Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 25,
                        child: Icon(Icons.food_bank_outlined),
                      ),
                      title: AppText(text: "Shopping",fontWeight: FontWeight.bold,),
                      subtitle: AppText(text: "Cash",colors: Colors.grey,),
                      trailing: AppText(text: "- ৳ 1500",fontWeight: FontWeight.bold,colors: Colors.redAccent,fontSize: 16,),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 25,
                        child: Icon(Icons.food_bank_outlined),
                      ),
                      title: AppText(text: "Salary",fontWeight: FontWeight.bold,),
                      subtitle: AppText(text: "Bank Account",colors: Colors.grey,),
                      trailing: AppText(text: "- ৳ 50000",fontWeight: FontWeight.bold,colors: Colors.green,fontSize: 16,),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 25,
                        child: Icon(Icons.food_bank_outlined),
                      ),
                      title: AppText(text: "Food",fontWeight: FontWeight.bold,),
                      subtitle: AppText(text: "Cash",colors: Colors.grey,),
                      trailing: AppText(text: "- ৳ 500",fontWeight: FontWeight.bold,colors: Colors.redAccent,fontSize: 16,),
                    ),
                  )
                ],
              ),
            ),
            Center(child: Text("Search Screen Content", style: TextStyle(fontSize: 22))),
            Center(child: Text("Settings Screen Content", style: TextStyle(fontSize: 22))),
            Center(child: Text("Settings Screen Content", style: TextStyle(fontSize: 22))),
          ],
        ),
      ),
    );
  }


  Widget _buildTabItem(String label) {
    return Tab(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xFFF3F4F6),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xFFE5E7EB), width: 1),
        ),
        // Ekhane unique Tab text wrap kora hoyeche
        child: Text(
          label,
          style: const TextStyle(fontSize: 15),
        ),
      ),
    );
  }
}
