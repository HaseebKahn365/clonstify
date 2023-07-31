import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/Models/current_track_model.dart';
import 'package:provider/provider.dart';

import '../data/data.dart';

class TracksList extends StatelessWidget {
  const TracksList({Key? key, required this.tracks}) : super(key: key);

  final List<Song> tracks;
  @override
  Widget build(BuildContext context) {
    return DataTable(
      headingTextStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
      showCheckboxColumn: false,
      dataRowMinHeight: 40.0,
      columns: [
        DataColumn(label: Text('TITLE', style: Theme.of(context).textTheme.bodyLarge)),
        DataColumn(label: Text('ARTIST', style: Theme.of(context).textTheme.bodyLarge)),
        DataColumn(label: Text('Album', style: Theme.of(context).textTheme.bodyLarge)),
        DataColumn(
          label: Icon(Icons.access_time),
        ),
      ],
      rows: tracks.map((e) {
        final selected = context.watch<CurrentTrackModel>().selected?.id == e.id;
        final textStyle = TextStyle(
          color: selected ? Theme.of(context).colorScheme.secondary : Theme.of(context).iconTheme.color,
          fontWeight: selected ? FontWeight.bold : FontWeight.normal,
        );
        return DataRow(
          cells: [
            DataCell(
              Text(e.title, style: textStyle),
            ),
            DataCell(
              Text(e.artist, style: textStyle),
            ),
            DataCell(
              Text(e.album, style: textStyle),
            ),
            DataCell(Text(
              e.duration,
              style: textStyle,
            )),
          ],
          selected: selected,
          onSelectChanged: (_) => context.read<CurrentTrackModel>().selectTrack(e),
        );
      }).toList(),
    );
  }
}
