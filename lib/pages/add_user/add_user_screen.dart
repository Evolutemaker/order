import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order/blocs/user_bloc/user_bloc.dart';
import 'package:order/constants/color_constants.dart';
import 'package:order/constants/enums.dart';
import 'package:order/constants/font_constants.dart';
import 'package:order/constants/text_constants.dart';
import 'package:order/models/user/user.dart';
import 'package:order/widgets/appbars/back_appbar.dart';
import 'package:order/widgets/buttons/default_button.dart';
import 'package:order/widgets/texfields/default_textfield.dart';
import 'package:order/widgets/text/text_widget.dart';
import 'package:uuid/uuid.dart';

class AddUserScreen extends StatefulWidget {
  const AddUserScreen({super.key});

  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  int addressCount = 1;
  String? fullname;
  String? email;
  String? phoneNumber;
  String? country;
  String? city;
  List<String>? addressLinesList = [];
  String? postcode;

  @override
  Widget build(BuildContext context) {
    final userBloc = context.read<UserBloc>();
    const uuid = Uuid();

    return Scaffold(
      body: Column(
        children: [
          const BackAppbar(title: TextConstants.addUser),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(5, (index) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        child: DefaultTextfield(
                          textfieldType: TextfieldType.values.toList()[index],
                          onChanged: (data) {
                            setState(() {
                              switch (TextfieldType.values.toList()[index]) {
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
                        ),
                      );
                    }),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(addressCount, (index) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        child: DefaultTextfield(
                          textfieldType: TextfieldType.address,
                          onChanged: (data) {
                            setState(() {
                              addressLinesList!.add(data);
                            });
                          },
                          addressCount: index + 1,
                        ),
                      );
                    }),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
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
                        textStyle:
                            FontConstants.medium500.copyWith(fontSize: 16),
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
                  Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 50),
                    child: DefaultButton(
                      title: TextConstants.addUser,
                      onPressed: () {
                        User newUser = User(
                          id: uuid.v4(),
                          fullname: fullname ?? 'N/A',
                          email: email ?? 'N/A',
                          phoneNumber: phoneNumber ?? 'N/A',
                          country: country ?? 'N/A',
                          city: city ?? 'N/A',
                          addressLinesList: addressLinesList ?? [],
                          postcode: postcode ?? 'N/A',
                        );

                        userBloc.add(UserCreateEvent(user: newUser));
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
