import 'package:flutter/material.dart';
import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/features/shop/screens/order/widgets/orders_list.dart';
import 'package:e_commerce/utils/constraints/sizes.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///--Appbar
      appBar: TAppBar(
          title: Text('My orders',
              style: Theme.of(context).textTheme.headlineSmall),
          showBackArrow: true),
      body: const Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),

        ///--Orders
        child: TOrderListItems(),
      ),
    );
  }
}
