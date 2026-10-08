import 'package:financial_tracker/custom_widget/app_textfield.dart';
import 'package:financial_tracker/view/authentation_screen/login/lgoin_screen.dart';
import 'package:flutter/material.dart';

import '../../../custom_widget/app_button.dart';
import '../../../custom_widget/apptext.dart';

import 'package:get/get.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  bool obscurePassword = true;

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,

      body: ListView(
        // physics: ScrollPhysics(),
        // shrinkWrap: true,
        padding: EdgeInsets.all(12),
        children: [
          // Back Button
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: () {
                // Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                size: 22,
              ),
            ),
          ),

          SizedBox(height: size.height * 0.035),

          // Logo
          Image.asset(
            'assets/logo/unnamed.png',
            height: 90,
            width: 90,
            fit: BoxFit.contain,
          ),

           SizedBox(height: 15),

          // Title
           Center(
             child: AppText(
              text: 'Expense Tracker',
              fontSize: 25,
              fontWeight: FontWeight.bold,
              colors: Color(0xff111827),
                           ),
           ),

          const SizedBox(height: 5),

          // Subtitle
          Center(
            child: const AppText(
              text: 'Create your account to get started',
              fontSize: 15,
              colors: Color(0xff718096),
            ),
          ),

          SizedBox(height: size.height * 0.06),

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

          const SizedBox(height: 22),

          // Password
          AppTextField(
            controller: passwordController,
            hintText: 'Create a password',
            obscureText: obscurePassword,
            prefixIcon: const Icon(
              Icons.lock_outline,
              color: Color(0xff718096),
            ),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  obscurePassword = !obscurePassword;
                });
              },
              icon: Icon(
                obscurePassword
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: const Color(0xff718096),
              ),
            ),
          ),

          const SizedBox(height: 28),

          // Create Account Button
          SizedBox(
            width: double.infinity,
            height: 53,
            child: AppButton(onPressed: () {

            }, text: 'Create Account',),
          ),

          // const Spacer(),

          // Login Text
          SizedBox(height: 200,),
          Padding(
            padding: const EdgeInsets.only(bottom: 35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const AppText(
                  text: 'Already have an account? ',
                  fontSize: 14,
                  colors: Color(0xff718096),
                ),

                GestureDetector(
                  onTap: () {
                    Get.to(LoginScreen());
                  },
                  child: const AppText(
                    text: 'Login',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    colors: Color(0xff064D82),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


