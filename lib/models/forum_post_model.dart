class ForumPost {
  String id;
  String author;
  String content;
  String? imageUrl;
  List<String> comments;

  ForumPost({
    required this.id,
    required this.author,
    required this.content,
    this.imageUrl,
    this.comments = const [],
  });

  void addComment(String comment) {
    comments.add(comment);
  }
}
