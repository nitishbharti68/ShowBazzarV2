import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:show_bazzar/Screens/product_detail_screen.dart';
import 'package:show_bazzar/Settings/home/widgets/sort_bottom_sheet.dart';
import 'package:show_bazzar/Widgets/Common%20Widgets/trounded_container.dart';
import 'package:show_bazzar/Widgets/Common%20Widgets/trounded_image.dart';
import 'package:show_bazzar/Widgets/Home%20Page/categories_slider.dart';
import 'package:show_bazzar/Widgets/Product/product_card_horizontal.dart';
import 'package:show_bazzar/Widgets/main_drawer.dart';
import 'package:show_bazzar/Widgets/sort_Widget.dart';
import 'package:show_bazzar/features/shop/screen/home/widgets/promo_slider.dart';

import '../Settings/company_details/widgets/image_container.dart';
import '../Settings/company_details/widgets/shoes_image_builder.dart';
import '../Settings/global_vaiables.dart';
import '../Settings/home/widgets/filter_bottom_sheet.dart';

class BrandScreen extends StatelessWidget {
  static const routeName = '/company-detail-screen';
  const BrandScreen({
    required this.list,
    required this.heading,
    Key? key,
  }) : super(key: key);
  final List<List<String>> list;
  final String heading;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: backGroundColor,
        title:  Text(
          heading,
          style: TextStyle(color: Colors.white),
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
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                child: ClipRRect( borderRadius: BorderRadius.circular(20) , child: Image.network('https://qph.cf2.quoracdn.net/main-qimg-51fc1be5da31cc903e7d80d267003dbf' , fit: BoxFit.cover,)),
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
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
                      Text(
                        'Top Trending',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                      // Text(
                      //   'See All',
                      //   style: TextStyle(
                      //       color: Colors.grey,
                      //       fontSize: 20,
                      //       fontWeight: FontWeight.w300),
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
                          builder: (ctx) =>  ProductDetailScreen(list: list[0],),
                        ),
                      );
                    },
                    child: CarouselSlider.builder(
                      itemCount: 4, // Change this to your desired count
                      options: CarouselOptions(height: 180),
                      itemBuilder: (context, index, realIndex) {
                        // You can replace this with your actual item builder
                        return ShoesImageBuilder(image: list[index][0]);
                      },
                    ),
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
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        return LayoutBuilder(
                          builder: (BuildContext context,
                              BoxConstraints constraints) {
                            return GridImageEditer(
                              imageAddress: list[index][0],
                              size: constraints,
                              name: list[index][1],
                              price: list[index][2],
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
//
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
