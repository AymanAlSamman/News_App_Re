import 'package:flutter/material.dart';
import 'package:news_app_re/core/config/constants.dart';
import 'package:news_app_re/models/ArticlesDataModel.dart';

class ArticlesItemWidget extends StatelessWidget {
  final Articles article;

  const ArticlesItemWidget({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white.withOpacity(0.5),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // FastCachedImage(
          //   url: article.urlToImage ?? "",
          //
          // ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.network(article.urlToImage ?? ""),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              article.source?.name ?? "",
              textAlign: TextAlign.start,
              style: Constants.theme.textTheme.bodySmall?.copyWith(
                color: const Color(0xff79828B),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            child: Text(
              article.title?? "",
              textAlign: TextAlign.start,
              style: Constants.theme.textTheme.bodyMedium?.copyWith(
                color: Colors.black,
                height: 1.2,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            child: Text(
              article.publishedAt ?? "",
              textAlign: TextAlign.end,
              style: Constants.theme.textTheme.bodySmall?.copyWith(
                color: Colors.black,
                height: 1.2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
