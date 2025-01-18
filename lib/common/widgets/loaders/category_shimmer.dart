import 'package:flutter/material.dart';
import 'package:e_commerce/common/widgets/loaders/shimmer.dart';
import 'package:e_commerce/utils/constraints/sizes.dart';

class TCategoryShimmer extends StatelessWidget {
  const TCategoryShimmer({super.key, this.itemCount = 6});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
          itemCount: itemCount,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (_, __) =>
              const SizedBox(width: TSizes.spaceBtwItems),
          itemBuilder: (_, __) {
            return const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///image
                TShimmerEffect(width: 55, height: 55, radius: 55),
                SizedBox(width: TSizes.spaceBtwItems / 2),

                ///text
                TShimmerEffect(width: 55, height: 8),
              ],
            );
          }),
    );
  }
}
