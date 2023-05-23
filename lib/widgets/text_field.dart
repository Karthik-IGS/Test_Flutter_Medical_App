import 'package:flutter/material.dart';

class TextFieldUtils extends StatelessWidget {
  String? hintText;
  final TextEditingController controller;
  final Function(String) callBack;

  TextFieldUtils(
      {super.key,
      this.hintText,
      required this.controller,
      required this.callBack});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textInputAction: TextInputAction.search,
      textAlign: TextAlign.start,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.search, size: 33, color: Colors.grey[400]),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(width: 0.5, color: Colors.grey),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(width: 1, color: Colors.grey),
          ),
          hintStyle: TextStyle(color: Colors.grey[400],height: 1),
          hintText: hintText ?? 'Search by name'),
      onSubmitted: callBack,
      onChanged: callBack,
    );
  }
}
