import 'package:flutter/material.dart';
import 'package:news_app_re/core/config/constants.dart';
import 'package:news_app_re/core/network/api_manager.dart';
import 'package:news_app_re/home/widget/custom_background_widget.dart';
import 'package:news_app_re/models/category_model.dart';

class CategoryView extends StatelessWidget {
  final CategoryModel categoryModel;

  const CategoryView({
    super.key,
    required this.categoryModel,
  });

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundWidget(
      child: FutureBuilder(
        future: ApiManager.fetchDataSources(categoryModel.id),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("same thing went wrong"),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          var sourcesList = snapshot.data ?? [];
          return Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => Text(
                sourcesList[index].name,
                style: Constants.theme.textTheme.bodyLarge
                    ?.copyWith(color: Colors.black),
              ),
              itemCount: sourcesList.length,
            ),
          );
        },
      ),
    );
  }
}
