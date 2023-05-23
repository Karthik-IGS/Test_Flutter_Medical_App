import 'package:sample/features/dashboard/data/models/user_model.dart';

class UserEntityModel {
  final List<Products>? products;
  final double? total;
  final double? skip;
  final double? limit;

  UserEntityModel({this.products, this.total, this.skip, this.limit});
}
