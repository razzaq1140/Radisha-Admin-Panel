import 'package:flutter/material.dart';

class ReportsAnalyticsModel extends ChangeNotifier {
  String _day = '1 day';
  String get day => _day;

  changeValue(String value) {
    _day = value;
    notifyListeners();
  }
}
