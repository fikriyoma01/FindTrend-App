import '../models/forum_post_model.dart';

class ForumService {
  static final List<ForumPost> _posts = [];

  static List<ForumPost> getPosts() => List.unmodifiable(_posts);

  static void addPost(ForumPost post) {
    _posts.insert(0, post); 
  }

  static void addComment(String postId, String comment) {
    final post = _posts.firstWhere((p) => p.id == postId);
    post.addComment(comment);
  }
}
