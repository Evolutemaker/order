part of 'user_bloc.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.create({required User user}) = UserCreateEvent;

  const factory UserEvent.update({required User user}) = UserUpdateEvent;
}
