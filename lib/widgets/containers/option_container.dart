import 'package:flutter/material.dart';
import 'package:order/constants/color_constants.dart';
import 'package:order/constants/font_constants.dart';
import 'package:order/constants/map_constants.dart';
import 'package:order/constants/enums.dart';
import 'package:order/widgets/text/text_widget.dart';

class OptionContainer extends StatelessWidget {
  const OptionContainer({
    required this.selectedButtonType,
    required this.buttonType,
    required this.onPressed,
    super.key,
  });

  final ButtonType selectedButtonType;
  final void Function()? onPressed;
  final ButtonType buttonType;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPressed,
        behavior: HitTestBehavior.translucent,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(36),
            color: selectedButtonType == buttonType
                ? ColorConstants.orange
                : ColorConstants.gray5,
          ),
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Center(
            child: TextWidget(
              text: getButtonTitle[buttonType]!,
              color: selectedButtonType == buttonType
                  ? ColorConstants.white
                  : ColorConstants.gray2,
              textStyle: FontConstants.regular400.copyWith(fontSize: 14),
            ),
          ),
        ),
      ),
    );
  }
}
