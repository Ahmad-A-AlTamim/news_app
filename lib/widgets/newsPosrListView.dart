// ignore_for_file: must_be_immutable, file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:news_app/modules/newPostInfo.dart';
import 'package:news_app/widgets/newsPostWidget.dart';

class NewsPostListView extends StatelessWidget {
  List<NewsPostInfo> infoList;

  NewsPostListView({required this.infoList});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return NewsPost(
          info: infoList[index],
        );
      }, childCount: infoList.length),
    );
  }
}
