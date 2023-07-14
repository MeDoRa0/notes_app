import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/models/note_model.dart';

import '../../constant.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
//this method to fetch all notes and show them
  fetchAllNotes() async {
    //we disable loading because we dont need it here
    //emit(NotesLoading());
//use try and catch to check if there is a problem or not
    try {
      //variable noteBox that recive from kNotesBox
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      //list of notemodel
      List<NoteModel>notes=notesBox.values.toList();
      //if success use emit notesuccess, and use list of notemodel
      emit(NotesSuccess(notes));
    } catch (e) {
      //if failure
      emit(
        NotesFailure(
          e.toString(),
        ),
      );
    }
  }
}
