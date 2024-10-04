import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:show_bazzar/Screens/product_detail_screen.dart';
import 'package:show_bazzar/Settings/classes/categories_structure.dart';
import 'package:show_bazzar/Settings/classes/top_stores_structure.dart';
import 'package:show_bazzar/Settings/company_details/widgets/image_container.dart';
import 'package:show_bazzar/Settings/global_vaiables.dart';
import 'package:show_bazzar/Settings/home/widgets/filter_bottom_sheet.dart';
import 'package:show_bazzar/Widgets/Common%20Widgets/trounded_container.dart';
import 'package:show_bazzar/Widgets/Common%20Widgets/trounded_image.dart';
import 'package:show_bazzar/Widgets/Home%20Page/categories_slider.dart';
import 'package:show_bazzar/Widgets/Product/product_card_horizontal.dart';
import 'package:show_bazzar/Widgets/main_drawer.dart';
import 'package:show_bazzar/features/shop/screen/home/widgets/promo_slider.dart';

import '../../Widgets/sort_Widget.dart';

class BrandScreen2 extends StatelessWidget {
  static const routeName = '/company-detail-screen';
  const BrandScreen2({
    this.topCategories,
    this.topStores,
    this.list,
    Key? key,
  }) : super(key: key);
  final TopStores? topStores;
  final TopCategories? topCategories;
  final List<String>? list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: backGroundColor,
        title: Text(
          topCategories == null
              ? topStores == null
                  ? 'Temp'
                  : topStores!.storeName
              : topCategories!.categoryName,
          style: const TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 40,
            width: 90,
            child: FloatingActionButton.extended(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return FilterBottomSheet();
                  },
                );
              },
              label: const Text(
                'Filter',
                style: TextStyle(fontSize: 15),
              ),
              icon: const Icon(
                Icons.filter_alt_outlined,
                size: 20,
              ),
            ),
          ),
          const SizedBox(width: 16), // Add some space between the buttons
          SizedBox(
            height: 40,
            width: 90,
            child: FloatingActionButton.extended(
              onPressed: () {
                // Add onPressed action for the second floating action button
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return SortWidget();
                  },
                );
              },
              label: const Text(
                'Sort',
                style: TextStyle(fontSize: 15),
              ),
              icon: const Icon(
                Icons.sort_outlined,
                size: 20,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // const SizedBox(height: 25),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 20),
            //   child: Container(
            //     height: 200,
            //     width: double.infinity,
            //     decoration: BoxDecoration(
            //       color: Colors.white,
            //       borderRadius: BorderRadius.circular(20),
            //     ),
            //   ),
            // ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Text(
                      //   'Top Trending',
                      //   style: TextStyle(
                      //       color: Colors.white,
                      //       fontSize: 20,
                      //       fontWeight: FontWeight.w500),
                      // ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) =>  ProductDetailScreen(list: list!),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 30,
                              childAspectRatio: 0.6),
                      itemCount: topCategories == null
                          ? topStores == null
                              ? 5
                              : topStores!.storeImages.length
                          : topCategories!.categoryImages.length,
                      itemBuilder: (context, index) {
                        return LayoutBuilder(
                          builder: (BuildContext context,
                              BoxConstraints constraints) {
                            return GridImageEditer(
                              imageAddress: topCategories == null
                                  ? topStores == null
                                      ? 'https://th.bing.com/th/id/OIP.2kuONkNHcwQ2y7DTyoiX8AHaHa?rs=1&pid=ImgDetMain'
                                      : topStores!.storeImages[index][0]
                                  : topCategories!.categoryImages[index][0],
                              size: constraints,
                              name: topCategories == null
                                  ? topStores == null
                                  ? 'temp'
                                  : topStores!.storeImages[index][1]
                                  : topCategories!.categoryImages[index][1],
                              price: topCategories == null
                                  ? topStores == null
                                  ? '0'
                                  : topStores!.storeImages[index][2]
                                  : topCategories!.categoryImages[index][2],
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class ProductCardVertical extends StatelessWidget {
//   const ProductCardVertical({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         // Navigator.of(context).push(
//         //   MaterialPageRoute(
//         //     builder: (ctx) => const ProductDetailScreen(list),
//         //   ),
//         // );
//       },
//       child: Container(
//         width: 180,
//         padding: const EdgeInsets.all(1),
//         decoration: BoxDecoration(
//           color: Colors.red,
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: Column(
//           children: [
//             //Thumbnail, wishlist, discount tag
//             TRoundedContainer(
//               height: 180,
//               padding: 10,
//               radius: 20,
//               child: Stack(
//                 children: [
//                   TRoundedImage(
//                     width: 100,
//                     height: 100,
//                     imageUrl: 'images/shoes.png',
//                     backgroundColor: Colors.grey.shade400,
//                     borderRadius: 24,
//                     heading: heading,
//                   ),
//                   TRoundedContainer(
//                     radius: 10,
//                     backgroundColor: Colors.yellow.withOpacity(0.7),
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
