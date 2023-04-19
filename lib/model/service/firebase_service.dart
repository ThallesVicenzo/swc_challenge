import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  static FirebaseFirestore instance = FirebaseFirestore.instance;

  static CollectionReference<Map<String, dynamic>> getCollectionsSnapshot(
      String collection) {
    return instance.collection(collection);
  }

  static Future<void> setDocumentCollectionData(
      String collection, String doc, String? date) async {
    await instance
        .collection(collection)
        .doc(doc)
        .collection('dates')
        .add({'date': date});
  }

  static Future<QuerySnapshot<Map<String, dynamic>>> getDocumentCollectionData(
      String collection, String doc, String? date) async {
    final data = await instance
        .collection(collection)
        .doc(doc)
        .collection('dates')
        .where('date', isEqualTo: date)
        .get();
    return data;
  }
}
