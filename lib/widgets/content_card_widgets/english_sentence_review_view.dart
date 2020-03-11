import 'package:chichi_gaijin_two/models/content_cards.dart';
import 'package:chichi_gaijin_two/models/word.dart';
import 'package:chichi_gaijin_two/providers/agenda.dart';
import 'package:chichi_gaijin_two/providers/deck.dart';
import 'package:chichi_gaijin_two/services/depressable_sentence.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//updates values in deck
class EnglishSentenceReviewView extends StatefulWidget {
  final int lessonIndex;
  final int cardIndex;

  const EnglishSentenceReviewView({
    @required this.lessonIndex,
    @required this.cardIndex,
  });

  @override
  _EnglishSentenceReviewViewState createState() =>
      _EnglishSentenceReviewViewState();
}

class _EnglishSentenceReviewViewState extends State<EnglishSentenceReviewView> {
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
    final EnglishSentenceReview review =
        agenda.lessons[widget.lessonIndex].cards[widget.cardIndex];
    final deck = Provider.of<Deck>(context);
    final List<Word> sentence = agenda.getWords(review.wordIds);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DepressableSentence>(
          create: (_) => DepressableSentence(),
        ),
      ],
      child: showAnswer
          ? Column(
              children: <Widget>[
                Text('What does this sentence mean in English?'),
                Row(
                  children: <Widget>[
                    for (int i = 0; i < sentence.length; i++)
                      Text(sentence[i].japanese)
                  ],
                ),
                RaisedButton(
                  onPressed: () => checkAnswer(),
                  child: Text('show answer'),
                ),
              ],
            )
          : Consumer<DepressableSentence>(
              builder: (_, depressableSentence, __) {
                //TODO: setting this here causes errors
                depressableSentence.setSentence(review.wordIds);
                List<bool> depressions = depressableSentence.depressions;
                List<String> depressedSublist =
                    depressableSentence.depressedSubList;
                return Column(
                  children: <Widget>[
                    Text("Tap the words that you didn't understand"),
                    Row(
                      children: <Widget>[
                        for (int i = 0; i < sentence.length; i++)
                          depressions[i]
                              ? Container(
                                  color: Colors.green,
                                  child: RaisedButton(
                                    onPressed: () =>
                                        depressableSentence.unDepress(i),
                                    child: Column(
                                      children: <Widget>[
                                        Text(sentence[i].japanese),
                                        Text(sentence[i].english),
                                      ],
                                    ),
                                  ),
                                )
                              : Container(
                                  color: Colors.yellow,
                                  child: RaisedButton(
                                    onPressed: () =>
                                        depressableSentence.depress(i),
                                    child: Column(
                                      children: <Widget>[
                                        Text(sentence[i].japanese),
                                        Text(sentence[i].english),
                                      ],
                                    ),
                                  ),
                                ),
                      ],
                    ),
                    Text(review.translation),
                    RaisedButton(
                      onPressed: () => {
                        deck.changeConfidences(
                            words: depressedSublist, confidence: -0.25),
                        agenda.removeReviewable(
                            lessonIndex: widget.lessonIndex,
                            cardIndex: widget.cardIndex)
                      },
                      child: Text('continue'),
                    ),
                  ],
                );
              },
            ),
    );
  }
}
