import 'package:flutter/material.dart';
import 'package:sample/features/dashboard/presentation/views/chat_view.dart';
import 'package:sample/features/dashboard/presentation/views/custom_bottom_navbar.dart';
import 'package:sample/features/dashboard/presentation/views/home_screen.dart';

class MainBottomNavbar extends StatefulWidget {
  const MainBottomNavbar({super.key});

  @override
  State<MainBottomNavbar> createState() => _MainBottomNavbarState();
}

class _MainBottomNavbarState extends State<MainBottomNavbar> {
  int _currentIndex = 0;

  final _inactiveColor = Colors.grey;
  final List<Widget> screens = [
    const HomeScreen(),
    const SizedBox(),
    const SizedBox(),
    const ChatView(),
    const SizedBox(),
  ];

  void selectIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool showTab = MediaQuery.of(context).viewInsets.bottom != 0;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Visibility(
            visible: !showTab,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: FloatingActionButton(
                backgroundColor: Colors.blue[600],
                onPressed: () {
                  selectIndex(2);
                },
                elevation: 2.0,
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Icon(Icons.add),
                ),
              ),
            ),
          ),
          body: IndexedStack(
            index: _currentIndex,
            children: screens,
          ),
          bottomNavigationBar: bottomNavBar()),
    );
  }

  Widget bottomNavBar() {
    return CustomAnimatedBottomBar(
      containerHeight: 70,
      backgroundColor: Colors.black,
      selectedIndex: _currentIndex,
      showElevation: true,
      itemCornerRadius: 24,
      curve: Curves.easeIn,
      onItemSelected: (index) {
        selectIndex(index);
      },
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
          icon: const Icon(Icons.home),
          title: const Text(''),
          activeColor: Colors.blue,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.shopping_bag_rounded),
          title: const Text(''),
          activeColor: Colors.blue,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: const Icon(
            Icons.circle,
            size: 2,
          ),
          title: const Text(
            '',
          ),
          activeColor: Colors.blue,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.message),
          title: const Text(
            '',
          ),
          activeColor: Colors.blue,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.settings),
          title: const Text(''),
          activeColor: Colors.blue,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
