import 'package:chichi_gaijin_two/data/data.dart';
import 'package:chichi_gaijin_two/models/content_card.dart';
import 'package:chichi_gaijin_two/pages/lesson_page.dart';
import 'package:chichi_gaijin_two/providers/providers.dart';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
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
          /*Container(
            height: 200,
            child: lessons.isEmpty
                ? Container(child: Text('yo'))
                : ListView.builder(
                    itemCount: lessons.length,
                    itemBuilder: (BuildContext context, int cardsIndex) {
                      var lesson = lessons[cardsIndex];
                      return Text(lesson.title);
                    },
                  ),
          ),
          Container(
            height: 200,
            child: ListView.builder(
              itemCount: cards.length,
              itemBuilder: (BuildContext context, int cardsIndex) {
                var card = cards[cardsIndex];
                if (card is TitleCard)
                  return Text(card.title);
                else if (card is SentenceReviewCard)
                  return Text(card.words.isEmpty
                      ? 'empty'
                      : card.words[0].japanese); //word.word[0].japanese);
                else
                  return Text('sljlnlk');
              },
            ),
          ),*/
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
          wordsP.init(),
          cardsP.init(),
          lessonsP.init(),
        },
      ),
    );
  }
}
