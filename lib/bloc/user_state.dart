// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc_network_example/model/user.dart';

abstract class UserState {}

class UserEmptyState extends UserState{}
class UserLoadingState extends UserState{}
class UserLoadedState extends UserState {
  List<User> loadedUser;
  UserLoadedState({
    required this.loadedUser,
  });
} // veriler basarili gelirse kullanicilari listeler

class UserErrorState extends UserState {}