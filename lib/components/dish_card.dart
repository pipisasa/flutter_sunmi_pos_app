import 'package:boomerang_pos/app/data/order.dart';
import 'package:flutter/material.dart';

class DishItemCard extends StatelessWidget {
  final OrderItem dishItem;

  const DishItemCard({Key? key, required this.dishItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Text('${dishItem.title}'),
        trailing: Text('${dishItem.quantity} * ${dishItem.price} c'),
      ),
    );
  }
}
