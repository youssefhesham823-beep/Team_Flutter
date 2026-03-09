import 'package:e_commerce_app/features/auth/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    try {
      final prefs = await SharedPreferences.getInstance();
      String? savedEmail = prefs.getString('user_email');
      String? savedPassword = prefs.getString('user_password');
      if (savedEmail != null &&
          savedEmail == email &&
          savedPassword == password) {
        await prefs.setBool('is_logged_in', true);
        emit(AuthSuccess());
      } else {
        emit(AuthError("Wrong Email or Password!"));
      }
    } catch (e) {
      emit(AuthError("Somthing Went Wrong : ${e.toString()}"));
    }
  }

  Future<void> signup(String name, String email, String password) async {
    emit(AuthLoading());

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('user_name', name);
      await prefs.setString('user_email', email);
      await prefs.setString('user_password', password);
      await prefs.setBool('is_logged_in', true);

      emit(AuthSuccess());
    } catch (e) {
      emit(AuthError("Somthing Went Wrong : ${e.toString()}"));
    }
  }
}
