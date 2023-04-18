import 'package:flutter/material.dart';
import 'package:swc_challenge/view-model/grill_repository.dart';

import '../../model/grills.dart';

class GrillRentViewModel with ChangeNotifier {
  List<GrillsModel> grillsModel = [];

  Future<void> returnData() async {
    final response = await GrillRepository.getGrillsList();
    grillsModel = response;
  }
}
