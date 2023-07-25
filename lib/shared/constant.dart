import 'package:flutter/material.dart';

class AppColors {
  static const Color themeColor = Color(0xfffcd25d);
}

double height(context) {
  var myHeight = MediaQuery.of(context).size.height;
  return myHeight;
}

double width(context) {
  var myWidth = MediaQuery.of(context).size.width;
  return myWidth;
}

final dropDownInputDecoration = InputDecoration(
  prefixIcon: const Icon(Icons.shopping_bag_outlined, color: Colors.blue,),
  hintText: '',
  contentPadding: const EdgeInsets.all(0),
  border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
      borderSide: BorderSide(
        color: Colors.grey.shade300,
      )
  ),
  focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
      borderSide: BorderSide(
        color: Colors.grey.shade300,
      )
  ),
  enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
      borderSide: BorderSide(
        color: Colors.grey.shade300,
      )
  ),
  errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
      borderSide: BorderSide(
        color: Colors.red.shade300,
      )
  ),
  focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
      borderSide: BorderSide(
        color: Colors.red.shade300,
      )
  ),
);