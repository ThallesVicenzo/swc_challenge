import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:swc_challenge/model/grills.dart';
import '../model/service/firebase_service.dart';

class GrillRepository {
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
}
