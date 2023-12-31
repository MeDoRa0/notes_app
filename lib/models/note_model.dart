import 'package:hive/hive.dart';
//this fill will be generated to creat file adabter for this model
part 'note_model.g.dart';

// determine type id for the object in hive database
@HiveType(typeId: 0)
// we use hiveobject to make the model able to store in hive
class NoteModel extends HiveObject {
  //give each field a hivefield id
  @HiveField(0)
   String title;
  @HiveField(1)
   String subTitle;
  @HiveField(2)
   String date;
  @HiveField(3)
   int color;

  NoteModel(
      {required this.title,
      required this.subTitle,
      required this.date,
      required this.color});
}
