// ignore_for_file: file_names, must_be_immutable, use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:news_app/services/newsApiService.dart';
import 'package:news_app/widgets/body_view.dart';
import 'package:news_app/widgets/headsCardListView.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  static String headTitle = 'General';

  // ignore: prefer_const_constructors
  BodyView myBody = const BodyView();
  void update() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    NewsApiService.x = update;
  }

  Map<String, Future<void> Function()> headsList = {
    'General': NewsApiService.getGeneralNews,
    "eBusiness": NewsApiService.getEBusinessNews,
    'Wars': NewsApiService.getWarsNews,
    'Health': NewsApiService.getHealthNews,
    'Science': NewsApiService.getSciencesNews,
    'Sports': NewsApiService.getSportsNews,
    'Technology': NewsApiService.getTechnologyNews,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          backgroundColor: Colors.blueAccent,
          elevation: 1,
          centerTitle: true,
          title: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "News",
                style: TextStyle(color: Colors.white, fontSize: 26),
              ),
              Text(
                "Cloud",
                style: TextStyle(color: Colors.yellow, fontSize: 26),
              ),
            ],
          ),
        ),
      ),
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: Container(
            width: double.infinity,
            color: Colors.white,
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text(
                headTitle,
                style: const TextStyle(color: Colors.black, fontSize: 26),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: MediaQuery.of(context).size.height / 5.8,
            child: HeadsCardListView(
              headsList: headsList,
              refreshFunction: update,
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 5,
          ),
        ),
        // ignore: prefer_const_constructors
        BodyView()
      ]),
    );
  }
}
