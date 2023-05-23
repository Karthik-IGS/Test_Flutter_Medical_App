

import 'package:sample/features/dashboard/data/datasources/user_data_source.dart';
import 'package:sample/features/dashboard/domain/entities/user_entity_model.dart';
import 'package:sample/features/dashboard/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource dataSource;

  UserRepositoryImpl({required this.dataSource});

  @override
  Future<Map<String, dynamic>> getUsers({required String productName}) async {
    return await dataSource.getUsers(productName: productName);
  }
}
