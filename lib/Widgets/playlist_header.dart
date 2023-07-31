import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/data/data.dart';

class PlaylistHeader extends StatelessWidget {
  final Playlist playlist;

  const PlaylistHeader({
    Key? key,
    required this.playlist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 250.0,
              height: 250.0,
              color: Colors.red,
              child: Icon(
                Icons.headphones,
                size: 100,
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'PLAYLIST',
                  style: Theme.of(context).textTheme.overline!.copyWith(fontSize: 12.0, color: Colors.white),
                ),
                SizedBox(
                  height: 12.0,
                ),
                if (MediaQuery.of(context).size.width > 800)
                  Text(
                    playlist.name,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                SizedBox(
                  height: 16.0,
                ),
                if (MediaQuery.of(context).size.width > 800)
                  Text(
                    playlist.description,
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.white70, fontSize: 14.0),
                  ),
                if (MediaQuery.of(context).size.width > 800)
                  Text(
                    'Created By: ${playlist.creator} • ${playlist.songs.length} songs, ${playlist.duration}',
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.white70, fontSize: 14.0),
                  ),
              ],
            ))
          ],
        ),
        const SizedBox(
          height: 20.0,
        ),
        _PlaylistButtons(followers: playlist.followers),
      ],
    );
  }
}

class _PlaylistButtons extends StatelessWidget {
  final String followers;
  const _PlaylistButtons({Key? key, required this.followers})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 48.0, vertical: 20.0),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              backgroundColor: Theme.of(context).colorScheme.secondary,
              foregroundColor: Colors.white,
              textStyle: Theme.of(context).textTheme.caption!.copyWith(fontSize: 14.0, letterSpacing: 2.0),
            ),
            onPressed: () {},
            child: Text(
              'Play',
            )),
        const SizedBox(width: 8.0),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.favorite_border),
          iconSize: 30.0,
          color: Colors.white,
        ),
        const SizedBox(width: 8.0),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.more_horiz),
          iconSize: 30.0,
          color: Colors.white,
        ),
        const Spacer(),
        Text(
          'Followers:\n$followers',
          style: Theme.of(context).textTheme.overline!.copyWith(fontSize: 12.0, color: Colors.white),
          textAlign: TextAlign.right,
        ),
      ],
    );
  }
}
