import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  static FirebaseFirestore instance = FirebaseFirestore.instance;

  static CollectionReference<Map<String, dynamic>> getCollectionsSnapshot(
      String collection) {
    return instance.collection(collection);
  }

  static DocumentReference<Map<String, dynamic>> getDocumentSnapshot(
      String collection, String doc) {
    return instance.collection(collection).doc(doc);
  }
}
