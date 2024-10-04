import 'package:flutter/material.dart';
import 'package:show_bazzar/Widgets/promo_slider_for_detail_screen.dart';
import 'package:show_bazzar/core/utils/constants/image_strings.dart';

class TDetailProductImageSlider extends StatelessWidget {
  const TDetailProductImageSlider({
    super.key,
    required this.list,

  });
  final List<String> list;

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        TDetailPromoSlider(

          width: 420,
          height: 400,

          banners: [
            list[0],
            list[0],
            list[0],
            list[0],
          ],
        ),
        ///small slider
        // Positioned(
        //   right: 0,
        //   bottom: 30,
        //   child: SizedBox(
        //     height: 80,
        //     child: ListView.separated(
        //       itemCount: 6,
        //       shrinkWrap: true,
        //       scrollDirection: Axis.horizontal,
        //       physics: const AlwaysScrollableScrollPhysics(),
        //       separatorBuilder: (_, __) => const SizedBox(
        //         width: TSizes.spaceBtwItems,
        //       ),
        //       itemBuilder: (_, index) => TRoundedImage(
        //         imageUrl: TImages.productImage3,
        //         width: 70,
        //         backgroundColor: TColors.primary,
        //         border: Border.all(color: TColors.primary),
        //         padding: const EdgeInsets.all(TSizes.sm), borderRadius: 24,
        //       ),
        //     ),
        //   ),
        // ),
        // const TAppBar(
        //   showBackArrow: true,
        //   actions: [
        //     TCircularIcon(
        //       icon: Iconsax.heart5,
        //       color: Colors.red,
        //     )
        //   ],
        // ),
      ],
    );
  }
}