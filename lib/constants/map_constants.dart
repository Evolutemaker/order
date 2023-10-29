import 'package:order/constants/enums.dart';
import 'package:order/constants/text_constants.dart';

Map<TextfieldType, String> getTextfieldHeader = {
  TextfieldType.fullname: TextConstants.fullName,
  TextfieldType.email: TextConstants.email,
  TextfieldType.phone: TextConstants.phoneNumber,
  TextfieldType.country: TextConstants.country,
  TextfieldType.city: TextConstants.city,
  TextfieldType.address: TextConstants.addressLine,
  TextfieldType.postcode: TextConstants.postcode,
};

Map<ButtonType, String> getButtonTitle = {
  ButtonType.addAddress: TextConstants.addAddress,
  ButtonType.selectAddress: TextConstants.selectAddress,
  ButtonType.nextStep: TextConstants.nextStep,
};

Map<HeaderType, String> getHeaderTitle = {
  HeaderType.senderDetails: TextConstants.senderDetails,
  HeaderType.recipientAddress: TextConstants.recipientAddress,
};

Map<TextfieldType, String> getTextFieldIcon = {
  TextfieldType.fullname: 'assets/icons/user.svg',
  TextfieldType.email: 'assets/icons/email.svg',
  TextfieldType.phone: 'assets/icons/phone.svg',
  TextfieldType.country: 'assets/icons/country_icon.svg',
  TextfieldType.city: 'assets/icons/city_icon.svg',
  TextfieldType.address: 'assets/icons/address_icon.svg',
  TextfieldType.postcode: 'assets/icons/postcode_icon.svg',
};
