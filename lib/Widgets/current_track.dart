import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Models/current_track_model.dart';

class CurrentTrack extends StatelessWidget {
  const CurrentTrack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.0,
      width: double.infinity,
      color: Colors.black45,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            _TrackInfo(),
            const Spacer(),
            _PlayerControls(),
            const Spacer(),
            if (MediaQuery.of(context).size.width > 800) _MoreControls(),
          ],
        ),
      ),
    );
  }
}

class _TrackInfo extends StatelessWidget {
  _TrackInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selected = context.watch<CurrentTrackModel>().selected;
    if (selected == null) {
      return const SizedBox.shrink();
    }
    return Row(
      children: [
        Container(
          width: 60.0,
          height: 60.0,
          color: Colors.red,
          child: Icon(
            Icons.headphones,
            size: 20,
          ),
        ),
        const SizedBox(width: 12.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              selected.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5.0),
            Text(
              selected.artist,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14.0,
              ),
            ),
          ],
        ),
        const SizedBox(width: 12.0),
        IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border))
      ],
    );
  }
}

class _PlayerControls extends StatelessWidget {
  const _PlayerControls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selected = context.watch<CurrentTrackModel>().selected;
    return Column(
      children: [
        Row(children: [
          IconButton(onPressed: () {}, icon: Icon(Icons.shuffle)),
          IconButton(onPressed: () {}, icon: Icon(Icons.skip_previous)),
          IconButton(onPressed: () {}, icon: Icon(Icons.play_arrow)),
          IconButton(onPressed: () {}, icon: Icon(Icons.skip_next)),
          IconButton(onPressed: () {}, icon: Icon(Icons.repeat)),
        ]),
        const SizedBox(height: 4.0),
        Row(
          children: [
            Text(
              '0:00',
              style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: 12.0,
              ),
            ),
            const SizedBox(width: 8.0),
            Container(
              height: 5.0,
              width: MediaQuery.of(context).size.width * 0.3,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),
            const SizedBox(width: 8.0),
            Text(
              selected?.duration ?? '0:00',
              style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: 12.0,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _MoreControls extends StatelessWidget {
  const _MoreControls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.devices_outlined,
            color: Colors.white,
          ),
          iconSize: 20.0,
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.volume_up_outlined,
                color: Colors.white,
              ),
              iconSize: 20.0,
            ),
            Container(
              height: 5.0,
              width: 70.0,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),
          ],
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.fullscreen_exit_outlined))
      ],
    );
  }
}
