import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:swc_challenge/model/service/firebase_service.dart';

class GrillsInfo with ChangeNotifier {
  static final CollectionReference<Map<String, dynamic>> _collectionReference =
      FirebaseService.getCollectionsSnapshot('grills');

  static int? collectionLength;

  static Future<int?> getCollectionsLenght() async {
    QuerySnapshot snapshot = await _collectionReference.get();
    int? collectionLength = snapshot.size;
    return collectionLength;
  }
}
