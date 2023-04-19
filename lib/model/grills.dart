import 'package:cloud_firestore/cloud_firestore.dart';

class GrillsModel {
  final String image;
  final String? description;

  GrillsModel({
    required this.image,
    required this.description,
  });

  factory GrillsModel.fromJson(DocumentSnapshot<Map<String, dynamic>> map) {
    return GrillsModel(
      image: map['image'].toString(),
      description: map['descrição'].toString(),
    );
  }
}
