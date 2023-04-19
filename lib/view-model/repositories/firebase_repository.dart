import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:swc_challenge/model/grills.dart';
import '../../model/service/firebase_service.dart';

class FirebaseRepository {
  static final CollectionReference<Map<String, dynamic>> _collectionReference =
      FirebaseService.getCollectionsSnapshot('grills');

  static int? collectionLength;

  static Future<List<GrillsModel>> getGrillsList() async {
    try {
      final collection = await _collectionReference.get();
      return collection.docs.map((document) {
        return GrillsModel.fromJson(document);
      }).toList();
    } catch (e) {
      throw Exception(e);
    }
  }

  // static Stream<QuerySnapshot<Map<String, dynamic>>> getRentDates(
  //     String doc, DateTime selectedDate) {
  //   final dates = _collectionReference.doc(doc).collection('dates').snapshots();

  //   return dates;
  // }

  static Future<void> setDocumentCollectionData(
      String collection, String doc, String? date) async {
    await FirebaseService.setDocumentCollectionData(collection, doc, date);
  }

  static Future<QuerySnapshot<Map<String, dynamic>>> getDocumentCollectionData(
      String collection, String doc, String? date) async {
    final data =
        await FirebaseService.getDocumentCollectionData(collection, doc, date);
    return data;
  }
}
