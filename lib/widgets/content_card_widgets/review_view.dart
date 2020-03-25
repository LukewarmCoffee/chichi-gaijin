import 'package:chichi_gaijin_two/data/words.dart';
import 'package:chichi_gaijin_two/models/content_card.dart';
import 'package:chichi_gaijin_two/models/models.dart';
import 'package:chichi_gaijin_two/providers/agenda.dart';
import 'package:chichi_gaijin_two/providers/deck.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//updates values in deck
class ReviewView extends StatefulWidget {
  final ReviewCard card;

  const ReviewView(this.card);

  @override
  _ReviewViewState createState() => _ReviewViewState();
}

class _ReviewViewState extends State<ReviewView> {
  bool showAnswer = true;

  checkAnswer() {
    setState(() {
      showAnswer = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Words>(context);

    return widget.card.word.isNotEmpty
        ? showAnswer
            ? Column(
                children: <Widget>[
                  Text('What does this word mean in English?'),
                  Text(widget.card.word[0].japanese),
                  RaisedButton(
                    onPressed: () => checkAnswer(),
                    child: Text('show answer'),
                  ),
                ],
              )
            : Column(
                children: <Widget>[
                  Text('What does this word mean in English?'),
                  Text(widget.card.word[0].japanese),
                  Text(widget.card.word[0].english),
                  Row(
                    children: <Widget>[
                      RaisedButton(
                        onPressed: () => {
                          provider.editWord(
                            word: Word(
                              japanese: widget.card.word[0].japanese,
                              kana: widget.card.word[0].kana,
                              romaji: widget.card.word[0].romaji,
                              english: widget.card.word[0].english,
                              definition: widget.card.word[0].definition,
                              learned: widget.card.word[0].learned,
                              confidence: widget.card.word[0].confidence - 1,
                            ),
                            wordKey: widget.card.word[0].key,
                          ),
                          /*deck.changeConfidence(word: word, confidence: -1.0),
                      agenda.removeReviewable(
                          lessonIndex: widget.lessonIndex,
                          cardIndex: widget.cardIndex),*/
                        },
                        child: Text('bad'),
                      ),
                      RaisedButton(
                        onPressed: () => {
                          provider.editWord(
                            word: Word(
                              japanese: widget.card.word[0].japanese,
                              kana: widget.card.word[0].kana,
                              romaji: widget.card.word[0].romaji,
                              english: widget.card.word[0].english,
                              definition: widget.card.word[0].definition,
                              learned: widget.card.word[0].learned,
                              confidence: widget.card.word[0].confidence + 1,
                            ),
                            wordKey: widget.card.word[0].key,
                          ),
                          /*deck.changeConfidence(word: word, confidence: 1.0),
                      agenda.removeReviewable(
                          lessonIndex: widget.lessonIndex,
                          cardIndex: widget.cardIndex),*/
                        },
                        child: Text('good'),
                      ),
                    ],
                  )
                ],
              )
        : Text('review view empty');
  }
}
