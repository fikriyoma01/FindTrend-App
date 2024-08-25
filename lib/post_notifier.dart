import 'package:flutter/material.dart';
import 'models/forum_post_model.dart';
import 'models/post_model.dart';
import 'services/post_service.dart';

class PostNotifier extends ChangeNotifier {
  final List<ForumPost> _posts = [];

  List<ForumPost> get posts => List.unmodifiable(_posts);

  void addPost(ForumPost post) {
    _posts.insert(0, post);
    notifyListeners();
  }

  loadPosts() {}
}
