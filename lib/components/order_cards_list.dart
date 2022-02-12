import 'package:boomerang_pos/components/order_item_card.dart';
import 'package:boomerang_pos/constants.dart';
import 'package:flutter/material.dart';

class OrderCardsList extends StatelessWidget {
  const OrderCardsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: defaultPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 250,
              child: Container(
                padding: const EdgeInsets.only(right: defaultPadding),
                child: const OrderItemCard(),
              ),
            ),
            SizedBox(
              width: 250,
              child: Container(
                padding: const EdgeInsets.only(right: defaultPadding),
                child: const OrderItemCard(),
              ),
            ),
            SizedBox(
              width: 250,
              child: Container(
                padding: const EdgeInsets.only(right: defaultPadding),
                child: const OrderItemCard(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
