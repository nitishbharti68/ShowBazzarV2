// import 'package:flutter/material.dart';
// import 'package:input_quantity/input_quantity.dart';
// import 'package:show_bazzar/Screens/congrats_screen.dart';
// import 'package:show_bazzar/Widgets/Common%20Widgets/section_heading.dart';
// import 'package:show_bazzar/core/utils/constants/colors.dart';
// import 'package:show_bazzar/core/utils/constants/sizes.dart';
//
// import '../Widgets/Product/product_price_text.dart';
//
// class NegotiatePriceScreen extends StatefulWidget {
//   const NegotiatePriceScreen({Key? key}) : super(key: key);
//
//   @override
//   State<NegotiatePriceScreen> createState() => _NegotiatePriceScreenState();
// }
//
// class _NegotiatePriceScreenState extends State<NegotiatePriceScreen> {
//   @override
//   Widget build(BuildContext context) {
//     var counter = 3;
//     var actualPrice = 300;
//     final Function() checkBid;
//     return Padding(
//       padding: const EdgeInsets.all(TSizes.md),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const SizedBox(
//             height: TSizes.spaceBtwItems * 2,
//           ),
//           Text(
//             'Nike Air Zoom Quest Structure 23',
//             style: Theme.of(context).textTheme.headlineMedium!.copyWith(
//                   color: Colors.blue.shade900,
//                   fontWeight: FontWeight.w600,
//                 ),
//           ),
//           const SizedBox(
//             height: TSizes.spaceBtwItems,
//           ),
//           const Row(
//             children: [
//               TSectionHeading(
//                 title: 'Price: ',
//                 showActionButton: false,
//               ),
//               SizedBox(
//                 width: TSizes.spaceBtwItems / 2,
//               ),
//               TProductPriceText(
//                 price: '550',
//                 isLarge: false,
//               ),
//             ],
//           ),
//           const SizedBox(
//             height: TSizes.spaceBtwItems,
//           ),
//           const Row(
//             children: [
//               TSectionHeading(
//                 title: 'Quantity: ',
//                 showActionButton: false,
//               ),
//               SizedBox(
//                 width: TSizes.spaceBtwItems / 2,
//               ),
//               InputQty.int(
//                 maxVal: 10,
//                 minVal: 0,
//                 steps: 1,
//                 initVal: 0,
//                 //decoration: QtyDecorationProps(borderShape: BorderShapeBtn.circle),
//               )
//             ],
//           ),
//           const SizedBox(
//             height: TSizes.spaceBtwItems,
//           ),
//           Row(
//             children: [
//               if (counter == 3)
//                 Row(
//                   children: [
//                     const Text('Attempts Remaining: '),
//                     Text(counter.toString()),
//                   ],
//                 ),
//               if (counter <= 2)
//                 Row(
//                   children: [
//                      const Text('Attempts Remaining: ', style: TextStyle(color: Colors.red),),
//                     Text(counter.toString(), style: const TextStyle(color: Colors.red),),
//                   ],
//                 )
//             ],
//           ),
//           const SizedBox(
//             height: TSizes.spaceBtwItems,
//           ),
//           const Row(
//             children: [
//               TSectionHeading(
//                 title: 'Bidding Price: ',
//                 showActionButton: false,
//               ),
//               SizedBox(
//                 width: TSizes.spaceBtwItems / 2,
//               ),
//               InputQty.int(
//                 initVal: 550,
//                 steps: 10,
//               )
//             ],
//           ),
//            SizedBox(
//              height: TSizes.spaceBtwItems,
//            ),
//            Center(
//             child: SizedBox(
//               child: ElevatedButton(
//                 onPressed: () {
//                   counter--;
//                   Navigator.of(context).push(
//                     MaterialPageRoute(
//                       builder: (ctx) => const CongratsScreen(),
//                     ),
//                   );;
//                 },
//                 child: Text('Bid Price'),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:show_bazzar/Screens/congrats_screen.dart';
import 'package:show_bazzar/core/utils/constants/sizes.dart';
import '../Widgets/Product/product_price_text.dart';

class NegotiatePriceScreen extends StatefulWidget {
  const NegotiatePriceScreen({Key? key}) : super(key: key);

  @override
  State<NegotiatePriceScreen> createState() => _NegotiatePriceScreenState();
}

class _NegotiatePriceScreenState extends State<NegotiatePriceScreen> {
  int counter = 3;
  final int actualPrice = 550;
  int? biddingPrice;

  void checkBid() {
    if (biddingPrice != null && biddingPrice! > actualPrice) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => const CongratsScreen(),
        ),
      );
    } else {
      if (counter > 0) {
        setState(() {
          counter--;
        });
        if (counter == 0) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Bid Failed'),
                content: const Text('You have exhausted all your attempts.'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            },
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(TSizes.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: TSizes.spaceBtwItems * 2),
            Text(
              'Nike Air Zoom Quest Structure 23',
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Colors.blue.shade900,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            Row(
              children: [
                Text(
                  'Price: ',
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(width: TSizes.spaceBtwItems / 2),
                TProductPriceText(
                  price: actualPrice.toString(),
                  isLarge: false,
                ),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            Row(
              children: [
                Text(
                  'Attempts Remaining: ',
                  style: TextStyle(color: counter > 0 ? Colors.black : Colors.red),
                ),
                Text(
                  '$counter',
                  style: TextStyle(color: counter > 0 ? Colors.black : Colors.red),
                ),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            Row(
              children: [
                Text(
                  'Bidding Price: ',
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(width: TSizes.spaceBtwItems / 2),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        biddingPrice = int.tryParse(value);
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: TSizes.spaceBtwItems),
            Center(
              child: SizedBox(
                child: ElevatedButton(
                  onPressed: counter > 0 ? checkBid : null,
                  child: Text('Bid Price'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
