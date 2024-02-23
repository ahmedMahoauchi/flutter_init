import 'package:flutter/material.dart';
import 'package:machines_talk_init/services/textField_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TextFieldViewModel extends ChangeNotifier {
  final SharedPreferences sharedPreferences;

  TextFieldViewModel(this.sharedPreferences);
  final TextFieldService _textFieldService = TextFieldService();

  Future<void> sendPostData(String title, String body) async {
    await _textFieldService.sendPostData(title, body);
  }

}
