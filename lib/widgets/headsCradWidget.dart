// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, file_names, no_logic_in_create_state
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:news_app/modules/headCardInfo.dart';
import 'package:news_app/services/newsApiService.dart';
import 'package:news_app/views/HomePage.dart';

class HeadsCard extends StatefulWidget {
  HeadsCardsInfo info;

  HeadsCard({required this.info});

  @override
  State<HeadsCard> createState() => _HeadsCardState();
}

class _HeadsCardState extends State<HeadsCard> {
  final Connectivity _connect = Connectivity();
  static Function restoreInternet = NewsApiService.getGeneralNews;
  @override
  void initState() {
    super.initState();
    checkRealTime();
  }

  void checkRealTime() {
    _connect.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.wifi ||
          event == ConnectivityResult.mobile) {
        restoreInternet();
      }
    });
  }

  Future<void> newMethod() async {
    widget.info.refreshFunction();
    await widget.info.function();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //initState();
        HomePageState.headTitle = widget.info.Title;
        restoreInternet = newMethod;

        NewsApiService.cahngeLoding = 0;
        newMethod();
      },
      child: Container(
        height: MediaQuery.of(context).size.height / 5.8,
        width: MediaQuery.of(context).size.width / 2.5,
        alignment: Alignment.center,
        margin: const EdgeInsets.only(top: 10, right: 6, left: 6, bottom: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(image: widget.info.image, fit: BoxFit.fill),
        ),
        child: Text(
          widget.info.Title,
          style: const TextStyle(
            color: Color.fromARGB(255, 198, 198, 198),
            fontSize: 22,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                  color: Colors.black, blurRadius: 0.5, offset: Offset(0.5, 1))
            ],
          ),
        ),
      ),
    );
  }
}
