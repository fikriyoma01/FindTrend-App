import '../models/post_model.dart';

class PostService {
  static final List<Post> _posts = [
    Post(
      id: 1,
      title: 'Gardening Tip 1',
      content:
          'Ensure you water your succulents correctly; too much water is worse than too little!',
    ),
    Post(
      id: 2,
      title: 'Gardening Tip 2',
      content:
          'Herbs love the morning sun. Place them where they will get a few hours of morning sunlight.',
    ),
    Post(
      id: 3,
      title: 'Gardening Tip 3',
      content:
          'Companion planting can be beneficial. For example, marigolds deter pests from tomatoes!',
    ),
    Post(
      id: 4,
      title: 'Gardening Tip 4',
      content:
          'Pruning is crucial. Regularly remove dead or overgrown branches or stems to encourage growth.',
    ),
    Post(
      id: 5,
      title: 'Gardening Tip 5',
      content:
          'Make your own compost. It’s a great way to recycle kitchen waste and improve soil health.',
    ),
  ];

  static List<Post> getPosts() {
    return _posts;
  }
}
