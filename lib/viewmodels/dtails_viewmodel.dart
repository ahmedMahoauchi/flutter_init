import 'package:flutter/material.dart';
import 'package:machines_talk_init/models/post_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/item_model.dart';

class DetailsViewModel extends ChangeNotifier {
  final SharedPreferences sharedPreferences;

  DetailsViewModel(this.sharedPreferences);
  PostModel? _selectedItem;

  PostModel? get selectedItem => _selectedItem;

  void selectItem(PostModel item) {
    _selectedItem = item;
    notifyListeners();
  }

  Future<void> saveSelectedPostId() async {
    if (_selectedItem != null) {
      await sharedPreferences.setInt('selectedPostId', _selectedItem!.id);
    }
  }

  Future<int?> getSavedPostId() async {
    return sharedPreferences.getInt('selectedPostId');
  }
}
