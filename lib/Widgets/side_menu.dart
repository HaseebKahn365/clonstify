import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/data/data.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key); // Use parentheses for the constructor

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 250.0,
      color: Theme.of(context).primaryColor,
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.library_music,
                  size: 45,
                  color: Theme.of(context).hintColor,
                ),
                Text(
                  ' Spotify',
                  style: TextStyle(fontSize: 35, color: Theme.of(context).hintColor),
                ),
              ],
            ),
          ),
          SideMenuIconTab(
            title: 'home',
            iconData: Icons.home,
            onTap: () {},
          ),
          SideMenuIconTab(
            title: 'Search',
            iconData: Icons.search,
            onTap: () {},
          ),
          SideMenuIconTab(
            title: 'Radio',
            iconData: Icons.audiotrack_rounded,
            onTap: () {},
          ),
          SizedBox(
            height: 12,
          ),
          _LibraryPlaylists(),
        ],
      ),
    );
  }
}

class SideMenuIconTab extends StatelessWidget {
  final IconData iconData;
  final String title;
  final VoidCallback onTap;
  const SideMenuIconTab({
    Key? key,
    required this.iconData,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        iconData,
        color: Theme.of(context).iconTheme.color,
        size: 30,
      ),
      title: Text(title,
          style: TextStyle(
            fontSize: 15,
            color: Theme.of(context).textTheme.bodyText1!.color,
          )),
      onTap: onTap,
    );
  }
}

class _LibraryPlaylists extends StatefulWidget {
  const _LibraryPlaylists({Key? key}) : super(key: key);

  @override
  State<_LibraryPlaylists> createState() => __LibraryPlaylistsState();
}

class __LibraryPlaylistsState extends State<_LibraryPlaylists> {
  ScrollController? _scrollController;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scrollbar(
        thumbVisibility: true,
        controller: _scrollController,
        child: ListView(
          controller: _scrollController,
          padding: EdgeInsets.symmetric(
            vertical: 12,
          ),
          physics: const ClampingScrollPhysics(),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Text(
                    'YOUR LIBRARY',
                    style: Theme.of(context).textTheme.headline4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                ...yourLibrary
                    .map(
                      (e) => ListTile(
                        dense: true,
                        title: Text(
                          e,
                          style: Theme.of(context).textTheme.bodyText1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        onTap: () {},
                      ),
                    )
                    .toList(),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Text(
                    'PLAYLISTS',
                    style: Theme.of(context).textTheme.headline4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                ...playlists
                    .map(
                      (e) => ListTile(
                        dense: true,
                        title: Text(
                          e,
                          style: Theme.of(context).textTheme.bodyText1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        onTap: () {},
                      ),
                    )
                    .toList(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
