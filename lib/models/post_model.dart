class Post {
  int id;
  String title;
  String content;
  int likes;

  Post(
      {required this.id,
      required this.title,
      required this.content,
      this.likes = 0});

  void likePost() {
    likes++;
  }
}
