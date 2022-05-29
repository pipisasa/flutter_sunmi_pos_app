// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// CollectionGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

class _Sentinel {
  const _Sentinel();
}

const _sentinel = _Sentinel();

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class OrderCollectionReference
    implements OrderQuery, FirestoreCollectionReference<OrderQuerySnapshot> {
  factory OrderCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$OrderCollectionReference;

  static Order fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return Order.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    Order value,
    SetOptions? options,
  ) {
    return value.toJson();
  }

  @override
  OrderDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<OrderDocumentReference> add(Order value);
}

class _$OrderCollectionReference extends _$OrderQuery
    implements OrderCollectionReference {
  factory _$OrderCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$OrderCollectionReference._(
      firestore.collection('orders').withConverter(
            fromFirestore: OrderCollectionReference.fromFirestore,
            toFirestore: OrderCollectionReference.toFirestore,
          ),
    );
  }

  _$OrderCollectionReference._(
    CollectionReference<Order> reference,
  ) : super(reference, reference);

  String get path => reference.path;

  @override
  CollectionReference<Order> get reference =>
      super.reference as CollectionReference<Order>;

  @override
  OrderDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return OrderDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<OrderDocumentReference> add(Order value) {
    return reference.add(value).then((ref) => OrderDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$OrderCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class OrderDocumentReference
    extends FirestoreDocumentReference<OrderDocumentSnapshot> {
  factory OrderDocumentReference(DocumentReference<Order> reference) =
      _$OrderDocumentReference;

  DocumentReference<Order> get reference;

  /// A reference to the [OrderCollectionReference] containing this document.
  OrderCollectionReference get parent {
    return _$OrderCollectionReference(reference.firestore);
  }

  @override
  Stream<OrderDocumentSnapshot> snapshots();

  @override
  Future<OrderDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    int? id,
    String? slug,
    List<String>? available_couriers,
    String? admin,
    String? assignedCourier,
    int? cutlery,
    num? delivery_price,
    String? delivery_time,
    num? items_price,
    num? money_change,
    String? notes,
    String? pay_type,
    String? status,
    bool? take_it_myself,
    num? total_price,
    int? order,
    double totalContainersPrice,
    int containersCount,
    double containerPrice,
  });

  Future<void> set(Order value);
}

class _$OrderDocumentReference
    extends FirestoreDocumentReference<OrderDocumentSnapshot>
    implements OrderDocumentReference {
  _$OrderDocumentReference(this.reference);

  @override
  final DocumentReference<Order> reference;

  /// A reference to the [OrderCollectionReference] containing this document.
  OrderCollectionReference get parent {
    return _$OrderCollectionReference(reference.firestore);
  }

  @override
  Stream<OrderDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return OrderDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<OrderDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return OrderDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<void> delete() {
    return reference.delete();
  }

  Future<void> update({
    Object? id = _sentinel,
    Object? slug = _sentinel,
    Object? available_couriers = _sentinel,
    Object? admin = _sentinel,
    Object? assignedCourier = _sentinel,
    Object? cutlery = _sentinel,
    Object? delivery_price = _sentinel,
    Object? delivery_time = _sentinel,
    Object? items_price = _sentinel,
    Object? money_change = _sentinel,
    Object? notes = _sentinel,
    Object? pay_type = _sentinel,
    Object? status = _sentinel,
    Object? take_it_myself = _sentinel,
    Object? total_price = _sentinel,
    Object? order = _sentinel,
    Object? totalContainersPrice = _sentinel,
    Object? containersCount = _sentinel,
    Object? containerPrice = _sentinel,
  }) async {
    final json = {
      if (id != _sentinel) "id": id as int?,
      if (slug != _sentinel) "slug": slug as String?,
      if (available_couriers != _sentinel)
        "available_couriers": available_couriers as List<String>?,
      if (admin != _sentinel) "admin": admin as String?,
      if (assignedCourier != _sentinel)
        "assignedCourier": assignedCourier as String?,
      if (cutlery != _sentinel) "cutlery": cutlery as int?,
      if (delivery_price != _sentinel) "delivery_price": delivery_price as num?,
      if (delivery_time != _sentinel) "delivery_time": delivery_time as String?,
      if (items_price != _sentinel) "items_price": items_price as num?,
      if (money_change != _sentinel) "money_change": money_change as num?,
      if (notes != _sentinel) "notes": notes as String?,
      if (pay_type != _sentinel) "pay_type": pay_type as String?,
      if (status != _sentinel) "status": status as String?,
      if (take_it_myself != _sentinel)
        "take_it_myself": take_it_myself as bool?,
      if (total_price != _sentinel) "total_price": total_price as num?,
      if (order != _sentinel) "order": order as int?,
      if (totalContainersPrice != _sentinel)
        "totalContainersPrice": totalContainersPrice as double,
      if (containersCount != _sentinel)
        "containersCount": containersCount as int,
      if (containerPrice != _sentinel)
        "containerPrice": containerPrice as double,
    };

    return reference.update(json);
  }

  Future<void> set(Order value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is OrderDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class OrderDocumentSnapshot extends FirestoreDocumentSnapshot {
  OrderDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<Order> snapshot;

  @override
  OrderDocumentReference get reference {
    return OrderDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Order? data;
}

abstract class OrderQuery implements QueryReference<OrderQuerySnapshot> {
  @override
  OrderQuery limit(int limit);

  @override
  OrderQuery limitToLast(int limit);

  OrderQuery whereId({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int?>? whereIn,
    List<int?>? whereNotIn,
  });
  OrderQuery whereSlug({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  });
  OrderQuery whereAvailable_couriers({
    List<String>? isEqualTo,
    List<String>? isNotEqualTo,
    List<String>? isLessThan,
    List<String>? isLessThanOrEqualTo,
    List<String>? isGreaterThan,
    List<String>? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? arrayContainsAny,
  });
  OrderQuery whereAdmin({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  });
  OrderQuery whereAssignedCourier({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  });
  OrderQuery whereCutlery({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int?>? whereIn,
    List<int?>? whereNotIn,
  });
  OrderQuery whereDelivery_price({
    num? isEqualTo,
    num? isNotEqualTo,
    num? isLessThan,
    num? isLessThanOrEqualTo,
    num? isGreaterThan,
    num? isGreaterThanOrEqualTo,
    bool? isNull,
    List<num?>? whereIn,
    List<num?>? whereNotIn,
  });
  OrderQuery whereDelivery_time({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  });
  OrderQuery whereItems_price({
    num? isEqualTo,
    num? isNotEqualTo,
    num? isLessThan,
    num? isLessThanOrEqualTo,
    num? isGreaterThan,
    num? isGreaterThanOrEqualTo,
    bool? isNull,
    List<num?>? whereIn,
    List<num?>? whereNotIn,
  });
  OrderQuery whereMoney_change({
    num? isEqualTo,
    num? isNotEqualTo,
    num? isLessThan,
    num? isLessThanOrEqualTo,
    num? isGreaterThan,
    num? isGreaterThanOrEqualTo,
    bool? isNull,
    List<num?>? whereIn,
    List<num?>? whereNotIn,
  });
  OrderQuery whereNotes({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  });
  OrderQuery wherePay_type({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  });
  OrderQuery whereStatus({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  });
  OrderQuery whereTake_it_myself({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool?>? whereIn,
    List<bool?>? whereNotIn,
  });
  OrderQuery whereTotal_price({
    num? isEqualTo,
    num? isNotEqualTo,
    num? isLessThan,
    num? isLessThanOrEqualTo,
    num? isGreaterThan,
    num? isGreaterThanOrEqualTo,
    bool? isNull,
    List<num?>? whereIn,
    List<num?>? whereNotIn,
  });
  OrderQuery whereOrder({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int?>? whereIn,
    List<int?>? whereNotIn,
  });
  OrderQuery whereTotalContainersPrice({
    double? isEqualTo,
    double? isNotEqualTo,
    double? isLessThan,
    double? isLessThanOrEqualTo,
    double? isGreaterThan,
    double? isGreaterThanOrEqualTo,
    bool? isNull,
    List<double>? whereIn,
    List<double>? whereNotIn,
  });
  OrderQuery whereContainersCount({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  });
  OrderQuery whereContainerPrice({
    double? isEqualTo,
    double? isNotEqualTo,
    double? isLessThan,
    double? isLessThanOrEqualTo,
    double? isGreaterThan,
    double? isGreaterThanOrEqualTo,
    bool? isNull,
    List<double>? whereIn,
    List<double>? whereNotIn,
  });

  OrderQuery orderById({
    bool descending = false,
    int? startAt,
    int? startAfter,
    int? endAt,
    int? endBefore,
    OrderDocumentSnapshot? startAtDocument,
    OrderDocumentSnapshot? endAtDocument,
    OrderDocumentSnapshot? endBeforeDocument,
    OrderDocumentSnapshot? startAfterDocument,
  });

  OrderQuery orderBySlug({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    OrderDocumentSnapshot? startAtDocument,
    OrderDocumentSnapshot? endAtDocument,
    OrderDocumentSnapshot? endBeforeDocument,
    OrderDocumentSnapshot? startAfterDocument,
  });

  OrderQuery orderByAvailable_couriers({
    bool descending = false,
    List<String>? startAt,
    List<String>? startAfter,
    List<String>? endAt,
    List<String>? endBefore,
    OrderDocumentSnapshot? startAtDocument,
    OrderDocumentSnapshot? endAtDocument,
    OrderDocumentSnapshot? endBeforeDocument,
    OrderDocumentSnapshot? startAfterDocument,
  });

  OrderQuery orderByAdmin({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    OrderDocumentSnapshot? startAtDocument,
    OrderDocumentSnapshot? endAtDocument,
    OrderDocumentSnapshot? endBeforeDocument,
    OrderDocumentSnapshot? startAfterDocument,
  });

  OrderQuery orderByAssignedCourier({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    OrderDocumentSnapshot? startAtDocument,
    OrderDocumentSnapshot? endAtDocument,
    OrderDocumentSnapshot? endBeforeDocument,
    OrderDocumentSnapshot? startAfterDocument,
  });

  OrderQuery orderByCutlery({
    bool descending = false,
    int? startAt,
    int? startAfter,
    int? endAt,
    int? endBefore,
    OrderDocumentSnapshot? startAtDocument,
    OrderDocumentSnapshot? endAtDocument,
    OrderDocumentSnapshot? endBeforeDocument,
    OrderDocumentSnapshot? startAfterDocument,
  });

  OrderQuery orderByDelivery_price({
    bool descending = false,
    num? startAt,
    num? startAfter,
    num? endAt,
    num? endBefore,
    OrderDocumentSnapshot? startAtDocument,
    OrderDocumentSnapshot? endAtDocument,
    OrderDocumentSnapshot? endBeforeDocument,
    OrderDocumentSnapshot? startAfterDocument,
  });

  OrderQuery orderByDelivery_time({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    OrderDocumentSnapshot? startAtDocument,
    OrderDocumentSnapshot? endAtDocument,
    OrderDocumentSnapshot? endBeforeDocument,
    OrderDocumentSnapshot? startAfterDocument,
  });

  OrderQuery orderByItems_price({
    bool descending = false,
    num? startAt,
    num? startAfter,
    num? endAt,
    num? endBefore,
    OrderDocumentSnapshot? startAtDocument,
    OrderDocumentSnapshot? endAtDocument,
    OrderDocumentSnapshot? endBeforeDocument,
    OrderDocumentSnapshot? startAfterDocument,
  });

  OrderQuery orderByMoney_change({
    bool descending = false,
    num? startAt,
    num? startAfter,
    num? endAt,
    num? endBefore,
    OrderDocumentSnapshot? startAtDocument,
    OrderDocumentSnapshot? endAtDocument,
    OrderDocumentSnapshot? endBeforeDocument,
    OrderDocumentSnapshot? startAfterDocument,
  });

  OrderQuery orderByNotes({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    OrderDocumentSnapshot? startAtDocument,
    OrderDocumentSnapshot? endAtDocument,
    OrderDocumentSnapshot? endBeforeDocument,
    OrderDocumentSnapshot? startAfterDocument,
  });

  OrderQuery orderByPay_type({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    OrderDocumentSnapshot? startAtDocument,
    OrderDocumentSnapshot? endAtDocument,
    OrderDocumentSnapshot? endBeforeDocument,
    OrderDocumentSnapshot? startAfterDocument,
  });

  OrderQuery orderByStatus({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    OrderDocumentSnapshot? startAtDocument,
    OrderDocumentSnapshot? endAtDocument,
    OrderDocumentSnapshot? endBeforeDocument,
    OrderDocumentSnapshot? startAfterDocument,
  });

  OrderQuery orderByTake_it_myself({
    bool descending = false,
    bool? startAt,
    bool? startAfter,
    bool? endAt,
    bool? endBefore,
    OrderDocumentSnapshot? startAtDocument,
    OrderDocumentSnapshot? endAtDocument,
    OrderDocumentSnapshot? endBeforeDocument,
    OrderDocumentSnapshot? startAfterDocument,
  });

  OrderQuery orderByTotal_price({
    bool descending = false,
    num? startAt,
    num? startAfter,
    num? endAt,
    num? endBefore,
    OrderDocumentSnapshot? startAtDocument,
    OrderDocumentSnapshot? endAtDocument,
    OrderDocumentSnapshot? endBeforeDocument,
    OrderDocumentSnapshot? startAfterDocument,
  });

  OrderQuery orderByOrder({
    bool descending = false,
    int? startAt,
    int? startAfter,
    int? endAt,
    int? endBefore,
    OrderDocumentSnapshot? startAtDocument,
    OrderDocumentSnapshot? endAtDocument,
    OrderDocumentSnapshot? endBeforeDocument,
    OrderDocumentSnapshot? startAfterDocument,
  });

  OrderQuery orderByTotalContainersPrice({
    bool descending = false,
    double startAt,
    double startAfter,
    double endAt,
    double endBefore,
    OrderDocumentSnapshot? startAtDocument,
    OrderDocumentSnapshot? endAtDocument,
    OrderDocumentSnapshot? endBeforeDocument,
    OrderDocumentSnapshot? startAfterDocument,
  });

  OrderQuery orderByContainersCount({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    OrderDocumentSnapshot? startAtDocument,
    OrderDocumentSnapshot? endAtDocument,
    OrderDocumentSnapshot? endBeforeDocument,
    OrderDocumentSnapshot? startAfterDocument,
  });

  OrderQuery orderByContainerPrice({
    bool descending = false,
    double startAt,
    double startAfter,
    double endAt,
    double endBefore,
    OrderDocumentSnapshot? startAtDocument,
    OrderDocumentSnapshot? endAtDocument,
    OrderDocumentSnapshot? endBeforeDocument,
    OrderDocumentSnapshot? startAfterDocument,
  });
}

class _$OrderQuery extends QueryReference<OrderQuerySnapshot>
    implements OrderQuery {
  _$OrderQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<Order> reference;

  OrderQuerySnapshot _decodeSnapshot(
    QuerySnapshot<Order> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return OrderQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<OrderDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: OrderDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return OrderQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<OrderQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<OrderQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  OrderQuery limit(int limit) {
    return _$OrderQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  OrderQuery limitToLast(int limit) {
    return _$OrderQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  OrderQuery whereId({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int?>? whereIn,
    List<int?>? whereNotIn,
  }) {
    return _$OrderQuery(
      reference.where(
        'id',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  OrderQuery whereSlug({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  }) {
    return _$OrderQuery(
      reference.where(
        'slug',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  OrderQuery whereAvailable_couriers({
    List<String>? isEqualTo,
    List<String>? isNotEqualTo,
    List<String>? isLessThan,
    List<String>? isLessThanOrEqualTo,
    List<String>? isGreaterThan,
    List<String>? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? arrayContainsAny,
  }) {
    return _$OrderQuery(
      reference.where(
        'available_couriers',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        arrayContainsAny: arrayContainsAny,
      ),
      _collection,
    );
  }

  OrderQuery whereAdmin({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  }) {
    return _$OrderQuery(
      reference.where(
        'admin',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  OrderQuery whereAssignedCourier({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  }) {
    return _$OrderQuery(
      reference.where(
        'assignedCourier',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  OrderQuery whereCutlery({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int?>? whereIn,
    List<int?>? whereNotIn,
  }) {
    return _$OrderQuery(
      reference.where(
        'cutlery',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  OrderQuery whereDelivery_price({
    num? isEqualTo,
    num? isNotEqualTo,
    num? isLessThan,
    num? isLessThanOrEqualTo,
    num? isGreaterThan,
    num? isGreaterThanOrEqualTo,
    bool? isNull,
    List<num?>? whereIn,
    List<num?>? whereNotIn,
  }) {
    return _$OrderQuery(
      reference.where(
        'delivery_price',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  OrderQuery whereDelivery_time({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  }) {
    return _$OrderQuery(
      reference.where(
        'delivery_time',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  OrderQuery whereItems_price({
    num? isEqualTo,
    num? isNotEqualTo,
    num? isLessThan,
    num? isLessThanOrEqualTo,
    num? isGreaterThan,
    num? isGreaterThanOrEqualTo,
    bool? isNull,
    List<num?>? whereIn,
    List<num?>? whereNotIn,
  }) {
    return _$OrderQuery(
      reference.where(
        'items_price',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  OrderQuery whereMoney_change({
    num? isEqualTo,
    num? isNotEqualTo,
    num? isLessThan,
    num? isLessThanOrEqualTo,
    num? isGreaterThan,
    num? isGreaterThanOrEqualTo,
    bool? isNull,
    List<num?>? whereIn,
    List<num?>? whereNotIn,
  }) {
    return _$OrderQuery(
      reference.where(
        'money_change',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  OrderQuery whereNotes({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  }) {
    return _$OrderQuery(
      reference.where(
        'notes',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  OrderQuery wherePay_type({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  }) {
    return _$OrderQuery(
      reference.where(
        'pay_type',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  OrderQuery whereStatus({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  }) {
    return _$OrderQuery(
      reference.where(
        'status',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  OrderQuery whereTake_it_myself({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool?>? whereIn,
    List<bool?>? whereNotIn,
  }) {
    return _$OrderQuery(
      reference.where(
        'take_it_myself',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  OrderQuery whereTotal_price({
    num? isEqualTo,
    num? isNotEqualTo,
    num? isLessThan,
    num? isLessThanOrEqualTo,
    num? isGreaterThan,
    num? isGreaterThanOrEqualTo,
    bool? isNull,
    List<num?>? whereIn,
    List<num?>? whereNotIn,
  }) {
    return _$OrderQuery(
      reference.where(
        'total_price',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  OrderQuery whereOrder({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int?>? whereIn,
    List<int?>? whereNotIn,
  }) {
    return _$OrderQuery(
      reference.where(
        'order',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  OrderQuery whereTotalContainersPrice({
    double? isEqualTo,
    double? isNotEqualTo,
    double? isLessThan,
    double? isLessThanOrEqualTo,
    double? isGreaterThan,
    double? isGreaterThanOrEqualTo,
    bool? isNull,
    List<double>? whereIn,
    List<double>? whereNotIn,
  }) {
    return _$OrderQuery(
      reference.where(
        'totalContainersPrice',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  OrderQuery whereContainersCount({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  }) {
    return _$OrderQuery(
      reference.where(
        'containersCount',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  OrderQuery whereContainerPrice({
    double? isEqualTo,
    double? isNotEqualTo,
    double? isLessThan,
    double? isLessThanOrEqualTo,
    double? isGreaterThan,
    double? isGreaterThanOrEqualTo,
    bool? isNull,
    List<double>? whereIn,
    List<double>? whereNotIn,
  }) {
    return _$OrderQuery(
      reference.where(
        'containerPrice',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  OrderQuery orderById({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    OrderDocumentSnapshot? startAtDocument,
    OrderDocumentSnapshot? endAtDocument,
    OrderDocumentSnapshot? endBeforeDocument,
    OrderDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('id', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$OrderQuery(query, _collection);
  }

  OrderQuery orderBySlug({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    OrderDocumentSnapshot? startAtDocument,
    OrderDocumentSnapshot? endAtDocument,
    OrderDocumentSnapshot? endBeforeDocument,
    OrderDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('slug', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$OrderQuery(query, _collection);
  }

  OrderQuery orderByAvailable_couriers({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    OrderDocumentSnapshot? startAtDocument,
    OrderDocumentSnapshot? endAtDocument,
    OrderDocumentSnapshot? endBeforeDocument,
    OrderDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('available_couriers', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$OrderQuery(query, _collection);
  }

  OrderQuery orderByAdmin({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    OrderDocumentSnapshot? startAtDocument,
    OrderDocumentSnapshot? endAtDocument,
    OrderDocumentSnapshot? endBeforeDocument,
    OrderDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('admin', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$OrderQuery(query, _collection);
  }

  OrderQuery orderByAssignedCourier({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    OrderDocumentSnapshot? startAtDocument,
    OrderDocumentSnapshot? endAtDocument,
    OrderDocumentSnapshot? endBeforeDocument,
    OrderDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('assignedCourier', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$OrderQuery(query, _collection);
  }

  OrderQuery orderByCutlery({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    OrderDocumentSnapshot? startAtDocument,
    OrderDocumentSnapshot? endAtDocument,
    OrderDocumentSnapshot? endBeforeDocument,
    OrderDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('cutlery', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$OrderQuery(query, _collection);
  }

  OrderQuery orderByDelivery_price({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    OrderDocumentSnapshot? startAtDocument,
    OrderDocumentSnapshot? endAtDocument,
    OrderDocumentSnapshot? endBeforeDocument,
    OrderDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('delivery_price', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$OrderQuery(query, _collection);
  }

  OrderQuery orderByDelivery_time({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    OrderDocumentSnapshot? startAtDocument,
    OrderDocumentSnapshot? endAtDocument,
    OrderDocumentSnapshot? endBeforeDocument,
    OrderDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('delivery_time', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$OrderQuery(query, _collection);
  }

  OrderQuery orderByItems_price({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    OrderDocumentSnapshot? startAtDocument,
    OrderDocumentSnapshot? endAtDocument,
    OrderDocumentSnapshot? endBeforeDocument,
    OrderDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('items_price', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$OrderQuery(query, _collection);
  }

  OrderQuery orderByMoney_change({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    OrderDocumentSnapshot? startAtDocument,
    OrderDocumentSnapshot? endAtDocument,
    OrderDocumentSnapshot? endBeforeDocument,
    OrderDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('money_change', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$OrderQuery(query, _collection);
  }

  OrderQuery orderByNotes({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    OrderDocumentSnapshot? startAtDocument,
    OrderDocumentSnapshot? endAtDocument,
    OrderDocumentSnapshot? endBeforeDocument,
    OrderDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('notes', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$OrderQuery(query, _collection);
  }

  OrderQuery orderByPay_type({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    OrderDocumentSnapshot? startAtDocument,
    OrderDocumentSnapshot? endAtDocument,
    OrderDocumentSnapshot? endBeforeDocument,
    OrderDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('pay_type', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$OrderQuery(query, _collection);
  }

  OrderQuery orderByStatus({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    OrderDocumentSnapshot? startAtDocument,
    OrderDocumentSnapshot? endAtDocument,
    OrderDocumentSnapshot? endBeforeDocument,
    OrderDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('status', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$OrderQuery(query, _collection);
  }

  OrderQuery orderByTake_it_myself({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    OrderDocumentSnapshot? startAtDocument,
    OrderDocumentSnapshot? endAtDocument,
    OrderDocumentSnapshot? endBeforeDocument,
    OrderDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('take_it_myself', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$OrderQuery(query, _collection);
  }

  OrderQuery orderByTotal_price({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    OrderDocumentSnapshot? startAtDocument,
    OrderDocumentSnapshot? endAtDocument,
    OrderDocumentSnapshot? endBeforeDocument,
    OrderDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('total_price', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$OrderQuery(query, _collection);
  }

  OrderQuery orderByOrder({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    OrderDocumentSnapshot? startAtDocument,
    OrderDocumentSnapshot? endAtDocument,
    OrderDocumentSnapshot? endBeforeDocument,
    OrderDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('order', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$OrderQuery(query, _collection);
  }

  OrderQuery orderByTotalContainersPrice({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    OrderDocumentSnapshot? startAtDocument,
    OrderDocumentSnapshot? endAtDocument,
    OrderDocumentSnapshot? endBeforeDocument,
    OrderDocumentSnapshot? startAfterDocument,
  }) {
    var query =
        reference.orderBy('totalContainersPrice', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$OrderQuery(query, _collection);
  }

  OrderQuery orderByContainersCount({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    OrderDocumentSnapshot? startAtDocument,
    OrderDocumentSnapshot? endAtDocument,
    OrderDocumentSnapshot? endBeforeDocument,
    OrderDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('containersCount', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$OrderQuery(query, _collection);
  }

  OrderQuery orderByContainerPrice({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    OrderDocumentSnapshot? startAtDocument,
    OrderDocumentSnapshot? endAtDocument,
    OrderDocumentSnapshot? endBeforeDocument,
    OrderDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('containerPrice', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$OrderQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$OrderQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class OrderQuerySnapshot
    extends FirestoreQuerySnapshot<OrderQueryDocumentSnapshot> {
  OrderQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<Order> snapshot;

  @override
  final List<OrderQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<OrderDocumentSnapshot>> docChanges;
}

class OrderQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot
    implements OrderDocumentSnapshot {
  OrderQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<Order> snapshot;

  @override
  OrderDocumentReference get reference {
    return OrderDocumentReference(snapshot.reference);
  }

  @override
  final Order data;
}

// **************************************************************************
// ValidatorGenerator
// **************************************************************************

_$assertOrder(Order instance) {
  const Min(0).validate(instance.cutlery, "cutlery");
  const Min(0).validate(instance.delivery_price, "delivery_price");
  const Min(0).validate(instance.items_price, "items_price");
  const Min(0).validate(instance.money_change, "money_change");
  const Min(0).validate(instance.total_price, "total_price");
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      id: json['id'] as int?,
      slug: json['slug'] as String?,
      available_couriers: (json['available_couriers'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      admin: json['admin'] as String?,
      courier: firestoreDocRefFromJson(json['courier']),
      assignedCourier: json['assignedCourier'] as String?,
      created_at: firestoreTimestampFromJson(json['created_at']),
      cutlery: json['cutlery'] as int?,
      delivery_price: firestoreNumberFromJson(json['delivery_price']),
      delivery_time: json['delivery_time'] as String?,
      items: firestoreOrdersMapFromJSON(json['items']),
      items_price: firestoreNumberFromJson(json['items_price']),
      money_change: firestoreNumberFromJson(json['money_change']),
      notes: json['notes'] as String?,
      pay_type: json['pay_type'] as String?,
      restaurant:
          RestaurantFromJson(json['restaurant'] as Map<String, Object?>?),
      status: json['status'] as String?,
      take_it_myself: json['take_it_myself'] as bool?,
      time_for_delivery: firestoreTimestampFromJson(json['time_for_delivery']),
      total_price: firestoreNumberFromJson(json['total_price']),
      updated_at: firestoreTimestampFromJson(json['updated_at']),
      user: OrderClientFromJson(json['user'] as Map<String, Object?>?),
      order: json['order'] as int?,
      totalContainersPrice:
          (json['totalContainersPrice'] as num?)?.toDouble() ?? 0,
      containersCount: json['containersCount'] as int? ?? 0,
      containerPrice: (json['containerPrice'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'available_couriers': instance.available_couriers,
      'admin': instance.admin,
      'courier': firestoreDocRefToJson(instance.courier),
      'assignedCourier': instance.assignedCourier,
      'created_at': firestoreTimestampToJson(instance.created_at),
      'cutlery': instance.cutlery,
      'delivery_price': firestoreNumberToJson(instance.delivery_price),
      'delivery_time': instance.delivery_time,
      'items': firestoreOrdersMapToJson(instance.items),
      'items_price': firestoreNumberToJson(instance.items_price),
      'money_change': firestoreNumberToJson(instance.money_change),
      'notes': instance.notes,
      'pay_type': instance.pay_type,
      'restaurant': RestaurantToJson(instance.restaurant),
      'status': instance.status,
      'take_it_myself': instance.take_it_myself,
      'time_for_delivery': firestoreTimestampToJson(instance.time_for_delivery),
      'total_price': firestoreNumberToJson(instance.total_price),
      'updated_at': firestoreTimestampToJson(instance.updated_at),
      'user': OrderClientToJson(instance.user),
      'order': instance.order,
      'totalContainersPrice': instance.totalContainersPrice,
      'containersCount': instance.containersCount,
      'containerPrice': instance.containerPrice,
    };

Restaurant _$RestaurantFromJson(Map<String, dynamic> json) => Restaurant(
      pk: json['pk'] as int?,
      address: json['address'] as String?,
      name: json['name'] as String?,
      geolocation: firestoreGeoPointFromJson(json['geolocation']),
      slug: json['slug'] as String?,
    );

Map<String, dynamic> _$RestaurantToJson(Restaurant instance) =>
    <String, dynamic>{
      'pk': instance.pk,
      'slug': instance.slug,
      'address': instance.address,
      'name': instance.name,
      'geolocation': firestoreGeoPointToJson(instance.geolocation),
    };

OrderItem _$OrderItemFromJson(Map<String, dynamic> json) => OrderItem(
      id: json['id'] as String?,
      image: json['image'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      quantity: json['quantity'] as int?,
      title: json['title'] as String?,
      order: json['order'] as int?,
    );

Map<String, dynamic> _$OrderItemToJson(OrderItem instance) => <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'price': instance.price,
      'quantity': instance.quantity,
      'title': instance.title,
      'order': instance.order,
    };

OrderClient _$OrderClientFromJson(Map<String, dynamic> json) => OrderClient(
      uid: json['uid'] as String,
      address:
          firestoreAddressFromJson(json['address'] as Map<String, Object?>?),
      email: json['email'] as String?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$OrderClientToJson(OrderClient instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'address': firestoreAddressToJson(instance.address),
      'email': instance.email,
      'name': instance.name,
      'phone': instance.phone,
    };
