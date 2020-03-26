import 'package:chichi_gaijin_two/services/depressable_sentence.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chichi_gaijin_two/models/content_card.dart';

//updates values in deck
class SentenceReviewView extends StatefulWidget {
  final SentenceReviewCard card;

  const SentenceReviewView(this.card);

  @override
  _SentenceReviewViewState createState() =>
      _SentenceReviewViewState();
}

class _SentenceReviewViewState extends State<SentenceReviewView> {
  bool showAnswer = true;

  checkAnswer() {
    setState(() {
      showAnswer = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }
}
