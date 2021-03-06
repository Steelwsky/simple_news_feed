import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simplenewsfeed/strings.dart';
import 'news_controller.dart';

class MyBottomNavBar extends StatefulWidget {
  MyBottomNavBar({Key key, @required this.pageController}) : super(key: key);
  final PageController pageController;

  @override
  _MyBottomNavBarState createState() => _MyBottomNavBarState(pageController);
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  _MyBottomNavBarState(this.pageController);
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    final MyPageIndexController myIntController =
        Provider.of<MyPageIndexController>(context);
    return ValueListenableBuilder<int>(
      valueListenable: myIntController.intState,
      builder: (_, __, ___) {
        return BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text(HOME),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.book),
                title: Text(HISTORY),
              ),
            ],
            currentIndex: __,
            selectedItemColor: Colors.amber[800],
            onTap: (index) {
              myIntController.bottomTapped(index, pageController);
              print('bottomNavBar widget post: $index');
            });
      },
    );
  }
}
