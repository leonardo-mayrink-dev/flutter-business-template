import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_business_template/2_infrastructure/util/message_util.dart';
import 'package:flutter_business_template/3_shared/constants.dart';

class DatabaseService<T> {
  final String collection;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final T Function(String, Map<dynamic, dynamic>?) fromDS;
  final Map<String, dynamic> Function(T) toMap;
  DatabaseService(this.collection, {required this.fromDS, required this.toMap});

  Future<T?> getSingle(String id) async {
    var snap = await _db.collection(collection).doc(id).get();
    if (!snap.exists) return null;
    return fromDS(snap.id, snap.data());
  }

  Stream<T?> streamSingle(String id) {
    return _db
        .collection(collection)
        .doc(id)
        .snapshots()
        .map((snap) => fromDS(snap.id, snap.data()));
  }

  Stream<List<T>> streamList() {
    var ref = _db.collection(collection);
    return ref.snapshots().map(
        (list) => list.docs.map((doc) => fromDS(doc.id, doc.data())).toList());
  }

  Future<List<T>> getQueryList(
      {List<OrderBy>? orderBy,
      List<QueryArgs>? args,
      int? limit,
      dynamic startAfter}) async {
    CollectionReference collref = _db.collection(collection);
    Query? ref;
    if (args != null) {
      for (QueryArgs arg in args) {
        if (ref == null)
          ref = collref.where(arg.key, isEqualTo: arg.value);
        else
          ref = ref.where(arg.key, isEqualTo: arg.value);
      }
    }
    if (orderBy != null) {
      orderBy.forEach((order) {
        if (ref == null)
          ref = collref.orderBy(order.field, descending: order.descending);
        else
          ref = ref!.orderBy(order.field, descending: order.descending);
      });
    }
    if (limit != null) {
      if (ref == null)
        ref = collref.limit(limit);
      else
        ref = ref!.limit(limit);
    }
    if (startAfter != null && orderBy != null) {
      ref = ref!.startAfter([startAfter]);
    }
    QuerySnapshot query;
    if (ref != null)
      query = await ref!.get();
    else
      query = await collref.get();

    //return query.docs.map((doc) => listFromDS(doc.id, doc.data())).toList();
    return query.docs
        .map((doc) => fromDS(doc.id, doc.data() as dynamic))
        .toList();
  }

  Stream<List<T>> streamQueryList(
      {List<OrderBy>? orderBy, List<QueryArgs>? args}) {
    CollectionReference collref = _db.collection(collection);
    Query? ref;
    if (orderBy != null) {
      orderBy.forEach((order) {
        if (ref == null)
          ref = collref.orderBy(order.field, descending: order.descending);
        else
          ref = ref!.orderBy(order.field, descending: order.descending);
      });
    }
    if (args != null) {
      for (QueryArgs arg in args) {
        if (ref == null)
          ref = collref.where(arg.key, isEqualTo: arg.value);
        else
          ref = ref!.where(arg.key, isEqualTo: arg.value);
      }
    }
    if (ref != null)
      return ref!.snapshots().map((snap) => snap.docs
          .map((doc) => fromDS(doc.id, doc.data() as dynamic))
          .toList());
    else
      return collref.snapshots().map((snap) => snap.docs
          .map((doc) => fromDS(doc.id, doc.data() as dynamic))
          .toList());
  }

  Future<List<T>> getListFromTo(String field, DateTime from, DateTime to,
      {List<QueryArgs> args = const []}) async {
    var ref = _db.collection(collection).orderBy(field);
    for (QueryArgs arg in args) {
      ref = ref.where(arg.key, isEqualTo: arg.value);
    }
    QuerySnapshot query = await ref.startAt([from]).endAt([to]).get();

    //return query.docs.map((doc) => listFromDS(doc.id, doc.data())).toList();

    return query.docs
        .map((doc) => fromDS(doc.id, doc.data() as dynamic))
        .toList();
  }

  Stream<List<T>> streamListFromTo(String field, DateTime from, DateTime to,
      {List<QueryArgs> args = const []}) {
    var ref = _db.collection(collection).orderBy(field, descending: true);
    for (QueryArgs arg in args) {
      ref = ref.where(arg.key, isEqualTo: arg.value);
    }
    var query = ref.startAfter([to]).endAt([from]).snapshots();
    return query.map(
        (snap) => snap.docs.map((doc) => fromDS(doc.id, doc.data())).toList());
  }

  Future<dynamic> createItem(T item, {String? id}) {
    if (id != null) {
      return _db.collection(collection).doc(id).set(toMap(item));
    } else {
      return _db.collection(collection).add(toMap(item));
    }
  }

  Future<bool> updateItem(T item, String id) async {
    bool result = true;
    MessageUtil.addMessage(kMsgUsuarioAtualizado);
    await _db
        .collection(collection)
        .doc(id)
        .set(toMap(item), SetOptions(merge: true))
        .onError(
      (error, stackTrace) {
        result = false;
        MessageUtil.addErrorMessage(kMsgErroInesperado);
      },
    );
    return result;
  }

  Future<void> removeItem(String id) {
    return _db.collection(collection).doc(id).delete();
  }
}

class QueryArgs {
  final String key;
  final dynamic value;
  QueryArgs(this.key, this.value);
}

class OrderBy {
  final String field;
  final bool descending;
  OrderBy(this.field, {this.descending = false});
}
