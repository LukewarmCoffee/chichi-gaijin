import 'package:chichi_gaijin_two/models/content_cards.dart';
import 'package:chichi_gaijin_two/providers/main/agenda.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TitleCardView extends StatelessWidget {
  final int lessonIndex;
  final int cardIndex;

  const TitleCardView({
    @required this.lessonIndex,
    @required this.cardIndex,
  });
  @override
  Widget build(BuildContext context) {
    final agenda = Provider.of<Agenda>(context);
    final TitleCard card = agenda.lessons[lessonIndex].cards[cardIndex];
    return card.subtitle == null
        ? Text(card.title)
        : Column(
            children: <Widget>[
              Text(card.title),
              Text(card.subtitle),
            ],
          );
  }
}
