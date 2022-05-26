import 'package:boomerang_pos/app/data/order.dart';
import 'package:boomerang_pos/components/dish_card.dart';
import 'package:boomerang_pos/components/print_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderDetail extends StatelessWidget {
  final Order order;

  const OrderDetail({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Order.orderItemStatusColors[order.status],
        title: Row(
          children: [
            Text(
              '${order.slug}',
              style: const TextStyle(color: Colors.white),
            ),
            const Spacer(),
            Text(
              Order.getLocaleStatus(order.status),
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Flexible(
              child: Text(
                'Адрес: ${order.user?.address?.name}',
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Text(
              'Заказчик: ${order.user?.name ?? 'Имя заказчика'}',
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              'Телефон: ${order.user?.phone}',
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              'Дата заказа: ${DateFormat('yyyy /MM/dd kk:mm').format(order.created_at!.toDate())}',
              style: Theme.of(context).textTheme.headline6,
            ),
            const Divider(color: Colors.black, height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: order.items?.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  final dishItem = order.items!.values.toList()[index];
                  return DishItemCard(dishItem: dishItem);
                },
              ),
            ),
            const Divider(
              color: Colors.black,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const PrintButton(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Всего за блюда: ${order.total_price} сом',
                      textAlign: TextAlign.end,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'За доставку: ${order.delivery_price} сом',
                      textAlign: TextAlign.end,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Всего: ${int.parse(order.delivery_price.toString()) + int.parse(order.total_price.toString())} сом',
                      textAlign: TextAlign.end,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                ],)
              ],
            )
          ],
        ),
      ),
    );
  }
}
