import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';

class EditNoteBody extends StatelessWidget {
  const EditNoteBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 60,
              ),
              CustomAppBar(
                icon: Icons.check,
                title: 'edit note',
              ),
              SizedBox(
                height: 60,
              ),
              CustomTextField(hint: 'title'),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                hint: 'content',
                maxLines: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
