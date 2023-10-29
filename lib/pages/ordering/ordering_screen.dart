import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:order/blocs/user_bloc/user_bloc.dart';
import 'package:order/constants/color_constants.dart';
import 'package:order/constants/enums.dart';
import 'package:order/constants/font_constants.dart';
import 'package:order/constants/functions.dart';
import 'package:order/constants/text_constants.dart';
import 'package:order/widgets/appbars/back_appbar.dart';
import 'package:order/widgets/buttons/default_button.dart';
import 'package:order/widgets/containers/option_container.dart';
import 'package:order/widgets/containers/start_date.dart';
import 'package:order/widgets/containers/user_info_container.dart';
import 'package:order/widgets/texfields/default_textfield.dart';
import 'package:order/widgets/texfields/search_textfield.dart';
import 'package:order/widgets/text/text_widget.dart';

class OrderingScreen extends StatefulWidget {
  const OrderingScreen({super.key});

  @override
  State<OrderingScreen> createState() => _OrderingScreenState();
}

class _OrderingScreenState extends State<OrderingScreen> {
  ButtonType selectedSenderButtonType = ButtonType.addAddress;
  ButtonType selectedRecipientButtonType = ButtonType.addAddress;
  DateTime _date = DateTime.now();
  final DateFormat _dateFormat = DateFormat('MMM dd, yyyy');
  bool isUserSelected = false;
  int addressCount = 1;

  @override
  Widget build(BuildContext context) {
    final usersState = context.watch<UserBloc>().state;

    Future<void> _handleDatePicker() async {
      final DateTime? date = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
      );

      if (date != null && date != _date) {
        setState(() {
          _date = date;
        });
      }
    }

    // context.watch<UserBloc>().state.maybeMap(
    //       loaded: (value) {
    //         print(value.users[0].city);
    //       },
    //       orElse: () {},
    //     );

    return Scaffold(
      body: Column(
        children: [
          const BackAppbar(title: TextConstants.ordering),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 12),
                    child: TextWidget(
                      text: TextConstants.stepOne,
                      color: ColorConstants.black,
                      textStyle: FontConstants.regular400.copyWith(
                        fontSize: 16,
                        height: 1,
                      ),
                    ),
                  ),
                  StartDate(
                    date: _dateFormat.format(_date),
                    onDateTapped: _handleDatePicker,
                  ),
                  Container(
                    color: ColorConstants.white,
                    margin: const EdgeInsets.symmetric(vertical: 16),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: TextConstants.senderDetails,
                          color: ColorConstants.black,
                          textStyle:
                              FontConstants.bold700.copyWith(fontSize: 16),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            OptionContainer(
                              selectedButtonType: selectedSenderButtonType,
                              buttonType: ButtonType.addAddress,
                              onPressed: () {
                                setState(() {
                                  selectedSenderButtonType =
                                      ButtonType.addAddress;
                                });
                              },
                            ),
                            const SizedBox(width: 7),
                            OptionContainer(
                              selectedButtonType: selectedSenderButtonType,
                              buttonType: ButtonType.selectAddress,
                              onPressed: () {
                                setState(() {
                                  selectedSenderButtonType =
                                      ButtonType.selectAddress;
                                });
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        usersState.when(
                          initial: () => const Center(
                            child: TextWidget(
                              text: 'No users yet',
                              color: ColorConstants.black,
                              textStyle: FontConstants.regular400,
                            ),
                          ),
                          loaded: (users) {
                            String? fullname = users[0].fullname;
                            String? email = users[0].fullname;
                            String? phoneNumber = users[0].phoneNumber;
                            String? country = users[0].country;
                            String? city = users[0].city;
                            List<String>? addressLinesList =
                                users[0].addressLinesList;
                            String? postcode = users[0].postcode;

                            addressCount = users[0].addressLinesList.length;
                            return selectedSenderButtonType ==
                                    ButtonType.addAddress
                                ? Column(
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: List.generate(5, (index) {
                                          return Container(
                                            margin: const EdgeInsets.only(
                                                bottom: 12),
                                            child: DefaultTextfield(
                                              textfieldType: TextfieldType
                                                  .values
                                                  .toList()[index],
                                              onChanged: (data) {
                                                setState(() {
                                                  switch (TextfieldType.values
                                                      .toList()[index]) {
                                                    case TextfieldType.fullname:
                                                      fullname = data;
                                                      break;
                                                    case TextfieldType.email:
                                                      email = data;
                                                      break;
                                                    case TextfieldType.phone:
                                                      phoneNumber = data;
                                                      break;
                                                    case TextfieldType.country:
                                                      country = data;
                                                      break;
                                                    case TextfieldType.city:
                                                      city = data;
                                                      break;
                                                    default:
                                                  }
                                                });
                                              },
                                              savedUserInfo: savedUserInfo(
                                                users[0],
                                                TextfieldType.values
                                                    .toList()[index],
                                              ),
                                            ),
                                          );
                                        }),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: List.generate(
                                            users[0].addressLinesList.length,
                                            (index) {
                                          return Container(
                                            margin: const EdgeInsets.only(
                                                bottom: 12),
                                            child: DefaultTextfield(
                                              textfieldType:
                                                  TextfieldType.address,
                                              onChanged: (data) {
                                                setState(() {
                                                  addressLinesList.add(data);
                                                });
                                              },
                                              addressCount: index + 1,
                                              savedUserInfo:
                                                  addressLinesList[index],
                                            ),
                                          );
                                        }),
                                      ),
                                      Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 20),
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              addressCount++;
                                            });
                                          },
                                          behavior: HitTestBehavior.translucent,
                                          child: TextWidget(
                                            text: TextConstants.addAddressLine,
                                            color: ColorConstants.orange,
                                            textStyle: FontConstants.medium500
                                                .copyWith(fontSize: 16),
                                          ),
                                        ),
                                      ),
                                      DefaultTextfield(
                                        textfieldType: TextfieldType.postcode,
                                        onChanged: (data) {
                                          setState(() {
                                            postcode = data;
                                          });
                                        },
                                      ),
                                    ],
                                  )
                                : Column(
                                    children: [
                                      Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 12),
                                        child: SearchTextfield(
                                          onChanged: (searchData) {},
                                          focusNode: null,
                                        ),
                                      ),
                                      Column(
                                        children: List.generate(users.length,
                                            (index) {
                                          return UserInfoContainer(
                                            isSelected: isUserSelected,
                                            onUserSelected: () {
                                              setState(() {
                                                isUserSelected =
                                                    !isUserSelected;
                                              });
                                            },
                                            fullname: users[index].fullname,
                                            country: users[index].country,
                                            city: users[index].city,
                                            address: users[index]
                                                .addressLinesList[0],
                                            postcode: users[index].postcode,
                                            onPressed: () {
                                              debugPrint('pressed');
                                            },
                                          );
                                        }),
                                      )
                                    ],
                                  );
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: ColorConstants.white,
                    margin: const EdgeInsets.symmetric(vertical: 16),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: TextConstants.recipientAddress,
                          color: ColorConstants.black,
                          textStyle:
                              FontConstants.bold700.copyWith(fontSize: 16),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            OptionContainer(
                              selectedButtonType: selectedRecipientButtonType,
                              buttonType: ButtonType.addAddress,
                              onPressed: () {
                                setState(() {
                                  selectedRecipientButtonType =
                                      ButtonType.addAddress;
                                });
                              },
                            ),
                            const SizedBox(width: 7),
                            OptionContainer(
                              selectedButtonType: selectedRecipientButtonType,
                              buttonType: ButtonType.selectAddress,
                              onPressed: () {
                                setState(() {
                                  selectedRecipientButtonType =
                                      ButtonType.selectAddress;
                                });
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        usersState.when(
                          initial: () => const Center(
                            child: TextWidget(
                              text: 'No users yet',
                              color: ColorConstants.black,
                              textStyle: FontConstants.regular400,
                            ),
                          ),
                          loaded: (users) {
                            String? fullname = users[0].fullname;
                            String? email = users[0].fullname;
                            String? phoneNumber = users[0].phoneNumber;
                            String? country = users[0].country;
                            String? city = users[0].city;
                            List<String>? addressLinesList =
                                users[0].addressLinesList;
                            String? postcode = users[0].postcode;

                            addressCount = users[0].addressLinesList.length;
                            return selectedRecipientButtonType ==
                                    ButtonType.addAddress
                                ? Column(
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: List.generate(5, (index) {
                                          return Container(
                                            margin: const EdgeInsets.only(
                                                bottom: 12),
                                            child: DefaultTextfield(
                                              textfieldType: TextfieldType
                                                  .values
                                                  .toList()[index],
                                              onChanged: (data) {
                                                setState(() {
                                                  switch (TextfieldType.values
                                                      .toList()[index]) {
                                                    case TextfieldType.fullname:
                                                      fullname = data;
                                                      break;
                                                    case TextfieldType.email:
                                                      email = data;
                                                      break;
                                                    case TextfieldType.phone:
                                                      phoneNumber = data;
                                                      break;
                                                    case TextfieldType.country:
                                                      country = data;
                                                      break;
                                                    case TextfieldType.city:
                                                      city = data;
                                                      break;
                                                    default:
                                                  }
                                                });
                                              },
                                              savedUserInfo: savedUserInfo(
                                                users[0],
                                                TextfieldType.values
                                                    .toList()[index],
                                              ),
                                            ),
                                          );
                                        }),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: List.generate(
                                            users[0].addressLinesList.length,
                                            (index) {
                                          return Container(
                                            margin: const EdgeInsets.only(
                                                bottom: 12),
                                            child: DefaultTextfield(
                                              textfieldType:
                                                  TextfieldType.address,
                                              onChanged: (data) {
                                                setState(() {
                                                  addressLinesList.add(data);
                                                });
                                              },
                                              addressCount: index + 1,
                                              savedUserInfo:
                                                  addressLinesList[index],
                                            ),
                                          );
                                        }),
                                      ),
                                      Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 20),
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              addressCount++;
                                            });
                                          },
                                          behavior: HitTestBehavior.translucent,
                                          child: TextWidget(
                                            text: TextConstants.addAddressLine,
                                            color: ColorConstants.orange,
                                            textStyle: FontConstants.medium500
                                                .copyWith(fontSize: 16),
                                          ),
                                        ),
                                      ),
                                      DefaultTextfield(
                                        textfieldType: TextfieldType.postcode,
                                        onChanged: (data) {
                                          setState(() {
                                            postcode = data;
                                          });
                                        },
                                      ),
                                    ],
                                  )
                                : Column(
                                    children: [
                                      Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 12),
                                        child: SearchTextfield(
                                          onChanged: (searchData) {},
                                          focusNode: null,
                                        ),
                                      ),
                                      Column(
                                        children: List.generate(users.length,
                                            (index) {
                                          return UserInfoContainer(
                                            isSelected: isUserSelected,
                                            onUserSelected: () {
                                              setState(() {
                                                isUserSelected =
                                                    !isUserSelected;
                                              });
                                            },
                                            fullname: users[index].fullname,
                                            country: users[index].country,
                                            city: users[index].city,
                                            address: users[index]
                                                .addressLinesList[0],
                                            postcode: users[index].postcode,
                                            onPressed: () {
                                              debugPrint('pressed');
                                            },
                                          );
                                        }),
                                      )
                                    ],
                                  );
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        top: 16, bottom: 40, left: 20, right: 20),
                    child: DefaultButton(
                      onPressed: () {
                        // context
                        //     .read<UserBloc>()
                        //     .add(UserEvent.update(user: updatedUser));
                      },
                      title: TextConstants.nextStep,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
