enum LessonTypes{
  //for now, users cannot edit these directly
  authorLesson, 
  //users can specify whether they are creating a review during lesson creation
  //reviews can not use any new Word cards
  userReview,
  //user created lesson, users have the ability to go in and edit these
  userLesson,
  //these will never appear in the HiddenLesson provider
  machineReview,
}