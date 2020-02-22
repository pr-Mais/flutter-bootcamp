import 'package:social_app/app/app.dart';
import 'package:social_app/components/post_card.dart';
import 'package:social_app/models/post.dart';
import 'package:flutter/material.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({Key key}) : super(key: key);

  @override
  _PostsPageState createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: SocialApp.serviceOf(context).getPosts(),
      builder: (context, snapshot){
        if(snapshot.connectionState != ConnectionState.done){
          return Center(child: CircularProgressIndicator(),);
        } else if(snapshot.hasError){
          return Text(snapshot.error);
        } else if(snapshot.hasData){
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index){
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  PostCard(
                    post: snapshot.data[index],
                  ),
                  Divider()
                ],
              );
            },
          );
        }
      },
    );
  }
}
