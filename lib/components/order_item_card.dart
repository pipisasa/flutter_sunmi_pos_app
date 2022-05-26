import 'package:boomerang_pos/app/data/order.dart';
import 'package:boomerang_pos/components/order_detail.dart';
import 'package:boomerang_pos/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderItemCard extends StatelessWidget {
  final Order order;

  const OrderItemCard({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OrderDetail(order: order)),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(defaultPadding),
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(defaultBorderRaius),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.16),
                offset: const Offset(1, 3),
                blurRadius: 4)
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${order.slug}',
                  style: Theme.of(context).textTheme.headline5,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Order.orderItemStatusColors[order.status],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    Order.getLocaleStatus(order.status),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: defaultPadding / 2,
            ),
            Text('Адрес: ${order.user?.address?.name}'),
            const SizedBox(
              height: defaultPadding / 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(DateFormat('yyyy/MM/dd kk:mm')
                    .format(order.created_at!.toDate())),
                Text('${order.total_price}',
                    style: const TextStyle(fontSize: 16, color: Colors.black)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
