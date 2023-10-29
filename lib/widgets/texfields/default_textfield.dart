import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:order/constants/color_constants.dart';
import 'package:order/constants/enums.dart';
import 'package:order/constants/font_constants.dart';
import 'package:order/constants/map_constants.dart';
import 'package:order/widgets/text/text_widget.dart';

class DefaultTextfield extends StatelessWidget {
  const DefaultTextfield({
    required this.textfieldType,
    required this.onChanged,
    this.addressCount = 1,
    this.savedUserInfo = '',
    super.key,
  });

  final TextfieldType textfieldType;
  final void Function(String)? onChanged;
  final int? addressCount;
  final String? savedUserInfo;

  @override
  Widget build(BuildContext context) {
    String hintText = '';

    switch (textfieldType) {
      case TextfieldType.address:
        hintText =
            '${getTextfieldHeader[textfieldType]!.toLowerCase()} $addressCount';
        break;
      default:
        hintText = getTextfieldHeader[textfieldType]!
            .substring(0, getTextfieldHeader[textfieldType]!.length - 1)
            .toLowerCase();
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          text: textfieldType == TextfieldType.address
              ? '${getTextfieldHeader[textfieldType]!} $addressCount*'
              : getTextfieldHeader[textfieldType]!,
          color: ColorConstants.black,
          textStyle: FontConstants.medium500.copyWith(fontSize: 14),
        ),
        const SizedBox(height: 8),
        TextFormField(
          onChanged: textfieldType == TextfieldType.address ? null : onChanged,
          onFieldSubmitted:
              textfieldType == TextfieldType.address ? onChanged : null,
          maxLines: 1,
          style: FontConstants.regular400.copyWith(
            color: ColorConstants.black,
            fontSize: 16,
          ),
          keyboardType: TextInputType.text,
          cursorColor: ColorConstants.gray1,
          decoration: InputDecoration(
            hintText:
                savedUserInfo == '' ? 'Enter your $hintText' : savedUserInfo,
            prefixIcon: SizedBox(
              height: 44,
              width: 44,
              child: Center(
                child: SvgPicture.asset(getTextFieldIcon[textfieldType]!),
              ),
            ),
            hintStyle: FontConstants.regular400.copyWith(
              color: ColorConstants.gray1,
              fontSize: 16,
            ),
            filled: false,
            counterText: '',
            contentPadding: const EdgeInsets.symmetric(
              vertical: 12,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorConstants.orange,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorConstants.gray3,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }
}
