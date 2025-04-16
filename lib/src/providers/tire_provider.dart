import 'package:flutter/material.dart';
import '../models/tire.dart';
import '../services/tire_service.dart';

class TireProvider extends ChangeNotifier {
  List<Tire> _tires = [];
  bool _isLoading = false;
  bool _hasFetchedOnce = false;

  List<Tire> get tires => _tires;
  bool get isLoading => _isLoading;

  Future<void> fetchTires() async {
    if (_hasFetchedOnce) return;

    _isLoading = true;
    notifyListeners();

    _tires = await TireService.getTires();
    _hasFetchedOnce = true;

    _isLoading = false;
    notifyListeners();
  }

  void resetData() {
    _tires = [];
    _hasFetchedOnce = false;
    notifyListeners();
  }
}
