// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';

class HeadsCardsInfo {
  String Title;
  ImageProvider image;
  Future<void> Function() function;
  Function() refreshFunction;
  HeadsCardsInfo({
    required this.Title,
    required this.image,
    required this.function,
    required this.refreshFunction,
  });
}
