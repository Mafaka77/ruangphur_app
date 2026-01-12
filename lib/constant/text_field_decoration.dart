import 'package:flutter/material.dart';

textFieldDecoration(String title, Icon? icon, String hintText) {
  return InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      labelText: title,
      hintText: hintText,
      labelStyle: const TextStyle(fontSize: 14),
      isDense: true,
      counterText: '',
      suffixIcon: icon);
}
