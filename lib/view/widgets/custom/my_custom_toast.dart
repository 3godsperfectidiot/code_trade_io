import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void myCustomToast(String message) {
  Fluttertoast.cancel();
  Fluttertoast.showToast(
    msg: message,
    backgroundColor: const Color(0XFF0ABE90),
    textColor: Colors.white,
  );
}

void myCustomErrorToast(Object error) {
  Fluttertoast.cancel();
  Fluttertoast.showToast(
    msg: error.toString().replaceFirst("HttpException: ", ""),
    backgroundColor: const Color(0XFF0ABE90),
    textColor: Colors.white,
  );
}
