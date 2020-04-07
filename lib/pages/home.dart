import 'package:chichi_gaijin_two/data/data.dart';
import 'package:chichi_gaijin_two/pages/lesson_page.dart';
import 'package:chichi_gaijin_two/pages/pages.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  static const route = '/';
  @override
  Widget build(BuildContext context) {
    final lessonsP = Provider.of<Lessons>(context);
    final lessons = lessonsP.lessons;
    final cardsP = Provider.of<Cards>(context);
    final cards = cardsP.cards;
    final wordsP = Provider.of<Words>(context);
    //TODO: wont load without, but 
    //Hive.openBox(Words.boxName);

    return Scaffold(
      appBar: AppBar(
        title: Text('home2'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 400,
            child: ListView.builder(
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
            ),
          ),
          RaisedButton(
            onPressed: () => {
              wordsP.deleteAll(),
              lessonsP.deleteAll(),
              cardsP.deleteAll(),
            },
            child: Text('delte all'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.pushNamed(context, CreateLesson.route),
          /*wordsP.init(),
          cardsP.init(),
          lessonsP.init(),*/
        },
      ),
    );
  }
}
