import 'package:flutter/material.dart';
import 'package:news_app_re/main.dart';

class Constants {

  static var mediaQuery = MediaQuery.of(navigatorKey.currentState!.context).size;
  static var theme = Theme.of(navigatorKey.currentState!.context);

  static const String apiKey = "e6156b42aff94100b32f6983d38d1887";
  static const String baseUrl = "newsapi.org";

}