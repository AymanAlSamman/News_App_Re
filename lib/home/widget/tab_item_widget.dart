import 'package:flutter/material.dart';
import 'package:news_app_re/core/config/constants.dart';
import 'package:news_app_re/models/source_model.dart';

class TabItemWidget extends StatelessWidget {
  final SourceModel sourceModel;
  bool isSelected;

  TabItemWidget({
    super.key,
    required this.sourceModel,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
      decoration: BoxDecoration(
        color: isSelected ? Constants.theme.primaryColor : Colors.transparent,
        border: Border.all(
          color: Constants.theme.primaryColor,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Text(
        sourceModel.name,
        style: Constants.theme.textTheme.bodyMedium?.copyWith(
          color: isSelected ? Colors.white : Constants.theme.primaryColor,
        ),
      ),
    );
  }
}
