import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simplenewsfeed/body_content.dart';
import 'package:simplenewsfeed/news_controller.dart';

import 'list_view_history.dart';

class MyPageView extends StatefulWidget {
  MyPageView(this.pageController);

  final PageController pageController;

  @override
  _MyPageViewState createState() => _MyPageViewState(pageController);
}

class _MyPageViewState extends State<MyPageView> {
  _MyPageViewState(this.pageController);

  final PageController pageController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final MyIntController myIntController =
        Provider.of<MyIntController>(context);
    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        myIntController.pageChanged(index);
        print('widget PageView: $index');
      },
      children: <Widget>[
        BodyContent(),
        ListViewHistory(),
      ],
    );
  }
}
