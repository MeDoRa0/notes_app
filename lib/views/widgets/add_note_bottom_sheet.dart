//the box the show from bottom to type new note
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'add_note_form.dart';

// we use statefullwidget because we using variable like isLoading
class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    //provide AddNoteCubit when add new note
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteFailure) {
            print('failed ${state.errorMessage}');
          }
          if (state is AddNoteSuccess) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          //AbsorbPointer will prevent user to enter new data while loading
          return AbsorbPointer(
            //if state is loading , activate absorbpointer
            absorbing: state is AddNoteLoading ? true : false,
            child: const Padding(
              padding:  EdgeInsets.symmetric(horizontal: 16),
              child:  SingleChildScrollView(
                child: AddNoteForm(),
              ),
            ),
          );
        },
      ),
    );
  }
}
