import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constant.dart';
import 'package:notes_app/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
// creat addNote method that recive noteModel
  addNote(NoteModel note) async {
    emit(AddNoteLoading());
//use try and catch to check if there is a problem or not
    try {
      //variable noteBox that recive from kNotesBox
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      //if success
      await notesBox.add(note);
      emit(AddNoteSuccess());
    } catch (e) {
      //if failure
      emit(
        AddNoteFailure(
          e.toString(),
        ),
      );
    }
  }
}
