import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/constant.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/notes_view.dart';

void main() async {
  //to intiate hive
  await Hive.initFlutter();
  //use await because openbox is future, open note box
  await Hive.openBox(kNotesBox);
  //to tell hive to deal with notemodel by  register type adapter named NoteModelAdabter that created in note_model.g.dart
  Hive.registerAdapter(NoteModelAdapter());
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //to remove debug mode banner
      debugShowCheckedModeBanner: false,
      //set theme in dark mode
      theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Poppins'),
      home: const NotesView(),
    );
  }
}
