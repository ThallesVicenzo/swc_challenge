import 'package:cloud_firestore/cloud_firestore.dart';

class GrillsModel {
  final String image;
  final String? description;
  final bool alugada;

  GrillsModel({
    required this.image,
    required this.description,
    required this.alugada,
  });

  factory GrillsModel.fromJson(DocumentSnapshot<Map<String, dynamic>> map) {
    return GrillsModel(
      image: map['image'].toString(),
      description: map['descrição'].toString(),
      alugada: map['alugada'],
    );
  }
}
