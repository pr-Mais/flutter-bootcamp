import 'package:social_app/pages/expanded_album.dart';
import 'package:flutter/material.dart';

class AlbumCard extends StatelessWidget {
  const AlbumCard({
    this.album,
  });
  final album;

  @override
  Widget build(BuildContext context) {
   
    expandAlbum() {
      Navigator.of(context).push(
        MaterialPageRoute(
          fullscreenDialog: true,
          builder: (context) => AlbumExpanded(
            album: album,
          ),
        ),
      );
    }

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
      child: GestureDetector(
        onTap: expandAlbum,
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              width: 100,
              height: 100,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return FadeInImage.assetNetwork(
                    fadeOutDuration: Duration(milliseconds: 100),
                    fadeInDuration: Duration(milliseconds: 100),
                    placeholder: 'assets/loading.gif',
                    image: album.photos[index].url,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    album.title,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text(
                    'created by: ${album.user.name}',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
