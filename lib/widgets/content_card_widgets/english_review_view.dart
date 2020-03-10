import 'package:chichi_gaijin_two/models/content_cards.dart';
import 'package:chichi_gaijin_two/providers/agenda.dart';
import 'package:chichi_gaijin_two/providers/deck.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//updates values in deck
class EnglishReviewView extends StatefulWidget {
  final int lessonIndex;
  final int cardIndex;

  const EnglishReviewView({
    @required this.lessonIndex,
    @required this.cardIndex,
  });

  @override
  _EnglishReviewViewState createState() => _EnglishReviewViewState();
}

class _EnglishReviewViewState extends State<EnglishReviewView> {
  bool showAnswer = true;

  checkAnswer() {
    setState(() {
      showAnswer = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final agenda = Provider.of<Agenda>(context);
    //change this to non-altering provider
    final EnglishReview review =
        agenda.lessons[widget.lessonIndex].cards[widget.cardIndex];
    final deck = Provider.of<Deck>(context);
    final word = agenda.getWord(review.wordId);

    return showAnswer
        ? Column(
            children: <Widget>[
              Text('What does this word mean in English?'),
              Text(word.japanese),
              RaisedButton(
                onPressed: () => checkAnswer(),
                child: Text('show answer'),
              ),
            ],
          )
        : Column(
            children: <Widget>[
              Text('What does this word mean in English?'),
              Text(word.japanese),
              Text(word.english),
              Row(
                children: <Widget>[
                  RaisedButton(
                    onPressed: () => {
                      deck.changeConfidence(word: word, confidence: -1.0),
                      agenda.removeReviewable(
                          lessonIndex: widget.lessonIndex,
                          cardIndex: widget.cardIndex),
                    },
                    child: Text('bad'),
                  ),
                  RaisedButton(
                    onPressed: () => {
                      deck.changeConfidence(word: word, confidence: 1.0),
                      agenda.removeReviewable(
                          lessonIndex: widget.lessonIndex,
                          cardIndex: widget.cardIndex),
                    },
                    child: Text('good'),
                  ),
                ],
              )
            ],
          );
  }
}
