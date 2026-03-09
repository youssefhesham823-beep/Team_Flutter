import 'package:e_commerce_app/features/auth/widgets/AppTextButton.dart';
import 'package:e_commerce_app/features/auth/widgets/AppTextFormField.dart';
import 'package:e_commerce_app/features/auth/widgets/SocialLoginButton.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isObscure = true;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              const Text(
                "Create Account",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 8),
              const Text(
                "Join us for exclusive access to the latest trends.",
                style: TextStyle(color: Color(0xFF6B7280)),
              ),
              const SizedBox(height: 32),
              const Text(
                "Full Name",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              const AppTextFormField(hintText: "Enter your full name"),
              const SizedBox(height: 20),
              const Text(
                "Email Address",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              const AppTextFormField(hintText: "Enter your email address"),
              const SizedBox(height: 20),
              const Text(
                "Create Password",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              AppTextFormField(
                hintText: "Create a password",
                isObscureText: isObscure,
                suffixIcon: IconButton(
                  icon: Icon(
                    isObscure
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                  ),
                  onPressed: () => setState(() => isObscure = !isObscure),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  SizedBox(
                    height: 24,
                    width: 24,
                    child: Checkbox(
                      value: isChecked,
                      shape: const CircleBorder(),
                      onChanged: (val) => setState(() => isChecked = val!),
                    ),
                  ),
                  const Text(
                    " I agree to the ",
                    style: TextStyle(fontSize: 12),
                  ),
                  const Text(
                    "Terms & Conditions",
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF1A56DB),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              AppTextButton(buttonText: "Create Account", onPressed: () {}),
              const SizedBox(height: 24),
              Center(
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: RichText(
                    text: const TextSpan(
                      text: "Already have an account? ",
                      style: TextStyle(color: Color(0xFF6B7280), fontSize: 14),
                      children: [
                        TextSpan(
                          text: "Log In",
                          style: TextStyle(
                            color: Color(0xFF1A56DB),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Row(
                children: [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "Or continue with",
                      style: TextStyle(color: Color(0xFF6B7280), fontSize: 12),
                    ),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              const SizedBox(height: 22),
              Row(
                children: [
                  SocialLoginButton(
                    label: "Google",
                    icon: Icons.g_mobiledata,
                    onPressed: () {},
                  ),
                  const SizedBox(width: 12),
                  SocialLoginButton(
                    label: "Apple",
                    icon: Icons.apple,
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 40),
              const Center(
                child: Text(
                  "© 2024 FashionCo. All rights reserved.",
                  style: TextStyle(fontSize: 10, color: Color(0xFF9CA3AF)),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
