import 'package:social_app/models/user.dart';

//@immutable
class Post {
  const Post._({
      this.id,
      this.user,
      this.title,
      this.body,
  });

  final int id;
  final User user;
  final String title;
  final String body;

  factory Post.fromJson(List<User> users, Map json){
    int userId = json['userId'];
    final user = users.firstWhere((element) => element.id == userId);
    return Post._(
      id: json['id'] as int,
      user: user,
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }
}
