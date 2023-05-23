import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:sample/environments/environments.dart';
import 'package:sample/features/dashboard/data/datasources/user_data_source.dart';
import 'package:sample/features/dashboard/data/models/user_model.dart';
import 'package:sample/services/http_service.dart';

class UserDataSourceImpl implements UserDataSource {
  Map<String, dynamic> listOfProduct = {};

  final HttpService httpService;

  UserDataSourceImpl({required this.httpService});

  @override
  Future<Map<String, dynamic>> getUsers({required String productName}) async {
    try {
      await httpService
          .getData(
        uri: Uri.https(Environments.baseURL, Environments.product),
      )
          .then((value) {
        listOfProduct = jsonDecode(value.body);
        try {
          UserModel userModel = UserModel.fromJson(jsonDecode(value.body));
          debugPrint('_listOfUsers--> length--> ${userModel.limit}');
          debugPrint('_listOfUsers--> length--> ${userModel.products!.length}');
        } catch (e) {
          debugPrint(e.toString());
        }
        return listOfProduct;
      });
    } catch (e) {
      log('$e');
    }
    return listOfProduct;
  }
}
