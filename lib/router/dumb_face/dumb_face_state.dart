import 'dart:math';

import 'package:fluent_ui/fluent_ui.dart';

class DumbFaceState extends ChangeNotifier {
  final Random _random = Random();
  var disabled = false;
  double progress = 0;

  void disable() {
    disabled = true;
    notifyListeners();
  }

  void enable() {
    disabled = false;
    notifyListeners();
  }

  void toggle() {
    disabled = !disabled;
    notifyListeners();
  }

  void trigger() {
    progress += 5 + _random.nextDouble() * 5;
    if (progress > 100) {
      progress = 0;
    }
    notifyListeners();
  }
}