import 'package:chichi_gaijin_two/models/pontent.dart';
import 'package:chichi_gaijin_two/pages/lesson_page.dart';
import 'package:chichi_gaijin_two/providers/cards.dart';
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
    final wordsP = Provider.of<Cards>(context);
    final words = wordsP.cards;
    final wordsa = Provider.of<Words>(context);
    final wordsd = wordsa.words;

    return Scaffold(
      appBar: AppBar(
        title: Text('home2'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 400,
            child: ListView.builder(
              itemCount: words.length,
              itemBuilder: (BuildContext context, int wordsIndex) {
                var word = words[wordsIndex];
                if(word is Pontenter)
                  return Text(word.extra);
                else if(word is Pontented)
                  return Text(word.word[0].japanese);//word.word[0].japanese);
                else
                  return Text('sljlnlk');
              },
            ),
          ),
          RaisedButton(
            onPressed: () => wordsP.deleteAll(),
            child: Text('delte all'),
          ),
        ],
      ),

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
          wordsa.init(),
          wordsP.init(),
        },
      ),
    );
  }
}
