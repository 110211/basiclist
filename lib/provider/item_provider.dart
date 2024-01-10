import 'package:flutter/foundation.dart';
import '../model/item_model.dart';

class ItemProvider with ChangeNotifier {
  List<Item> _items = [];

  List<Item> get items => _items;

  void addItem(Item newItem) {
    _items.add(newItem);
    notifyListeners();
  }

  void editItem(int index, Item editedItem) {
    _items[index] = editedItem;
    notifyListeners();
  }

  void deleteItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }
}
