import 'package:sample/features/dashboard/domain/entities/user_entity_model.dart';

abstract class UserRepository {
  Future<Map<String, dynamic>> getUsers({required String productName});
}
