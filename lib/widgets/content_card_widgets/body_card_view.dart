import 'package:chichi_gaijin_two/models/content_card.dart';
import 'package:flutter/material.dart';

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
