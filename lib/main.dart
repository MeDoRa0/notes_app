import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/constant.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/simple_bloc_observer.dart';
import 'package:notes_app/views/notes_view.dart';

void main() async {
  //to intiate hive
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObserver();
  //to tell hive to deal with notemodel by  register type adapter named NoteModelAdabter that created in note_model.g.dart
  Hive.registerAdapter(NoteModelAdapter());
  //use await because openbox is future, open note box type of NoteModel
  await Hive.openBox<NoteModel>(kNotesBox);

  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    //to provide cubit
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: MaterialApp(
        //to remove debug mode banner
        debugShowCheckedModeBanner: false,
        //set theme in dark mode
        theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Poppins'),
        home: const NotesView(),
      ),
    );
  }
}
