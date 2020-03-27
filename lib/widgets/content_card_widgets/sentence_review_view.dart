import 'package:flutter/material.dart';
import 'package:chichi_gaijin_two/models/content_card.dart';

//updates values in deck
class SentenceReviewView extends StatefulWidget {
  final SentenceReviewCard card;

  const SentenceReviewView(this.card);

  @override
  _SentenceReviewViewState createState() => _SentenceReviewViewState();
}

class _SentenceReviewViewState extends State<SentenceReviewView> {
  bool showAnswer = false;

  checkAnswer() {
    setState(() {
      showAnswer = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('What does this sentence mean, in english?'),
        Wrap(
          children: <Widget>[
            for (int i = 0; i < widget.card.words.length; i++)
              Text(widget.card.words[i].japanese)
          ],
        ),
        showAnswer
            ? Column(
                children: <Widget>[
                  Wrap(
                    children: <Widget>[
                      for (int i = 0; i < widget.card.words.length; i++)
                        Text(widget.card.words[i].english)
                    ],
                  ),
                  Text(widget.card.translation.isEmpty
                      ? ''
                      : widget.card.translation),
                ],
              )
            : RaisedButton(
                onPressed: () => checkAnswer(),
                child: Text('CheckAnswer'),
              ),
      ],
    );
  }
}
