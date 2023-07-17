import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constant.dart';
import 'package:notes_app/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
//we use color in cubit so we can access it in addbottomsheet
//color with defult value
  Color? color= const Color(0xffcdb4db);
// creat addNote method that recive noteModel
  addNote(NoteModel note) async {
    //value to transfare it to int, ! is not null because it have defult value
    note.color = color!.value;
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
