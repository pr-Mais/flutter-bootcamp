import 'package:flutter/material.dart';

class AlbumExpanded extends StatefulWidget {
  AlbumExpanded({
    this.album,
  });
  final album;
  @override
  _AlbumExpandedState createState() => _AlbumExpandedState();
}

class _AlbumExpandedState extends State<AlbumExpanded> {
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.album.title),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(20),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: widget.album.photos.length,
        itemBuilder: (context, index) {
          return FadeInImage.assetNetwork(
            fadeOutDuration: Duration(milliseconds: 100),
            fadeInDuration: Duration(milliseconds: 100),
            placeholder: 'assets/loading.gif',
            image:  widget.album.photos[index].url,
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}
