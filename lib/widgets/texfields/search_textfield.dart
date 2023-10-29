import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:order/constants/color_constants.dart';
import 'package:order/constants/font_constants.dart';

class SearchTextfield extends StatelessWidget {
  const SearchTextfield({
    required this.onChanged,
    required this.focusNode,
    super.key,
  });

  final void Function(String)? onChanged;
  final FocusNode? focusNode;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      maxLines: 1,
      style: FontConstants.regular400.copyWith(
        color: ColorConstants.black,
        fontSize: 16,
      ),
      focusNode: focusNode,
      keyboardType: TextInputType.text,
      cursorColor: ColorConstants.gray1,
      decoration: InputDecoration(
        hintText: 'Search',
        prefixIcon: Container(
          margin: const EdgeInsets.symmetric(horizontal: 2),
          height: 36,
          width: 36,
          child: Center(
            child: SvgPicture.asset('assets/icons/search_icon.svg'),
          ),
        ),
        hintStyle: FontConstants.regular400.copyWith(
          color: ColorConstants.gray1,
          fontSize: 16,
        ),
        filled: false,
        counterText: '',
        contentPadding: const EdgeInsets.symmetric(
          vertical: 8,
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
    );
  }
}
