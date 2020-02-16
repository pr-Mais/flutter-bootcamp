import 'package:social_app/models/post.dart';
import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    Key key,
    @required this.post,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {

    var nameList = post.user.name.split(' ');
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 20,
      ),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey[100],
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        title: Text(post.title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(post.body),
            SizedBox(
              height: 10,
            ),
            Text('by: ${post.user.name}', style: Theme.of(context).textTheme.subtitle2,)
          ],
        ),
        leading: CircleAvatar(
          child: Text(nameList[0][0] + nameList[1][0]),
        ),
      ),
    );
  }
}
