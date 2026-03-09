import 'package:e_commerce_app/features/auth/auth_cubit.dart';
import 'package:e_commerce_app/features/auth/auth_state.dart';
import 'package:e_commerce_app/features/auth/widgets/log_button.dart';
import 'package:e_commerce_app/features/auth/widgets/input_field.dart';
import 'package:e_commerce_app/features/auth/widgets/social_button.dart';
import 'package:e_commerce_app/features/home/ui/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isObscure = true;
  bool isChecked = false;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(userName: nameController.text),
            ),
          );
        } else if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message), backgroundColor: Colors.red),
          );
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: formKey,
          child: SafeArea(
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
                  InputField(
                    hintText: "Enter your full name",
                    controller: nameController,
                    validator: (value) =>
                        value!.isEmpty ? "Name is required" : null,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Email Address",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 8),
                  InputField(
                    hintText: "Enter your email address",
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return "Email is required";
                      if (!value.contains('@')) return "Enter a valid email";
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Create Password",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 8),
                  InputField(
                    controller: passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return "Password is required";
                      final passwordRegex = RegExp(
                        r'^(?=.*[A-Z])(?=.*\d).{6,}$',
                      );

                      if (!passwordRegex.hasMatch(value)) {
                        return "Must be 6+ chars, 1 uppercase, 1 number";
                      }
                      return null;
                    },
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
                  LogButton(
                    buttonText: "Create Account",
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        context.read<AuthCubit>().signup(
                          nameController.text,
                          emailController.text,
                          passwordController.text,
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 24),
                  Center(
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: RichText(
                        text: const TextSpan(
                          text: "Already have an account? ",
                          style: TextStyle(
                            color: Color(0xFF6B7280),
                            fontSize: 14,
                          ),
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
                          style: TextStyle(
                            color: Color(0xFF6B7280),
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Expanded(child: Divider()),
                    ],
                  ),
                  const SizedBox(height: 22),
                  Row(
                    children: [
                      SocialButton(
                        label: "Google",
                        icon: Icons.g_mobiledata,
                        onPressed: () {},
                      ),
                      const SizedBox(width: 12),
                      SocialButton(
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
        ),
      ),
    );
  }
}
