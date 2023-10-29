import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:order/models/user/user.dart';

part 'user_bloc.freezed.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserState.initial()) {
    on<UserCreateEvent>((event, emit) async {
      final newUsers = state.maybeMap(
        loaded: (loadedState) {
          final users = List<User>.from(loadedState.users);
          users.add(event.user);
          return users;
        },
        orElse: () => <User>[event.user],
      );
      emit(UserState.loaded(users: newUsers));
    });

    on<UserUpdateEvent>((event, emit) async {
      final updatedUsers = state.maybeMap(
        loaded: (loadedState) {
          final users = List<User>.from(loadedState.users);
          final index = users.indexWhere((user) => user.id == event.user.id);
          if (index >= 0) {
            users[index] = event.user.copyWith();
          }
          return users;
        },
        orElse: () => <User>[],
      );

      emit(UserState.loaded(users: updatedUsers));
    });
  }
}
