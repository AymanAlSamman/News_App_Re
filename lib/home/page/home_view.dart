import 'package:flutter/material.dart';
import 'package:news_app_re/core/config/constants.dart';
import 'package:news_app_re/home/widget/category_view.dart';
import 'package:news_app_re/home/widget/custom_background_widget.dart';
import 'package:news_app_re/home/widget/custom_drawer.dart';
import 'package:news_app_re/home/widget/custom_item_widget.dart';
import 'package:news_app_re/main.dart';
import 'package:news_app_re/models/category_model.dart';

class HomeView extends StatefulWidget {
  static const String routeName = 'Home';

  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<CategoryModel> categoriesList = [
    CategoryModel(
      id: 'sport',
      title: 'Sport',
      image: 'assets/images/sports.png',
      backgroundColor: const Color(0xffC91C22),
    ),
    CategoryModel(
      id: 'politics',
      title: 'Politics',
      image: 'assets/images/politics.png',
      backgroundColor: const Color(0xff003E90),
    ),
    CategoryModel(
      id: 'health',
      title: 'Health',
      image: 'assets/images/health.png',
      backgroundColor: const Color(0xffED1E79),
    ),
    CategoryModel(
      id: 'business',
      title: 'Business',
      image: 'assets/images/business.png',
      backgroundColor: const Color(0xffCF7E48),
    ),
    CategoryModel(
      id: 'environment',
      title: 'Environment',
      image: 'assets/images/environment.png',
      backgroundColor: const Color(0xff4882CF),
    ),
    CategoryModel(
      id: 'science',
      title: 'Science',
      image: 'assets/images/science.png',
      backgroundColor: const Color(0xffF2D352),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundWidget(
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 80,
          title: Text(
            selectedCategory == null ? 'News App' : selectedCategory!.title,
            style: Constants.theme.textTheme.titleLarge,
          ),
        ),
        drawer: CustomDrawer(onCategoryDrawerTap: onCategoryDrawerClick),
        body: selectedCategory == null
            ? Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Pick your category\nof interest',
                      textAlign: TextAlign.start,
                      style: Constants.theme.textTheme.bodyLarge?.copyWith(
                        color: Colors.black,
                        height: 1.5,
                      ),
                    ),
                    Expanded(
                      child: GridView.builder(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        ),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 20,
                                crossAxisSpacing: 20,
                                childAspectRatio: 4 / 5),
                        itemBuilder: (context, index) => CustomItemWidget(
                          index: index,
                          categoryModel: categoriesList[index],
                          onCategoryClicked: onCategoryClicked,
                        ),
                        itemCount: 6,
                      ),
                    ),
                  ],
                ),
              )
            : CategoryView(),
      ),
    );
  }

  CategoryModel? selectedCategory;

  void onCategoryClicked(CategoryModel categoryModel) {
    selectedCategory = categoryModel;
    print(categoryModel.id);
    setState(() {});
  }

  void onCategoryDrawerClick() {
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {});
  }
}
