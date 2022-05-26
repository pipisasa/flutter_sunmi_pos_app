import 'dart:developer';

import 'package:boomerang_pos/app/data/order.dart';
import 'package:boomerang_pos/components/order_item_card.dart';
import 'package:boomerang_pos/constants.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';

class OrderCardsList extends StatelessWidget {
  const OrderCardsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: defaultPadding),
        child: FirestoreBuilder<OrderQuerySnapshot>(
            ref: ordersRef,
            builder: (context, AsyncSnapshot<OrderQuerySnapshot> snapshot,
                Widget? child) {
              if (snapshot.hasError) {
                log('ORDER ERROR ${snapshot.error}');
                return const Text('Something went wrong!');
              }
              if (!snapshot.hasData) return const Center(child: Text('Loading orders...'));

              OrderQuerySnapshot querySnapshot = snapshot.requireData;

              return Column(
                  children: querySnapshot.docs.map((e) {
                Order order = e.data;
                return OrderItemCard(order: order);
              }).toList());
            }),
      ),
    );
  }
}
