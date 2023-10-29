// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as String,
      fullname: json['fullname'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      country: json['country'] as String,
      city: json['city'] as String,
      addressLinesList: (json['addressLinesList'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      postcode: json['postcode'] as String,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullname': instance.fullname,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'country': instance.country,
      'city': instance.city,
      'addressLinesList': instance.addressLinesList,
      'postcode': instance.postcode,
    };
