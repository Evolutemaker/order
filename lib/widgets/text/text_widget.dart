import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
    required this.text,
    required this.color,
    required this.textStyle,
    this.textAlign,
    this.maxLines,
  });

  final String text;
  final Color color;
  final TextStyle textStyle;
  final TextAlign? textAlign;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: textStyle.copyWith(
        color: color,
      ),
      child: Text(
        text,
        maxLines: maxLines,
        textAlign: textAlign,
      ),
    );
  }
}
