class GrillsModel {
  final String? image;
  final String? description;
  final bool alugada;

  GrillsModel({
    this.image,
    this.description,
    this.alugada = false,
  });

  factory GrillsModel.fromJson(Map<String, dynamic> json) {
    return GrillsModel(
      image: json['image'].toString(),
      description: json['descrição'].toString(),
      alugada: json['alugada'],
    );
  }
}
