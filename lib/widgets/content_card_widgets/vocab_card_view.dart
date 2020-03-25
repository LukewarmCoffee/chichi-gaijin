import 'package:chichi_gaijin_two/models/content_card.dart';
import 'package:chichi_gaijin_two/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VocabCardView extends StatelessWidget {
  final VocabCard card;

  const VocabCardView(this.card);

  @override
  Widget build(BuildContext context) {
    return card.word.isNotEmpty
        ? Column(
            children: <Widget>[
              Text(card.word[0].japanese),
              Text(card.word[0].kana),
              Text(card.word[0].romaji),
              Text(card.word[0].english),
              Text(card.word[0].definition),
              Text(card.word[0].confidence.toString()),
              Text(card.word[0].learned.toString()),
            ],
          )
        : Text('empty vocab card');
  }
}
