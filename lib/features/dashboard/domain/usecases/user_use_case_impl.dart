import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample/dependency_injector/dependency_injector.dart';
import 'package:sample/features/dashboard/domain/entities/chat_model.dart';
import 'package:sample/features/dashboard/domain/entities/user_entity_model.dart';
import 'package:sample/features/dashboard/domain/repositories/user_repository.dart';

abstract class UserUseCase {
  Future<Map<String, dynamic>> getUsers({required String productName});
}

class UserUseCaseImpl implements UserUseCase {
  final UserRepository repository;
  ProviderRef? ref;

  UserUseCaseImpl({required this.repository, this.ref});

  @override
  Future<Map<String, dynamic>> getUsers({required String productName}) async {
    Map<String, dynamic> dataList =
        await repository.getUsers(productName: productName);
    // ref!.read(chatListProvider.notifier).update((state) => dataList);
    List<ChatModel> chatList = [];
    chatList.addAll([
      ChatModel(
          profileURL:
              'https://www.nicepng.com/png/full/182-1829287_cammy-lin-ux-designer-circle-picture-profile-girl.png',
          isOnline: true,
          lastMessage: 'hi',
          messageTime: DateTime.now(),
          name: 'dr. Kelvin',
          unreadCount: 2),
      ChatModel(
          profileURL:
              'https://www.nicepng.com/png/full/182-1829287_cammy-lin-ux-designer-circle-picture-profile-girl.png',
          isOnline: false,
          lastMessage: 'Welcome',
          messageTime: DateTime.now(),
          name: 'dr. Antony',
          unreadCount: 0),
      ChatModel(
          profileURL:
              'https://www.nicepng.com/png/full/182-1829287_cammy-lin-ux-designer-circle-picture-profile-girl.png',
          isOnline: false,
          lastMessage: 'hi',
          messageTime: DateTime.now(),
          name: 'dr. Kelvin',
          unreadCount: 10),
      ChatModel(
          profileURL:
              'https://www.nicepng.com/png/full/182-1829287_cammy-lin-ux-designer-circle-picture-profile-girl.png',
          isOnline: true,
          lastMessage: 'hi',
          messageTime: DateTime.now(),
          name: 'dr. Kelvin',
          unreadCount: 0),
      ChatModel(
          profileURL:
              'https://www.nicepng.com/png/full/182-1829287_cammy-lin-ux-designer-circle-picture-profile-girl.png',
          isOnline: true,
          lastMessage: 'hi',
          messageTime: DateTime.now(),
          name: 'dr. Kelvin',
          unreadCount: 2),
      ChatModel(
          profileURL:
              'https://www.nicepng.com/png/full/182-1829287_cammy-lin-ux-designer-circle-picture-profile-girl.png',
          isOnline: false,
          lastMessage: 'Welcome',
          messageTime: DateTime.now(),
          name: 'dr. Antony',
          unreadCount: 0),
      ChatModel(
          profileURL:
              'https://www.nicepng.com/png/full/182-1829287_cammy-lin-ux-designer-circle-picture-profile-girl.png',
          isOnline: false,
          lastMessage: 'hi',
          messageTime: DateTime.now(),
          name: 'dr. Kelvin',
          unreadCount: 10),
      ChatModel(
          profileURL:
              'https://www.nicepng.com/png/full/182-1829287_cammy-lin-ux-designer-circle-picture-profile-girl.png',
          isOnline: true,
          lastMessage: 'hi',
          messageTime: DateTime.now(),
          name: 'dr. Kelvin',
          unreadCount: 0),
      ChatModel(
          profileURL:
              'https://www.nicepng.com/png/full/182-1829287_cammy-lin-ux-designer-circle-picture-profile-girl.png',
          isOnline: true,
          lastMessage: 'hi',
          messageTime: DateTime.now(),
          name: 'dr. Kelvin',
          unreadCount: 2),
      ChatModel(
          profileURL:
              'https://www.nicepng.com/png/full/182-1829287_cammy-lin-ux-designer-circle-picture-profile-girl.png',
          isOnline: false,
          lastMessage: 'Welcome',
          messageTime: DateTime.now(),
          name: 'dr. Antony',
          unreadCount: 0),
      ChatModel(
          profileURL:
              'https://www.nicepng.com/png/full/182-1829287_cammy-lin-ux-designer-circle-picture-profile-girl.png',
          isOnline: false,
          lastMessage: 'hi',
          messageTime: DateTime.now(),
          name: 'dr. Kelvin',
          unreadCount: 10),
      ChatModel(
          profileURL:
              'https://www.nicepng.com/png/full/182-1829287_cammy-lin-ux-designer-circle-picture-profile-girl.png',
          isOnline: true,
          lastMessage: 'hi',
          messageTime: DateTime.now(),
          name: 'dr. Kelvin',
          unreadCount: 0),
    ]);
    ref!.read(chatListProvider.notifier).update((state) => chatList);
    return dataList;
  }
}
