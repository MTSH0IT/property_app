import 'package:flutter/material.dart';

class FeatureManagment {
  static void addItem(List items, TextEditingController controller) {
    final text = controller.text.trim();
    if (text.isNotEmpty) {
      items.add(text);
      controller.clear();
    }
  }

  static void removeItem(int index, List item) {
    item.removeAt(index);
  }
}
