import 'package:flutter/material.dart';
import 'package:show_bazzar/Widgets/Common%20Widgets/section_heading.dart';
import 'package:show_bazzar/Widgets/Product/product_title_text.dart';
import 'package:show_bazzar/core/utils/constants/sizes.dart';
import 'package:show_bazzar/core/utils/helpers/helper_functions.dart';

import '../../../../../Widgets/Common Widgets/trounded_container.dart';
import '../../../../../Widgets/chips/choice_chip.dart';
import '../../../../../core/utils/constants/colors.dart';

class TProductAttributes extends StatefulWidget {
  const TProductAttributes({Key? key}) : super(key: key);

  @override
  _TProductAttributesState createState() => _TProductAttributesState();
}

class _TProductAttributesState extends State<TProductAttributes> {
  int _selectedColorIndex = -1;
  int _selectedSizeIndex = -1;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Column(
      children: [
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        Container(
          padding: const EdgeInsets.all(TSizes.md),
          color: dark ? TColors.darkerGrey : TColors.grey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const TProductTitleText(
                    title: 'Stock : ',
                    smallSize: true,
                  ),
                  Text(
                    'In Stock',
                    style: Theme.of(context).textTheme.titleMedium,
                  )
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),

        ///Attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(
              title: 'Colors',
              showActionButton: false,
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(
                  text: 'Green',
                  selected: _selectedColorIndex == 0,
                  onSelected: () {
                    setState(() {
                      _selectedColorIndex = 0;
                    });
                  },
                ),
                TChoiceChip(
                  text: 'Blue',
                  selected: _selectedColorIndex == 1,
                  onSelected: () {
                    setState(() {
                      _selectedColorIndex = 1;
                    });
                  },
                ),
                TChoiceChip(
                  text: 'Yellow',
                  selected: _selectedColorIndex == 2,
                  onSelected: () {
                    setState(() {
                      _selectedColorIndex = 2;
                    });
                  },
                ),
                TChoiceChip(
                  text: 'Red',
                  selected: _selectedColorIndex == 3,
                  onSelected: () {
                    setState(() {
                      _selectedColorIndex = 3;
                    });
                  },
                ),
              ],
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(
              title: 'Size',
              showActionButton: false,
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(
                  text: 'EU 34',
                  selected: _selectedSizeIndex == 0,
                  onSelected: () {
                    setState(() {
                      _selectedSizeIndex = 0;
                    });
                  },
                ),
                TChoiceChip(
                  text: 'EU 36',
                  selected: _selectedSizeIndex == 1,
                  onSelected: () {
                    setState(() {
                      _selectedSizeIndex = 1;
                    });
                  },
                ),
                TChoiceChip(
                  text: 'EU 38',
                  selected: _selectedSizeIndex == 2,
                  onSelected: () {
                    setState(() {
                      _selectedSizeIndex = 2;
                    });
                  },
                ),
                TChoiceChip(
                  text: 'EU 40',
                  selected: _selectedSizeIndex == 3,
                  onSelected: () {
                    setState(() {
                      _selectedSizeIndex = 3;
                    });
                  },
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
