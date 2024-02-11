// ignore_for_file: must_be_immutable, file_names, use_key_in_widget_constructors, no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:news_app/modules/headCardInfo.dart';
import 'package:news_app/widgets/headsCradWidget.dart';

class HeadsCardListView extends StatefulWidget {
  Map<String, Future<void> Function()> headsList;
  Function() refreshFunction;

  HeadsCardListView({
    required this.headsList,
    required this.refreshFunction,
  });

  @override
  State<HeadsCardListView> createState() => _HeadsCardListViewState(
      headsList: headsList, refreshFunction: refreshFunction);
}

class _HeadsCardListViewState extends State<HeadsCardListView> {
  Map<String, Future<void> Function()> headsList;
  Function() refreshFunction;

  _HeadsCardListViewState({
    required this.headsList,
    required this.refreshFunction,
  });
  static List<String> main = [];
  static List<Future<void> Function()> fun = [];
  @override
  void initState() {
    super.initState();
    headsList.forEach((key, value) {
      main.add(key);
      fun.add(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color.fromARGB(255, 0, 0, 0),
          width: 2,
        ),
      ),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return HeadsCard(
            info: HeadsCardsInfo(
              Title: _HeadsCardListViewState.main[index],
              image: AssetImage(
                  "assets/images/${_HeadsCardListViewState.main[index].toLowerCase()}.jpeg"),
              function: _HeadsCardListViewState.fun[index],
              refreshFunction: refreshFunction,
            ),
          );
        },
        scrollDirection: Axis.horizontal,
        itemCount: _HeadsCardListViewState.main.length,
        physics: const BouncingScrollPhysics(),
      ),
    );
  }
}
