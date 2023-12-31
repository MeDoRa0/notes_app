//we use statefullWidget to use autovalidatemode and creat non final variables
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';

import 'colors_list_view.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  //we creat this because we use form
  final GlobalKey<FormState> formKey = GlobalKey();
  //we use this to vaildate user input
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          CustomTextField(
            onSaved: (value) {
              title = value;
            },
            hint: 'title',
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            onSaved: (value) {
              subTitle = value;
            },
            hint: 'content',
            maxLines: 5,
          ),
          const SizedBox(
            height: 20,
          ),
          const ColorsListview(),
          const SizedBox(
            height: 20,
          ),
          //i need custombutton listen on addnotestate so i warp it with blocbuilder
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                //if state is addnoteloading, show loading, if not , dont show
                isLoading: state is AddNoteLoading ? true : false,
                onTap: () {
                  //validate the currentstate
                  if (formKey.currentState!.validate()) {
                    //save currentstate
                    formKey.currentState!.save();
                    var currentDate = DateTime.now();
                    //this will creat formated date
                    var formatedCurrentDate =
                        DateFormat.yMd().format(currentDate);
                    //this if i want to creat format  DateFormat('dd/mm/yyyy').format(currentDate);
                    //creat model then save model in note so we can creat new note
                    var noteModel = NoteModel(
                        title: title!,
                        subTitle: subTitle!,
                        date: formatedCurrentDate,
                        color: Colors.blue.value);
                    BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                  } else {
                    //this to validate user input all the time
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
          const SizedBox(
            height: 16,
          )
        ],
      ),
    );
  }
}

