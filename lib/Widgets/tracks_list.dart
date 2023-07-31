import 'package:flutter/material.dart';

import '../data/data.dart';

class TracksList extends StatelessWidget {
  const TracksList({Key? key, required this.tracks}) : super(key: key);

  final List<Song> tracks;
  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: [
        DataColumn(label: Text('TITLE', style: Theme.of(context).textTheme.bodyLarge)),
        DataColumn(label: Text('ARTIST', style: Theme.of(context).textTheme.bodyLarge)),
        DataColumn(label: Text('Album', style: Theme.of(context).textTheme.bodyLarge)),
        DataColumn(
          label: Icon(Icons.access_time),
        ),
      ],
      rows: tracks.map((e) {
        return DataRow(
          cells: [
            DataCell(
              Text(e.title, style: TextStyle(color: Theme.of(context).iconTheme.color)),
            ),
            DataCell(
              Text(e.artist, style: TextStyle(color: Theme.of(context).iconTheme.color)),
            ),
            DataCell(
              Text(e.album, style: TextStyle(color: Theme.of(context).iconTheme.color)),
            ),
            DataCell(Text(
              e.duration,
              style: TextStyle(color: Theme.of(context).iconTheme.color),
            )),
          ],
        );
      }).toList(),
    );
  }
}
