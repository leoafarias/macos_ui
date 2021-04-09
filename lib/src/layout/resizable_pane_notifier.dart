import 'package:flutter/foundation.dart';

class ResizablePaneNotifier extends ValueNotifier<Map<Key, double>> {
  ResizablePaneNotifier(Map<Key, double> value) : super(value);

  void reset({bool notify = true}) {
    value.clear();
    if (notify) notifyListeners();
  }

  void remove(Key key, {bool notify = true}) {
    value.remove(key);
    if (notify) notifyListeners();
  }

  void update(Key key, double width, {bool notify = true}) {
    value[key] = width;
    if (notify) notifyListeners();
  }

  void notify() => notifyListeners();
}