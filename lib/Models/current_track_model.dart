import 'package:flutter/material.dart';

import '../data/data.dart';

class CurrentTrackModel extends ChangeNotifier {
  Song? selected;

  void selectTrack(Song song) {
    selected = song;
    notifyListeners();
  }
}
