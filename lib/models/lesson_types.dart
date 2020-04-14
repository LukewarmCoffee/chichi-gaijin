import 'package:hive/hive.dart';

part 'lesson_types.g.dart';

@HiveType(typeId: 100)
enum LessonTypes {
  //for now, users cannot edit these directly
  @HiveField(0)
  authorLesson,
  //users can specify whether they are creating a review during lesson creation
  //reviews can not use any new Word cards
  @HiveField(1)
  userReview,
  //user created lesson, users have the ability to go in and edit these
  @HiveField(2)
  userLesson,
  //these will never appear in the HiddenLesson provider
  @HiveField(3)
  machineReview,
}
