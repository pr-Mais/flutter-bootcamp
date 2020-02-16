import 'dart:convert';
import 'package:social_app/models/album.dart';
import 'package:social_app/models/photo.dart';
import 'package:social_app/models/post.dart';
import 'package:social_app/models/user.dart';
import 'package:http/http.dart' as http;

class GetService {
  const GetService();

  Future<List<Post>> getPosts() async {
    http.Response response =
        await http.get('https://jsonplaceholder.typicode.com/posts');
    List<User> users = await getUsers();
    List posts = json.decode(response.body);
    return posts.map((el) => Post.fromJson(users, el)).toList();
  }

  Future<List<Photo>> getPhotos() async {
    http.Response response =
        await http.get('https://jsonplaceholder.typicode.com/photos');
    List photos = json.decode(response.body);
    return photos.map((el) => Photo.fromJson(el)).toList();
  }

  Future<List<Album>> getAlbums() async {
    http.Response response =
        await http.get('https://jsonplaceholder.typicode.com/albums');
    List<Photo> photos = await getPhotos();
    List<User> users = await getUsers();
    List albums = json.decode(response.body);
    return albums.map((el) => Album.fromJson(photos, users, el)).toList();
  }

  Future<List<User>> getUsers() async {
    http.Response response =
        await http.get('https://jsonplaceholder.typicode.com/users');
    List users = json.decode(response.body);
    return users.map((el) => User.fromJson(el)).toList();
  }
}
