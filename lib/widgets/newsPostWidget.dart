// ignore_for_file: file_names, use_key_in_widget_constructors, must_be_immutable, unnecessary_const
import 'package:flutter/material.dart';
import 'package:news_app/modules/newPostInfo.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsPost extends StatelessWidget {
  NewsPostInfo info;
  NewsPost({required this.info});
  _launchURL() async {
    String url = info.url;
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _launchURL();
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: const Color.fromARGB(255, 0, 0, 0),
            width: 2,
          ),
        ),
        padding: const EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                info.imagePath,
                height: 250,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(3),
              child: Text(
                info.mainTitle,
                textDirection: TextDirection.rtl,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 241, 217, 0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(3),
              child: Text(
                info.subText,
                textDirection: TextDirection.rtl,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
