import 'package:flutter/material.dart';
import 'package:news_app_re/home/widget/tab_item_widget.dart';

import '../../models/source_model.dart';

class NewsListWidget extends StatefulWidget {
  final List<SourceModel> sourcesList;

  const NewsListWidget({
    super.key,
    required this.sourcesList,
  });

  @override
  State<NewsListWidget> createState() => _NewsListWidgetState();
}

class _NewsListWidgetState extends State<NewsListWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: widget.sourcesList.length,
          initialIndex: selectedIndex,
          child: TabBar(
            onTap: (value) {
              selectedIndex = value;
              setState(() {});
            },
            isScrollable: true,
            padding: const EdgeInsets.symmetric(vertical: 8),
            indicator: const BoxDecoration(),
            dividerColor: Colors.transparent,
            labelPadding: const EdgeInsets.symmetric(horizontal: 6),
            tabs: widget.sourcesList
                .map(
                  (e) => TabItemWidget(
                    sourceModel: e,
                    isSelected: selectedIndex == widget.sourcesList.indexOf(e),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
