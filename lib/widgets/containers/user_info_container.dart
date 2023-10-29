import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:order/constants/color_constants.dart';
import 'package:order/constants/font_constants.dart';
import 'package:order/widgets/text/text_widget.dart';

class UserInfoContainer extends StatelessWidget {
  const UserInfoContainer({
    required this.isSelected,
    required this.fullname,
    required this.country,
    required this.city,
    required this.address,
    required this.postcode,
    required this.onPressed,
    required this.onUserSelected,
    super.key,
  });

  final bool isSelected;
  final void Function()? onUserSelected;
  final String fullname;
  final String country;
  final String city;
  final String address;
  final String postcode;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onUserSelected,
      behavior: HitTestBehavior.translucent,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isSelected ? ColorConstants.orange : ColorConstants.black,
        ),
        height: 80,
        padding: const EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  text: fullname,
                  color: ColorConstants.white,
                  textStyle: FontConstants.medium500.copyWith(fontSize: 14),
                ),
                Text(
                  '$country, $city, $address, $postcode',
                  style: const TextStyle(
                    color: ColorConstants.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: onPressed,
              behavior: HitTestBehavior.translucent,
              child: SvgPicture.asset('assets/icons/edit_icon.svg'),
            ),
          ],
        ),
      ),
    );
  }
}
