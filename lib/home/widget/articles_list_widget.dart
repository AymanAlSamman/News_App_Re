import 'package:flutter/material.dart';
import 'package:news_app_re/home/widget/articles_item_widget.dart';

class ArticlesListWidget extends StatelessWidget {
  const ArticlesListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder:(context, index) =>  ArticlesItemWidget());
  }
}
