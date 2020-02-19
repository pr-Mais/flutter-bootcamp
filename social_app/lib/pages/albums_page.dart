import 'package:social_app/app/app.dart';
import 'package:social_app/components/album_card.dart';
import 'package:flutter/material.dart';
import 'package:social_app/models/album.dart';

class AlbumsPage extends StatefulWidget {
  const AlbumsPage({Key key}) : super(key: key);

  @override
  _AlbumsPageState createState() => _AlbumsPageState();
}

class _AlbumsPageState extends State<AlbumsPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Album>>(
      future: SocialApp.serviceOf(context).getAlbums(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        } else if (snapshot.hasData) {
          return ListView.builder(
            padding: EdgeInsets.only(top: 16.0),
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return AlbumCard(
                album: snapshot.data[index],
              );
            },
          );
        } else if (snapshot.connectionState != ConnectionState.done) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
