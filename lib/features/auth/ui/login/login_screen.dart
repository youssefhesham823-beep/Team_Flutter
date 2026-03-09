import 'package:e_commerce_app/features/auth/auth_cubit.dart';
import 'package:e_commerce_app/features/auth/auth_state.dart';
import 'package:e_commerce_app/features/auth/ui/signup/signup_screen.dart';
import 'package:e_commerce_app/features/auth/widgets/log_button.dart';
import 'package:e_commerce_app/features/auth/widgets/input_field.dart';
import 'package:e_commerce_app/features/auth/widgets/social_button.dart';
import 'package:e_commerce_app/features/home/ui/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  bool isObscure = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen(userName: "")),
            );
          } else if (state is AuthError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },

        child: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Welcome Back!",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF111827),
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "Please enter your details to access your account.",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF6B7280),
                            ),
                          ),
                          const SizedBox(height: 32),

                          const Text(
                            "Email",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 8),
                          InputField(
                            hintText: "name@example.com",
                            prefixIcon: Icon(Icons.email_outlined, size: 20),
                            controller: emailController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Email is required';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),

                          const Text(
                            "Password",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 8),
                          InputField(
                            hintText: "Enter your password",
                            isObscureText: isObscure,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Password is required';
                              }
                              return null;
                            },
                            controller: passwordController,
                            prefixIcon: const Icon(
                              Icons.lock_outline,
                              size: 20,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                isObscure
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                              ),
                              onPressed: () =>
                                  setState(() => isObscure = !isObscure),
                            ),
                          ),

                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Forgot Password?",
                                style: TextStyle(
                                  color: Color(0xFF1A56DB),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          LogButton(
                            buttonText: "Log In",
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                context.read<AuthCubit>().login(
                                  emailController.text,
                                  passwordController.text,
                                );
                              }
                            },
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
                          const SizedBox(height: 24),

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
                          const SizedBox(height: 32),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Don't have an account? ",
                                style: TextStyle(color: Color(0xFF6B7280)),
                              ),
                              GestureDetector(
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BlocProvider(
                                      create: (context) => AuthCubit(),
                                      child: const SignupScreen(),
                                    ),
                                  ),
                                ),
                                child: const Text(
                                  "Sign up",
                                  style: TextStyle(
                                    color: Color(0xFF1A56DB),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
