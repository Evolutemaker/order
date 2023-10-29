import 'package:flutter/material.dart';
import 'package:order/constants/color_constants.dart';
import 'package:order/constants/font_constants.dart';
import 'package:order/widgets/text/text_widget.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    required this.title,
    required this.onPressed,
    super.key,
  });

  final String title;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorConstants.orange,
        foregroundColor: const Color(0xFFFFF0E8),
        elevation: 0,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        padding: const EdgeInsets.symmetric(vertical: 18),
      ),
      child: Center(
        child: TextWidget(
          text: title,
          color: ColorConstants.white,
          textStyle: FontConstants.medium500.copyWith(fontSize: 16),
        ),
      ),
    );
  }
}
