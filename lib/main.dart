// ignore_for_file: prefer_const_constructors

import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/data/data.dart';
import 'dart:io';

import 'Screens/playlist_screen.dart';
import 'Widgets/side_menu.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb && (Platform.isMacOS || Platform.isLinux || Platform.isWindows)) {
    await DesktopWindow.setMinWindowSize(const Size(800, 600));
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Spotify UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
        scaffoldBackgroundColor: const Color(0xFF121212),
        primaryColor: Colors.black,
        hintColor: const Color(0xFF1DB954),
        iconTheme: const IconThemeData().copyWith(color: Colors.white70),
        textTheme: TextTheme(
          headline2: const TextStyle(
            color: Colors.white,
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Montserrat',
          ),
          headline4: TextStyle(
            fontSize: 12.0,
            color: Colors.grey[300],
            fontWeight: FontWeight.w500,
            letterSpacing: 2.0,
            fontFamily: 'Montserrat',
          ),
          bodyText1: TextStyle(
            color: Colors.grey[300],
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.0,
            fontFamily: 'Montserrat',
          ),
          bodyText2: TextStyle(
            color: Colors.grey[300],
            letterSpacing: 1.0,
            fontFamily: 'Montserrat',
          ),
        ),
        colorScheme: ColorScheme.dark(
          background: const Color(0xFF121212),
          surface: Colors.white,
          primary: Colors.white,
          secondary: const Color(0xFF1DB954),
        ),
      ),
      home: Shell(),
    );
  }
}

class Shell extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
            child: Row(
          children: [
            SideMenu(),
            Expanded(child: PlaylistScreen(playlist: lofihiphopPlaylist)),
          ],
        )),
        Container(
          height: 84.0,
          color: Colors.blue,
          width: double.infinity,
        ),
      ]),
    );
  }
}
