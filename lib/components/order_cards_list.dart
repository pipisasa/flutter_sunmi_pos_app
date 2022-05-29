import 'dart:developer';

import 'package:boomerang_pos/app/data/order.dart';
import 'package:boomerang_pos/components/order_item_card.dart';
import 'package:boomerang_pos/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
        child: StreamBuilder<QuerySnapshot<Order>>(
            stream: ordersRef.reference
                .withConverter(
                  fromFirestore: OrderCollectionReference.fromFirestore,
                  toFirestore: OrderCollectionReference.toFirestore,
                )
                .where(
                  'restaurant.printer',
                  isEqualTo: FirebaseAuth.instance.currentUser?.email,
                )
                .orderBy('created_at', descending: true)
                .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot<Order>> snapshot) {
              if (snapshot.hasError) {
                log('ORDER ERROR ${snapshot.error}');
                return const Text('Something went wrong!');
              }
              if (!snapshot.hasData)
                return const Center(child: Text('Loading orders...'));

              QuerySnapshot<Order> querySnapshot = snapshot.requireData;

              return Column(
                  children: querySnapshot.docs.map((e) {
                Order order = e.data();
                return OrderItemCard(order: order);
              }).toList());
            }),
      ),
    );
  }
}
