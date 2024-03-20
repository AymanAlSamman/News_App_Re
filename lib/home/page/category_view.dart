import 'package:flutter/material.dart';
import 'package:news_app_re/core/config/constants.dart';
import 'package:news_app_re/core/network/api_manager.dart';
import 'package:news_app_re/home/widget/custom_background_widget.dart';
import 'package:news_app_re/home/widget/news_list_widget.dart';
import 'package:news_app_re/home/widget/tab_item_widget.dart';
import 'package:news_app_re/models/category_model.dart';

class CategoryView extends StatefulWidget {
  final CategoryModel categoryModel;

  const CategoryView({
    super.key,
    required this.categoryModel,
  });

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundWidget(
      child: FutureBuilder(
        future: ApiManager.fetchDataSources(widget.categoryModel.id),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text("same thing went wrong"),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }

          var sourcesList = snapshot.data ?? [];
          return NewsListWidget(sourcesList: sourcesList);
        },
      ),
    );
  }
}
