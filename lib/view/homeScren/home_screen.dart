import 'dart:math' as math;
import 'package:flutter/material.dart';

import '../../core/app_colors.dart';
import '../../custom_widget/app_button.dart';
import '../../custom_widget/apptext.dart';
import '../../custom_widget/app_textfield.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController monthController = TextEditingController(
    text: '${_monthName(DateTime.now().month)} ${DateTime.now().year}',
  );

  bool showBalance = true;

  static String _monthName(int month) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];

    return months[month - 1];
  }

  @override
  void dispose() {
    monthController.dispose();
    super.dispose();
  }

  Future<void> selectMonth() async {
    final now = DateTime.now();

    final picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(2020),
      lastDate: DateTime(2035),
      initialDatePickerMode: DatePickerMode.year,
    );

    if (picked != null) {
      setState(() {
        monthController.text = '${_monthName(picked.month)} ${picked.year}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _header(),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),

                    AppTextField(
                      hintText: 'Select Month',
                      controller: monthController,
                      readOnly: true,
                      onTap: selectMonth,
                      prefixIcon: const Icon(Icons.calendar_month_outlined),
                      suffixIcon: const Icon(Icons.keyboard_arrow_down),
                    ),

                    const SizedBox(height: 16),

                    _balanceCard(),

                    const SizedBox(height: 20),

                    _quickActions(),

                     SizedBox(height: 26),

                     AppText(
                      text: 'This Month',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),

                     SizedBox(height: 12),

                    _monthlySummary(),

                     SizedBox(height: 26),

                     AppText(
                      text: 'Expense by Category',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),

                    const SizedBox(height: 16),

                    _expenseChart(),

                    const SizedBox(height: 28),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }

  // Header
  Widget _header() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 38),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primary, AppColors.secondary],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(28)),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 25,
            backgroundColor: Color(0xFFB6A9F6),
            child: AppText(
              text: 'T',
              fontSize: 24,
              colors: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(width: 12),

          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: 'Hello, Mahamudul',
                  fontSize: 18,
                  colors: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 4),
                AppText(
                  text: 'Good Morning 👋',
                  fontSize: 14,
                  colors: Colors.white70,
                ),
              ],
            ),
          ),

          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('No new notifications')),
              );
            },
            icon: const Icon(
              Icons.notifications_none,
              color: Colors.white,
              size: 29,
            ),
          ),
        ],
      ),
    );
  }

  // Balance Card
  Widget _balanceCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF15549A), Color(0xFF07366B)],
        ),
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.16),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(
                child: AppText(
                  text: 'Total Balance',
                  fontSize: 15,
                  colors: Colors.white70,
                ),
              ),

              IconButton(
                onPressed: () {
                  setState(() {
                    showBalance = !showBalance;
                  });
                },
                icon: Icon(
                  showBalance
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: Colors.white,
                ),
              ),
            ],
          ),

          AppText(
            text: showBalance ? '৳ 45,500.00' : '৳ ••••••••',
            fontSize: 30,
            colors: Colors.white,
            fontWeight: FontWeight.bold,
          ),

          const SizedBox(height: 22),

          Row(
            children: [
              Expanded(
                child: _balanceItem(
                  'Income',
                  '৳ 80,000.00',
                  AppColors.income,
                  Icons.arrow_downward,
                ),
              ),

              Container(width: 1, height: 45, color: Colors.white24),

              const SizedBox(width: 18),

              Expanded(
                child: _balanceItem(
                  'Expense',
                  '৳ 34,500.00',
                  AppColors.expense,
                  Icons.arrow_upward,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Income and Expense
  Widget _balanceItem(String title, String amount, Color color, IconData icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(text: title, fontSize: 14, colors: Colors.white70),

        const SizedBox(height: 8),

        Row(
          children: [
            Icon(icon, color: color, size: 19),

            const SizedBox(width: 5),

            Expanded(
              child: FittedBox(
                alignment: Alignment.centerLeft,
                fit: BoxFit.scaleDown,
                child: AppText(
                  text: amount,
                  fontSize: 16,
                  colors: color,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Quick Actions
  Widget _quickActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppButton(text: 'Income', onPressed: () => _showMessage('Add Income')),
        AppButton(
          text: 'Expense',
          onPressed: () => _showMessage('Add Expense'),
        ),
        AppButton(
          text: 'Transfer',
          onPressed: () => _showMessage('Transfer Money'),
        ),
      ],
    );
  }

  // Monthly Summary
  Widget _monthlySummary() {
    return Row(
      children: [
        Expanded(child: _summaryCard('Income', '৳ 80,000', AppColors.income)),

        const SizedBox(width: 10),

        Expanded(child: _summaryCard('Expense', '৳ 34,500', AppColors.expense)),

        const SizedBox(width: 10),

        Expanded(
          child: _summaryCard('Balance', '৳ 45,500', AppColors.transfer),
        ),
      ],
    );
  }

  // Summary Card
  Widget _summaryCard(String title, String amount, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFEDF0F5)),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.03), blurRadius: 8),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            text: title,
            fontSize: 13,
            colors: color,
            fontWeight: FontWeight.w600,
          ),

          const SizedBox(height: 9),

          SizedBox(
            width: double.infinity,
            child: FittedBox(
              alignment: Alignment.centerLeft,
              fit: BoxFit.scaleDown,
              child: AppText(
                text: amount,
                fontSize: 15,
                colors: color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Expense Chart
  Widget _expenseChart() {
    final categories = [
      ('Food', '35%', AppColors.food),
      ('Transport', '20%', AppColors.transfer),
      ('Shopping', '18%', AppColors.shopping),
      ('Bills', '15%', AppColors.bills),
      ('Others', '12%', const Color(0xFF9AA5B1)),
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 135,
            height: 135,
            child: CustomPaint(
              painter: _DonutPainter(),
              child:  Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppText(
                      text: 'Total',
                      fontSize: 12,
                      colors: AppColors.grey,
                    ),

                    SizedBox(height: 4),

                    AppText(
                      text: '৳34.5K',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              children: categories.map((item) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Row(
                    children: [
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: item.$3,
                          shape: BoxShape.circle,
                        ),
                      ),

                      const SizedBox(width: 8),

                      Expanded(
                        child: AppText(
                          text: item.$1,
                          fontSize: 12,
                          tOverflow: TextOverflow.ellipsis,
                        ),
                      ),

                      AppText(
                        text: item.$2,
                        fontSize: 12,
                        colors: AppColors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  void _showMessage(String action) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('$action clicked')));
  }
}

// Donut Chart Painter
class _DonutPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;

    const colors = [
      AppColors.food,
      AppColors.transfer,
      AppColors.shopping,
      AppColors.bills,
      Color(0xFF9AA5B1),
    ];

    const values = [35.0, 20.0, 18.0, 15.0, 12.0];

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 22
      ..strokeCap = StrokeCap.butt;

    double startAngle = -math.pi / 2;

    for (int i = 0; i < values.length; i++) {
      final sweepAngle = values[i] / 100 * 2 * math.pi;

      paint.color = colors[i];

      canvas.drawArc(rect.deflate(13), startAngle, sweepAngle, false, paint);

      startAngle += sweepAngle;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
