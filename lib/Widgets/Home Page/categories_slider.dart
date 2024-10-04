import 'package:flutter/material.dart';
import 'package:show_bazzar/Settings/classes/categories_structure.dart';
import 'package:show_bazzar/Settings/classes/top_stores_structure.dart';
import 'package:show_bazzar/Settings/global_vaiables.dart';

import '../vertical_image_text.dart';

class TCategoriesSlide extends StatelessWidget {
  const TCategoriesSlide({
    super.key,
    required this.radius,
    required this.height,
    required this.width,
    required this.heighttext,
    required this.title,
  });
  final double radius;
  final double height, width, heighttext;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heighttext,
      child: ListView.builder(
          itemCount: topCategoriesList.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: TVerticalImageText(
                height: height,
                width: width,
                radius: radius,
                image: listTopCategories[index],
                title: title,
                onTap: () {},
                topCategories: topCategoriesList[index],
              ),
            );
          }),

    );
  }
}
