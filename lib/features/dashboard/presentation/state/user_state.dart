import 'package:sample/features/dashboard/domain/entities/user_entity_model.dart';

abstract class UserState {
  const UserState();
}

class UserInitial extends UserState {
  const UserInitial();
}

class UserLoading extends UserState {
  const UserLoading();
}

class UserLoaded extends UserState {
  final Map<String, dynamic> users;
  final Map<String, dynamic> searchList;
  final Map<String, dynamic> productList;
  final List<String> categoriesList;

  UserLoaded(
      {required this.users,
      required this.searchList,
      required this.productList,
      required this.categoriesList});
}

class UserError extends UserState {
  final String message;

  const UserError(this.message);
}
