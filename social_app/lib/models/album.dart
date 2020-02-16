import 'photo.dart';
import 'user.dart';

class Album {
  const Album._({
    this.photos,
    this.user,
    this.userId,
    this.id,
    this.title,
  });
  final List<Photo> photos;
  final User user;
  final int userId;
  final int id;
  final String title;

  factory Album.fromJson(List<Photo> photos, List<User> users, Map json) {
    final albumId = json['id'];
    final userId = json['userId'];
    final photoList =
        photos.where((element) => element.albumId == albumId).toList();
    final user = users.firstWhere((element) => element.id == userId);
    return Album._(
      photos: photoList,
      user: user,
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}
