import '../models/post_model.dart';

abstract class HomeServiceIterface {
  Future<List<PostModel>> fetchPosts();
}