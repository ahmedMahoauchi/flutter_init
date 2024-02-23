import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:machines_talk_init/interfaces/home_interface.dart';
import 'dart:convert';
import '../models/post_model.dart';

class HomeService implements HomeServiceIterface {

  @override
  Future<List<PostModel>> fetchPosts() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((item) => PostModel(item['id'], item['title'], item['body'])).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}


