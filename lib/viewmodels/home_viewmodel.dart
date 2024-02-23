import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/post_model.dart';
import '../services/home_service.dart';

class HomeViewModel extends ChangeNotifier {

  final SharedPreferences sharedPreferences;

  HomeViewModel(this.sharedPreferences);

  final HomeService _homeService = HomeService();
  List<PostModel> itemList = [];

  Future<void> fetchData() async {
    try {
      itemList = await _homeService.fetchPosts();
      notifyListeners();
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  void addItem(PostModel newItem) {
    itemList.add(newItem);
    notifyListeners();
  }


}