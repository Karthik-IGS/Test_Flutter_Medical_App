import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample/environments/environments.dart';
import 'package:sample/exceptions/networking_exception.dart';
import 'package:sample/features/dashboard/domain/usecases/user_use_case_impl.dart';
import 'package:sample/features/dashboard/presentation/state/user_state.dart';
import 'package:http/http.dart' as http;

class UserNotifier extends StateNotifier<UserState> {
  final UserUseCase useCase;
  final String productName;

  UserNotifier({required this.useCase, required this.productName})
      : super(const UserInitial()) {
    getUsers(productName: productName);
  }

  Future<void> getUsers({required String productName}) async {
    try {
      state = const UserLoading();
      final albums = await useCase.getUsers(productName: productName);
      await http.Client()
          .get(Uri.https(Environments.baseURL, Environments.categories))
          .then((value) {
        state = UserLoaded(
            users: albums,
            searchList: albums,
            productList: albums,
            categoriesList: (jsonDecode(value.body) as List)
                .map((item) => item as String)
                .toList());
      });
    } on NetworkException {
      state = const UserError('Couldnt fetch weather. Is the device online?');
    }
  }
}
