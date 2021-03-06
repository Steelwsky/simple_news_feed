import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'list_view_latest.dart';
import 'news_controller.dart';
import 'empty_list.dart';

class BodyContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewedController = Provider.of<NewsController>(context);
    return ValueListenableBuilder<PreparedFeed>(
        valueListenable: viewedController.preparedFeedState,
        builder: (_, rssFeed, __) {
          return RefreshIndicator(
              key: Key('refresh'),
              onRefresh: viewedController.fetchNews,
              child: rssFeed.items == null
                  ? EmptyList()
                  : ListViewLatest(preparedRssFeed: rssFeed));
        });
  }
}
