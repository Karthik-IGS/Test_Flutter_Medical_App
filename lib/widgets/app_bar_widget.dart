import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final List<Widget>? actions;
  final Function()? callBack;
  final bool? isBackButton;

  const AppBarWidget(
      {super.key,
      required this.title,
      this.actions,
      this.callBack,
      this.isBackButton = false});

  static const double appBarHeight = 56.0;

  @override
  Size get preferredSize => const Size.fromHeight(appBarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        centerTitle: false,
        leading: isBackButton!
            ? IconButton(
                onPressed: callBack!,
                icon: const Icon(Icons.supervised_user_circle_sharp, size: 44))
            : null,
        // title: title,
        title: Row(children: [
          title,
        ]),
        actions: <Widget>[
          PopupMenuButton<String>(
            itemBuilder: (BuildContext context) {
              return {'Logout', 'Settings'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
        elevation: 0,
        toolbarHeight: appBarHeight);
  }
}
