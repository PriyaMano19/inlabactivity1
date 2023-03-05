import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:testappcrud/models/Receipe.dart';

class ReceipeRepository {
  final CollectionReference _collection =
      FirebaseFirestore.instance.collection('receipes');
  Stream<List<Receipe>> receipes() {
    return _collection.orderBy('name').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Receipe.fromMap(doc as String)).toList());
  }

  Future<void> addReceipe(Receipe receipe) {
    return _collection.add(receipe.toMap());
  }

  Future<void> updateReceipe(Receipe receipe) {
    return _collection.doc(receipe.receipeId).update(receipe.toMap());
  }

  Future<void> deleteReceipe(Receipe receipe) {
    return _collection.doc(receipe.receipeId).delete();
  }
}
