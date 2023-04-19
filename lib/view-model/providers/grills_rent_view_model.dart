import 'package:flutter/material.dart';
import 'package:swc_challenge/view-model/repositories/firebase_repository.dart';

import '../../model/grills.dart';

class GrillRentViewModel with ChangeNotifier {
  List<GrillsModel> grillsModel = [];
  bool implyLeading = false;

  Future<void> returnData() async {
    final response = await FirebaseRepository.getGrillsList();
    grillsModel = response;
  }

  void changeLeading() {
    implyLeading = true;
    notifyListeners();
  }
}
