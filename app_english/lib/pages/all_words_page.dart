import 'package:app_english/models/english_today.dart';
import 'package:app_english/values/app_assets.dart';
import 'package:app_english/values/app_colors.dart';
import 'package:flutter/material.dart';

import '../values/app_styles.dart';

class AllWordsPage extends StatelessWidget {
  final List<EnglishToday> words;
  const AllWordsPage({Key? key, required this.words}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.secondColor,
          elevation: 0,
          title: Text('English today',
              style: AppStyles.h3
                  .copyWith(color: AppColors.textColor, fontSize: 32)),
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(AppAssets.leftArrow),
          )),
      body: ListView.builder(
          itemCount: words.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  color: (index % 2) == 0
                      ? AppColors.primaryColor
                      : AppColors.secondColor),
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                title: Text(
                  words[index].noun!,
                  style: (index % 2) == 0
                      ? AppStyles.h4
                      : AppStyles.h4.copyWith(color: AppColors.textColor),
                ),
                subtitle: Text(words[index].quote ??
                    '"Think of all the beauty still left around you and be happy"'),
                leading: Icon(
                  Icons.favorite,
                  color: words[index].isFavorite ? Colors.red : Colors.grey,
                ),
              ),
            );
          }),
    );
  }
}
