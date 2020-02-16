import 'package:social_app/app/app.dart';
import 'package:social_app/components/album_card.dart';
import 'package:social_app/components/loading_frame.dart';
import 'package:social_app/models/album.dart';
import 'package:flutter/material.dart';

class AlbumsPage extends StatefulWidget {
  const AlbumsPage({Key key}) : super(key: key);

  @override
  _AlbumsPageState createState() => _AlbumsPageState();
}

class _AlbumsPageState extends State<AlbumsPage> {
  @override
  Widget build(BuildContext context) {
    return LoadingFrame(
      loader: (BuildContext context) => SocialApp.serviceOf(context).getAlbums(), 
      builder: (BuildContext context, List<Album> data) {  
        return ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index){
            return AlbumCard(album: data[index],);
          },
        );
      },
    );
  }
}
