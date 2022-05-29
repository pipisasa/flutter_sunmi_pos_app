import 'dart:developer';

import 'package:boomerang_pos/app/data/order.dart';
import 'package:boomerang_pos/components/order_widget.dart';
import 'package:boomerang_pos/services/messaging/messaging_service.dart';
import 'package:flutter/material.dart';

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
      floatingActionButton: ElevatedButton(
        child: Text(
          'Печатать',
          style: Theme.of(context).textTheme.headline6,
        ),
        onPressed: () async {
          try {
            await printOrder(order.slug!);
          } catch (e) {
            log('$e');
          }
        },
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2)),
                child: FittedBox(
                  child: OrderWidget(order: order),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
