import 'package:flutter/material.dart';
import 'package:news_app/services/newsApiService.dart';
import 'package:news_app/widgets/newsPosrListView.dart';

class BodyView extends StatefulWidget {
  const BodyView({super.key});

  @override
  State<BodyView> createState() => BodyViewState();
}

class BodyViewState extends State<BodyView> {
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    firstRun();
  }

  void firstRun() async {
    await NewsApiService.getGeneralNews();
    isLoading = false;
    NewsApiService.cahngeLoding = 1;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return (isLoading == false &&
            NewsApiService.internet == 1 &&
            NewsApiService.cahngeLoding == 1)
        ? NewsPostListView(
            infoList: NewsApiService.postsDataList.isEmpty
                ? []
                : NewsApiService.postsDataList,
          )
        : const SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
  }
}
