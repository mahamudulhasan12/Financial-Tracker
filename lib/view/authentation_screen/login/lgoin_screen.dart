import 'package:financial_tracker/custom_widget/app_textfield.dart';
import 'package:financial_tracker/view/authentation_screen/registation/registation_screen.dart';
import 'package:financial_tracker/view/homeScren/home_screen.dart';
import 'package:flutter/material.dart';
import '../../../custom_widget/apptext.dart';
import 'package:get/get.dart';

import '../../BottonNavigation Screen/button_navigation_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          children: [

            // Back Button
            const SizedBox(height: 10),

            // Align(
            //   alignment: Alignment.centerLeft,
            //   child: IconButton(
            //     onPressed: () {},
            //     icon: const Icon(
            //       Icons.arrow_back_ios_new,
            //       size: 21,
            //       color: Colors.black,
            //     ),
            //   ),
            // ),

            SizedBox(height: size.height * 0.06),

            // Logo
            Center(
              child: Image.asset(
                'assets/logo/unnamed.png',
                height: 90,
                width: 90,
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(height: 18),

            // Title
            const AppText(
              text: 'Welcome Back',
              fontSize: 25,
              fontWeight: FontWeight.bold,
              colors: Color(0xff111827),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 7),

            // Subtitle
            const AppText(
              text: 'Login to continue to your account',
              fontSize: 14,
              colors: Color(0xff718096),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: size.height * 0.07),

            // Phone Number
            AppTextField(
              controller: phoneController,
              hintText: '01XXXXXXXXX',
              keyboardType: TextInputType.phone,
              prefixIcon: const Icon(
                Icons.phone_android_outlined,
                color: Color(0xff718096),
              ),
            ),

            const SizedBox(height: 20),

            // Password
            AppTextField(
              controller: passwordController,
              hintText: 'Enter your password',
              obscureText: true,
              prefixIcon: const Icon(
                Icons.lock_outline,
                color: Color(0xff718096),
              ),
              suffixIcon: const Icon(
                Icons.visibility_outlined,
                color: Color(0xff718096),
              ),
            ),

            const SizedBox(height: 13),

            // Forgot Password
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {},
                child:  AppText(
                  text: 'Forgot Password?',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  colors: Color(0xff064D82),
                ),
              ),
            ),

            const SizedBox(height: 28),

            // Login Button
            SizedBox(
              height: 53,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(NavigatonScreen());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff064D82),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13),
                  ),
                ),
                child: const AppText(
                  text: 'Login',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  colors: Colors.white,
                ),
              ),
            ),

            SizedBox(height: size.height * 0.18),

            // Create Account
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const AppText(
                  text: "Don't have an account? ",
                  fontSize: 14,
                  colors: Color(0xff718096),
                ),

                GestureDetector(
                  onTap: () {
                    Get.to(RegisterScreen());
                  },
                  child: const AppText(
                    text: 'Create Account',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    colors: Color(0xff064D82),
                  ),
                ),
              ],
            ),

             SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
