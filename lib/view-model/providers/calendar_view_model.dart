import 'package:flutter/material.dart';

class CalendarViewModel with ChangeNotifier {
  void updateDay(DateTime selectedDay, DateTime focusedDay) {
    selectedDay = focusedDay;
    focusedDay = selectedDay;
    notifyListeners();
  }

  void changeFormat() {}
}
