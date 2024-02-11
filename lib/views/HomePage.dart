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
  BodyView myBody = BodyView();
  void update() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
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
        preferredSize: const Size.fromHeight(40.0),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "News",
                style: TextStyle(color: Colors.black, fontSize: 28),
              ),
              Text(
                "Cloud",
                style: TextStyle(color: Colors.yellow, fontSize: 28),
              ),
            ],
          ),
        ),
      ),
      body: CustomScrollView(slivers: [
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
        BodyView()
      ]),
    );
  }
}
