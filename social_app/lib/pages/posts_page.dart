import 'package:social_app/app/app.dart';
import 'package:social_app/components/loading_frame.dart';
import 'package:social_app/components/post_card.dart';
import 'package:social_app/models/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({Key key}) : super(key: key);

  @override
  _PostsPageState createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  @override
  Widget build(BuildContext context) {
    return LoadingFrame<List<Post>>(
      loader: (BuildContext context) => SocialApp.serviceOf(context).getPosts(),
      builder: (BuildContext context, List<Post> posts) {
        return AnimationLimiter(
          child: ListView.builder(
            padding: EdgeInsets.only(top: 16.0),
            itemCount: posts.length,
            itemBuilder: (context, index) {
              return AnimationConfiguration.staggeredList(
                delay: Duration(milliseconds: 200),
                position: index,
                child: SlideAnimation(
                  verticalOffset: 48.0,
                  child: FadeInAnimation(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        PostCard(
                          post: posts[index],
                        ),
                        Divider()
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
