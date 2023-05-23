// Flutter imports:
import 'package:flutter/material.dart';

class TextUtils extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final int maxLine;

  const TextUtils(
      {super.key, required this.text, this.style, this.maxLine = 1});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLine,
      style: style ?? const TextStyle(fontFamily: 'Mulish'),
    );
  }
}
