import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/services.dart';

class CreatePage extends StatelessWidget {
  static const route = '/create';

  @override
  Widget build(BuildContext context) {
    final createLesson = Provider.of<CreateLesson>(context);
    final cards = createLesson.cards;
    return Scaffold(
      appBar: AppBar(
        title: Text('create'),
      ),
      body: ListView.builder(
        itemCount: cards.length,
        itemBuilder: (BuildContext context, int cardsIndex){
          return Text('hi');
        }),
    );
  }
}
