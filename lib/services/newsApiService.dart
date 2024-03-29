// ignore_for_file: file_names, avoid_print, empty_catches

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:news_app/modules/newPostInfo.dart';
import 'package:news_app/widgets/body_view.dart';

class NewsApiService {
  static const _apiKey = '2b19bc22ed9442ed8f4fe6055255e50e';
  static final Dio _dio = Dio();
  static List<NewsPostInfo> postsDataList = [];
  static List<dynamic>? _dataNewsList = [];
  static late BodyView ref;
  static int internet = 0;
  static int cahngeLoding = 0;
  static Function x = () {};
  static _checkConnection() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        internet = 1;
      }
    } on SocketException catch (_) {
      internet = 0;
    }
  }

  static Future<List<NewsPostInfo>> getGeneralNews() async {
    await _checkConnection();
    if (internet == 1) {
      try {
        Response response = await _dio.get(
          "https://newsapi.org/v2/everything?q=%D8%B9%D8%A7%D9%85%D8%A9&apiKey=$_apiKey&sortBy=publishedAt&language=ar",
        );
        var jsonData = response.data;
        if (jsonData['status'] == "ok") {
          _dataNewsList = jsonData["articles"];
          _fillDataIntoPostList();
        }
      } catch (e) {}
    }
    return postsDataList;
  }

  static Future<List<NewsPostInfo>> getSportsNews() async {
    await _checkConnection();
    if (internet == 1) {
      try {
        Response response = await _dio.get(
          "https://newsapi.org/v2/everything?q=sports&apiKey=$_apiKey&language=ar&sortBy=publishedAt",
        );
        var jsonData = response.data;
        if (jsonData['status'] == "ok") {
          _dataNewsList = jsonData["articles"];
          _fillDataIntoPostList();
        }
      } catch (e) {}
    }
    return postsDataList;
  }

  static Future<List<NewsPostInfo>> getEBusinessNews() async {
    await _checkConnection();
    if (internet == 1) {
      try {
        Response response = await _dio.get(
          "https://newsapi.org/v2/everything?q=%D8%A7%D9%82%D8%AA%D8%B5%D8%A7%D8%AF&sortBy=publishedAt&apiKey=$_apiKey&language=ar",
        );
        var jsonData = response.data;
        if (jsonData['status'] == "ok") {
          _dataNewsList = jsonData["articles"];
          _fillDataIntoPostList();
        }
      } catch (e) {}
    }
    return postsDataList;
  }

  static Future<List<NewsPostInfo>> getSciencesNews() async {
    await _checkConnection();
    if (internet == 1) {
      try {
        Response response = await _dio.get(
          "https://newsapi.org/v2/everything?q=Sciences&sortBy=publishedAt&language=ar&apiKey=$_apiKey",
        );
        var jsonData = response.data;
        if (jsonData['status'] == "ok") {
          _dataNewsList = jsonData["articles"];
          _fillDataIntoPostList();
        }
      } catch (e) {}
    }
    return postsDataList;
  }

  static Future<List<NewsPostInfo>> getHealthNews() async {
    await _checkConnection();
    if (internet == 1) {
      try {
        Response response = await _dio.get(
          "https://newsapi.org/v2/everything?q=Health&sortBy=publishedAt&language=ar&apiKey=$_apiKey",
        );
        var jsonData = response.data;
        if (jsonData['status'] == "ok") {
          _dataNewsList = jsonData["articles"];
          _fillDataIntoPostList();
        }
      } catch (e) {}
    }
    return postsDataList;
  }

  static Future<List<NewsPostInfo>> getTechnologyNews() async {
    await _checkConnection();
    if (internet == 1) {
      try {
        Response response = await _dio.get(
          "https://newsapi.org/v2/everything?q=tech&sortBy=publishedAt&language=ar&apiKey=$_apiKey",
        );
        var jsonData = response.data;
        if (jsonData['status'] == "ok") {
          _dataNewsList = jsonData["articles"];
          _fillDataIntoPostList();
        }
      } catch (e) {}
    }
    return postsDataList;
  }

  static Future<List<NewsPostInfo>> getWarsNews() async {
    await _checkConnection();
    if (internet == 1) {
      try {
        Response response = await _dio.get(
          "https://newsapi.org/v2/everything?q=%D8%AD%D8%B1%D8%A8&language=ar&apiKey=$_apiKey&sortBy=publishedAt",
        );
        var jsonData = response.data;
        if (jsonData['status'] == "ok") {
          _dataNewsList = jsonData["articles"];
          _fillDataIntoPostList();
        }
      } catch (e) {}
    }
    return postsDataList;
  }

  static void _fillDataIntoPostList() {
    postsDataList = [];
    for (var element in _dataNewsList!) {
      postsDataList.add(
        NewsPostInfo(
          mainTitle: element['title'] ?? '',
          subText: element['description'] ?? '',
          imagePath: element['urlToImage'] ??
              'https://st4.depositphotos.com/14953852/24787/v/450/depositphotos_247872612-stock-illustration-no-image-available-icon-vector.jpg',
          url: element['url'] ?? 'www.google.com',
        ),
      );
    }

    _dataNewsList = [];
    NewsApiService.cahngeLoding = 1;
    x();
  }
}
