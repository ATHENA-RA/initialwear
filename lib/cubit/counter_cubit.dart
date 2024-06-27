import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() {
    if (state < 10) {
      emit(state + 1);
    } else {
      showToast("Maximum limit reached");
    }
  }

  void decrement() {
    if (state > -10) {
      emit(state - 1);
    } else {
      showToast("Minimum limit reached");
    }
  }

  void reset() => emit(0);

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
