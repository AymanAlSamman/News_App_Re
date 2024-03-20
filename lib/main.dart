import 'package:flutter/material.dart';
import 'package:news_app_re/core/config/applocation_theme_manager.dart';
import 'package:news_app_re/home/page/home_view.dart';
import 'package:news_app_re/pages/splash/splash_view.dart';
GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      theme: ApplicationThemeManager.applicationThemeData,
      initialRoute: SplashView.routeName,
      routes: {
        SplashView.routeName : (context) => const SplashView(),
        HomeView.routeName : (context) => const HomeView(),
      },
      navigatorKey: navigatorKey,

    );
  }
}


