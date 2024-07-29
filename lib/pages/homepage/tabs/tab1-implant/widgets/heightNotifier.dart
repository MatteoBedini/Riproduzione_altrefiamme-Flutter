import 'package:flutter/material.dart';

class HeightNotifier extends ChangeNotifier {
  double _height = 0; // Altezza iniziale

  double get height => _height;

  void setHeight(double newHeight) {
    _height = newHeight;
    notifyListeners(); // Notifica i listener del cambiamento
  }

  double getHeightWithOffset(double offset) => _height + offset;
}
