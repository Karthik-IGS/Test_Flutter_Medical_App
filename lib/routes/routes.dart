import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:sample/features/dashboard/presentation/views/bottom_navbar.dart';
import 'package:sample/features/dashboard/presentation/views/chat_view.dart';
import 'package:sample/features/dashboard/presentation/views/docotor_profile_screen.dart';

final routesApp = Routes();

class Routes {
  static const String chat = '/';
  static const String dashboard = '/dashboard';
  static const String doctorProfileScreen = '/doctorProfileScreen';

  final routes = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: dashboard,
    routes: [
      GoRoute(
        path: doctorProfileScreen,
        pageBuilder: (context, state) => CupertinoPage(
          child: DoctorProfileScreen(key: UniqueKey()),
        ),
      ),
      GoRoute(
        path: dashboard,
        pageBuilder: (context, state) =>
            const CupertinoPage(child: MainBottomNavbar()),
      ),
      GoRoute(
        path: chat,
        pageBuilder: (context, state) => CupertinoPage(
          child: ChatView(key: UniqueKey()),
        ),
      ),
    ],
  );
}
