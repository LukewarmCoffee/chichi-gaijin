import 'package:chichi_gaijin_two/models/lesson_types.dart';
import 'package:chichi_gaijin_two/pages/lesson_page.dart';
import 'package:chichi_gaijin_two/providers/main/agenda.dart';
//external
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//first touch for the user
class Home extends StatelessWidget {
  static const route = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agenda'),
      ),
      body: Consumer<Agenda>(
        builder: (_, agenda, __) {
          final lessons = agenda.lessons;
          //list of currently available lessons
          return ListView.builder(
            itemCount: lessons.length,
            itemBuilder: (BuildContext context, int lessonIndex) {
              return RaisedButton(
                onPressed: () => Navigator.pushNamed(
                  context,
                  LessonPage.route,
                  arguments: lessonIndex,
                ),
                child: Text(lessons[lessonIndex].title),
              );
            },
          );
        },
      ),
    );
  }
}
