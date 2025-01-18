import 'package:flutter/material.dart';
import 'package:e_commerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce/common/widgets/images/t_circular_image.dart';
import 'package:e_commerce/common/widgets/texts/product_price_text.dart';
import 'package:e_commerce/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:e_commerce/features/shop/controllers/product_controller.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/utils/constraints/colors.dart';
import 'package:e_commerce/utils/constraints/enums.dart';
import 'package:e_commerce/utils/constraints/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(
        product.price.toDouble(), product.salePrice.toDouble());
    final darkMode = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///price & sale price
        Row(
          children: [
            ///Sale Tag
            TRoundedContainer(
              radius: TSizes.sm,
              backgroundColor: TColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: TSizes.sm, vertical: TSizes.xs),
              child: Text('$salePercentage%',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(color: TColors.black)),
            ),
            const SizedBox(width: TSizes.spaceBtwItems),

            ///price
            if (product.productType == ProductType.single.toString() &&
                product.salePrice > 0)
              Text('\$${product.price}',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .apply(decoration: TextDecoration.lineThrough)),
            if (product.productType == ProductType.single.toString() &&
                product.salePrice > 0)
              const SizedBox(width: TSizes.spaceBtwItems),
            TProductPriceText(price: product.price, isLarge: true),
          ],
        ),
        const SizedBox(width: TSizes.spaceBtwItems / 1.5),

        ///title
        TProductTitleText(title: product.title),
        const SizedBox(width: TSizes.spaceBtwItems / 1.5),

        ///stock status
        Row(
          children: [
            const TProductTitleText(title: 'Status'),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text(controller.getProductStockStatus(product.stock),
                style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(width: TSizes.spaceBtwItems / 1.5),

        ///brand
        Row(
          children: [
            TCircularImage(
              image: product.brand != null ? product.brand!.image : '',
              isNetworkImage: true,
              width: 32,
              height: 32,
              overlayColor: darkMode ? TColors.white : TColors.black,
            ),
            TBrandTitleWithVerifiedIcon(
                title: product.brand != null ? product.brand!.name : '',
                brandTextSize: TextSizes.medium),
          ],
        ),
      ],
    );
  }
}
