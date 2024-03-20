import 'package:flutter/material.dart';
import 'package:news_app_re/core/config/constants.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Constants.mediaQuery.width * 0.7,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            color: Constants.theme.primaryColor,
            height: 130,
            child: Center(
              child: Text(
                "News App !",
                style: Constants.theme.textTheme.titleLarge,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 20, left: 15),
            child: Row(
              children: [
                const Icon(
                  Icons.list,
                  size: 35,
                  color: Colors.black,
                ),
                const SizedBox(width: 5,),
                Text(
                  "Categories",
                  style: Constants.theme.textTheme.bodyLarge?.copyWith(
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),


          Padding(
            padding: const EdgeInsets.only(top: 7, left: 15),
            child: Row(
              children: [
                const Icon(
                  Icons.settings,
                  size: 35,
                  color: Colors.black,
                ),
                const SizedBox(width: 5,),
                Text(
                  "Settings",
                  style: Constants.theme.textTheme.bodyLarge?.copyWith(
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
