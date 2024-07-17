import 'package:flutter/material.dart';
import '../contants.dart';

class WG {
  static TextStyle inputStyle([bool status = true]) {
    return TextStyle(
      fontSize: ConstGlobal.inputFontSize,
      color: status ? Colors.grey[900] : Colors.grey
    );
  }
}
