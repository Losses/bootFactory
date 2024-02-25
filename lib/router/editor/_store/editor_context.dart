import 'package:flutter/foundation.dart';

class EditorContext extends ChangeNotifier {
  String? _id;

  EditorContext();

  setId(String? x) {
    _id = x;
    notifyListeners();
  }

  getId() {
    return _id;
  }
}

final editorContext = EditorContext();
