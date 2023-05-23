import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample/features/dashboard/domain/entities/chat_model.dart';
import 'package:sample/services/storage_service.dart';
import 'package:sample/features/dashboard/data/datasources/user_data_source.dart';
import 'package:sample/features/dashboard/data/datasources/user_data_source_impl.dart';
import 'package:sample/features/dashboard/data/repositories/user_repository_impl.dart';
import 'package:sample/features/dashboard/domain/entities/user_entity_model.dart';
import 'package:sample/features/dashboard/domain/repositories/user_repository.dart';
import 'package:sample/features/dashboard/domain/usecases/user_use_case_impl.dart';
import 'package:sample/features/dashboard/presentation/riverpod/user_notifier.dart';
import 'package:sample/features/dashboard/presentation/state/user_state.dart';
import 'package:sample/services/conectivity_services.dart';
import 'package:sample/services/http_service.dart';
import 'package:sample/services/storage_service.dart';

final storageServiceProvider = Provider<StorageService>((ref) {
  return StorageServiceImpl();
});

final httpServiceProvider = Provider<HttpService>((ref) {
  return HttpServiceImpl();
});

final userDatasourceProvider = Provider<UserDataSource>((ref) {
  return UserDataSourceImpl(httpService: ref.watch(httpServiceProvider));
});

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepositoryImpl(dataSource: ref.watch(userDatasourceProvider));
});

final userUseCaseProvider = Provider<UserUseCase>((ref) {
  return UserUseCaseImpl(
      repository: ref.watch(userRepositoryProvider), ref: ref);
});

final chatListProvider = StateProvider<List<ChatModel>>((ref) {
  return [];
});

final userNotifierProvider =
    StateNotifierProvider<UserNotifier, UserState>((ref) {
  return UserNotifier(useCase: ref.watch(userUseCaseProvider), productName: '');
});

final connectivityStatusProviders = StateNotifierProvider((ref) {
  return ConnectivityStatusNotifier();
});
