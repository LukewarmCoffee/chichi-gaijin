import 'package:flutter/material.dart';

import '../../models/content_card.dart';

class BodyCardView extends StatelessWidget {
  final BodyCard card;

  const BodyCardView(this.card);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(card.body),
    );
  }
}
