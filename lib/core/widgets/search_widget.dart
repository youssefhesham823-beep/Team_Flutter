import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchWidget extends StatelessWidget {
  final Function(String)? onChanged;

  const SearchWidget({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: "Search products...",
          hintStyle: TextStyle(fontSize: 14.sp),
          prefixIcon: Icon(Icons.search, size: 20.sp),
          filled: true,
          fillColor: Colors.grey.shade200,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}