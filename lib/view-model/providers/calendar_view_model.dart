import 'package:flutter/material.dart';
import 'package:swc_challenge/view-model/repositories/firebase_repository.dart';

class CalendarViewModel with ChangeNotifier {
  int? _month;
  int? _day;

  static DateTime today = DateTime.now();
  static String? formatedDate;
  static DateTime lastDay = DateTime(5000);
  static DateTime startDay = DateTime(2010);

  void updateDay(DateTime selectedDay, DateTime focusedDay) {
    today = selectedDay;
    _month = selectedDay.month;
    _day = selectedDay.day;
    formatedDate = '$_day/$_month';
    notifyListeners();
  }

  Future<void> setData(String collection, String doc, String? date) async {
    await FirebaseRepository.setDocumentCollectionData(collection, doc, date);
    notifyListeners();
  }
}
