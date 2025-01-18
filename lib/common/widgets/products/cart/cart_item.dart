import 'package:flutter/material.dart';
import 'package:e_commerce/common/widgets/images/t_rounded_image.dart';
import 'package:e_commerce/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:e_commerce/utils/constraints/colors.dart';
import 'package:e_commerce/utils/constraints/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ///image
        TRoundedImage(
          imageUrl:
              'https://jdsports.id/_next/image?url=https%3A%2F%2Fimages.jdsports.id%2Fi%2Fjpl%2Fjd_DV0788-001_a%3Fw%3D700%26resmode%3Dsharp%26qlt%3D70%26fmt%3Dwebp&w=2048&q=75',
          width: 60,
          height: 60,
          isNetworkImage: true,
          backgroundColor: THelperFunctions.isDarkMode(context)
              ? TColors.darkGrey
              : TColors.light,
          padding: const EdgeInsets.all(TSizes.sm),
        ),
        const SizedBox(width: TSizes.spaceBtwItems),

        ///title,price & size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TBrandTitleWithVerifiedIcon(title: 'Nike'),
              const Flexible(
                  child:
                      TProductTitleText(title: 'Air Force 1 07', maxLines: 1)),

              ///attributes
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: 'Color ',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: 'Black ',
                    style: Theme.of(context).textTheme.bodyLarge),
                TextSpan(
                    text: 'Size ',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: 'EU 43',
                    style: Theme.of(context).textTheme.bodyLarge),
              ]))
            ],
          ),
        )
      ],
    );
  }
}
