import 'package:chichi_gaijin_two/models/content_cards.dart';
import 'package:chichi_gaijin_two/providers/main/agenda.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VocabCardView extends StatelessWidget {
  final int lessonIndex;
  final int cardIndex;

  const VocabCardView({
    @required this.cardIndex,
    @required this.lessonIndex,
  });

  @override
  Widget build(BuildContext context) {
    final agenda = Provider.of<Agenda>(context);
    final VocabCard card = agenda.lessons[lessonIndex].cards[cardIndex];
    final word = card.word;
    return Column(
      children: <Widget>[
        Text(word.japanese),
        Text(word.kana),
        Text(word.romaji),
        Text(word.english),
        Text(word.definition),
        Text(word.confidence.toString()),
        Text(word.learned.toString()),
      ],
    );
  }
}
