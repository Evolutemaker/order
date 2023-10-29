import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:order/constants/color_constants.dart';
import 'package:order/constants/constants.dart';
import 'package:order/constants/font_constants.dart';
import 'package:order/widgets/text/text_widget.dart';

class BackAppbar extends StatelessWidget {
  const BackAppbar({required this.title, super.key});

  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: statusBarHeight(context), bottom: 12),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0.5,
            color: ColorConstants.gray5,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 16.5),
      child: Row(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  Navigator.pop(context);
                },
                child: SizedBox(
                  width: 44,
                  height: 44,
                  child: Center(
                      child: SvgPicture.asset('assets/icons/back_icon.svg')),
                ),
              ),
            ),
          ),
          TextWidget(
            text: title,
            color: ColorConstants.black,
            textStyle: FontConstants.bold700.copyWith(fontSize: 20),
          ),
          const Expanded(child: SizedBox()),
        ],
      ),
    );
  }
}
