import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';

import '../../cubits/notes_cubit/notes_cubit.dart';

class EditNoteBody extends StatefulWidget {
  const EditNoteBody({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditNoteBody> createState() => _EditNoteBodyState();
}

class _EditNoteBodyState extends State<EditNoteBody> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              CustomAppBar(
                onPressed: () {
                  //use widget to access note. because note is inside statefullwidget class
                  //if title is null, use old title
                  widget.note.title = title ?? widget.note.title;
                  //if content is null , use current content
                  widget.note.subTitle = content ?? widget.note.subTitle;
                  //this will save the note after press check icon after edit
                  widget.note.save();
                  //this will refresh notes list after editng note
                  BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                  //this will back to notes list after editing note
                  Navigator.pop(context);
                },
                icon: Icons.check,
                title: 'edit note',
              ),
              const SizedBox(
                height: 60,
              ),
              CustomTextField(
                  //this will change title when user edit it
                  onChanged: (value) {
                    title = value;
                  },
                  //this will show the current note tilte in hint
                  hint: widget.note.title),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                //this will change content when user edit it
                onChanged: (value) {
                  content = value;
                },
                //this will show current note content in hint
                hint: widget.note.subTitle,
                maxLines: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
