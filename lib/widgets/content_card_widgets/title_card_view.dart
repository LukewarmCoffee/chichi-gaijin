import 'package:flutter/material.dart';

import '../../models/content_card.dart';

class TitleCardView extends StatelessWidget {
  final TitleCard card;

  const TitleCardView(this.card);

  @override
  Widget build(BuildContext context) {
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
