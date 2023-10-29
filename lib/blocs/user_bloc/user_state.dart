part of 'user_bloc.dart';

@freezed
class UserState with _$UserState {
  const factory UserState.initial() = _UserInitialState;
  const factory UserState.loaded({required List<User> users}) = _UserLoadedState;
}