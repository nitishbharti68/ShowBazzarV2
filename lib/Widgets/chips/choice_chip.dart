import 'package:flutter/material.dart';
import 'package:show_bazzar/core/utils/helpers/helper_functions.dart';

import '../../core/utils/constants/colors.dart';
import '../Common Widgets/trounded_container.dart';

class TChoiceChip extends StatelessWidget {
  const TChoiceChip({
    Key? key,
    required this.text,
    required this.selected,
    required this.onSelected,
  }) : super(key: key);

  final String text;
  final bool selected;
  final VoidCallback onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor = THelperFunctions.getColor(text) != null;
    return ChoiceChip(
      label: isColor ? const SizedBox() : Text(text),
      selected: selected,
      onSelected: (_) => onSelected(),
      labelStyle: TextStyle(color: selected ? TColors.white : null),
      avatar: isColor
          ? TRoundedContainer(
        width: 50,
        height: 50,
        backgroundColor: THelperFunctions.getColor(text)!,
      )
          : null,
      labelPadding: isColor ? const EdgeInsets.all(0) : null,
      padding: isColor ? const EdgeInsets.all(0) : null,
      shape: isColor ? const CircleBorder() : null,
      backgroundColor: isColor ? THelperFunctions.getColor(text)! : null,
    );
  }
}