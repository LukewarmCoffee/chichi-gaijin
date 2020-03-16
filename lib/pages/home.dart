import 'package:chichi_gaijin_two/pages/lesson_page.dart';
import 'package:chichi_gaijin_two/providers/providers.dart';
import 'package:chichi_gaijin_two/providers/words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  static const route = '/';
  @override
  Widget build(BuildContext context) {
    final agenda = Provider.of<Agenda>(context);
    final lessons = agenda.lessons;
    final wordsP = Provider.of<Words>(context);
    final words = wordsP.words;

    return Scaffold(
      appBar: AppBar(
        title: Text('home2'),
      ),
      body: ListView.builder(
          itemCount: words.length,
          itemBuilder: (BuildContext context, int wordsIndex) {
            return Text(words[wordsIndex].definition);
          }),

      /*ListView.builder(
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
      ),*/
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          agenda.initData(),
          wordsP.init(),
        },
      ),
    );
  }
}
