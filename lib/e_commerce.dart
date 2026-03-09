import 'package:e_commerce_app/features/auth/ui/login/login_screen.dart';
import 'package:e_commerce_app/features/cart/cubit/cart_cubit.dart';
import 'package:e_commerce_app/features/favorites/ui/cubit/favorites_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ECommerce extends StatelessWidget {
  const ECommerce({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => FavoritesCubit()),
            BlocProvider(create: (_) => CartCubit()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: const LoginScreen(),
          ),
        );
      },
    );
  }
}