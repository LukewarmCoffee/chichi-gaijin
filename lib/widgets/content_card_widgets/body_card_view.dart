import 'package:chichi_gaijin_two/providers/agenda.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chichi_gaijin_two/models/content_cards.dart';


class BodyCardView extends StatelessWidget {
  final int lessonIndex;
  final int cardIndex;

  const BodyCardView({
    @required this.lessonIndex,
    @required this.cardIndex,
  });

  @override
  Widget build(BuildContext context) {
    final agenda = Provider.of<Agenda>(context);
    final BodyCard card = agenda.lessons[lessonIndex].cards[cardIndex];
    return Center(
      child: Text(card.body),
    );
  }
}