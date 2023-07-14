import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/models/note_model.dart';

import '../../constant.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  //list of notmodel called notes
  List<NoteModel>? notes;
  //this method to fetch all notes and show them
  fetchAllNotes() async {
    //we disable loading because we dont need it here
    //emit(NotesLoading());

    //variable noteBox that recive from kNotesBox
    var notesBox = Hive.box<NoteModel>(kNotesBox);
    //list of notemodel
    notes = notesBox.values.toList();
    emit(NotesSuccess());
  }
}
