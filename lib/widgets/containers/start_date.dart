import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:order/constants/color_constants.dart';
import 'package:order/constants/font_constants.dart';
import 'package:order/constants/text_constants.dart';
import 'package:order/widgets/text/text_widget.dart';

class StartDate extends StatelessWidget {
  const StartDate({required this.date, required this.onDateTapped, super.key});

  final String date;
  final void Function()? onDateTapped;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onDateTapped,
      behavior: HitTestBehavior.translucent,
      child: Container(
        color: ColorConstants.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
              text: TextConstants.startDate,
              color: ColorConstants.black,
              textStyle: FontConstants.medium500.copyWith(fontSize: 14),
            ),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(width: 0.5, color: ColorConstants.gray3),
              ),
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  SvgPicture.asset('assets/icons/calendar.svg'),
                  const SizedBox(width: 12),
                  TextWidget(
                    text: date,
                    color: ColorConstants.black,
                    textStyle: FontConstants.regular400.copyWith(fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
