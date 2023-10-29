import 'package:order/constants/enums.dart';
import 'package:order/models/user/user.dart';

String savedUserInfo(User user, TextfieldType textfieldType) {
  switch (textfieldType) {
    case TextfieldType.fullname:
      return user.fullname;
    case TextfieldType.email:
      return user.email;
    case TextfieldType.phone:
      return user.phoneNumber;
    case TextfieldType.country:
      return user.country;
    case TextfieldType.city:
      return user.city;
    default:
      return '';
  }
}
