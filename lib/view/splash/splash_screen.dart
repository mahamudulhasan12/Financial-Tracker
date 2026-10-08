import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2),()=>Get.off(()=>HomeScreen()));
     
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xff07366B),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              // Background design
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: size.height * 0.35,
                  decoration: const BoxDecoration(
                    color: Color(0xff0A3D78),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(100),
                      bottomRight: Radius.circular(120),
                    ),
                  ),
                ),
              ),

              Positioned(
                bottom: -80,
                left: -80,
                child: Container(
                  width: 220,
                  height: 220,
                  decoration: BoxDecoration(
                    color: const Color(0xff124A87),
                    borderRadius: BorderRadius.circular(150),
                  ),
                ),
              ),

              Positioned(
                bottom: -100,
                right: -80,
                child: Container(
                  width: 260,
                  height: 260,
                  decoration: BoxDecoration(
                    color: const Color(0xff0B427D),
                    borderRadius: BorderRadius.circular(150),
                  ),
                ),
              ),

              // Main Content
              Column(
                children: [
                  const Spacer(flex: 3),

                  // Wallet Image
                  Center(
                    child: Container(
                      width: 150,
                      height: 150,
                      padding: const EdgeInsets.all(10),
                      child: Image.asset(
                        'assets/logo/unnamed.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Title
                  Center(
                    child: const Text(
                      'Expense Tracker',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Subtitle
                  Center(
                    child: const Text(
                      'Track today, build a\nbetter tomorrow',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 15,
                        height: 1.4,
                      ),
                    ),
                  ),

                  const Spacer(flex: 4),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}