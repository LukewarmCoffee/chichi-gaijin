import 'package:chichi_gaijin_two/data/cards.dart';
import 'package:chichi_gaijin_two/data/lessons.dart';
import 'package:chichi_gaijin_two/models/models.dart';
import 'package:chichi_gaijin_two/providers/providers.dart';
import 'package:chichi_gaijin_two/services/services.dart';
import 'package:chichi_gaijin_two/widgets/content_card_widgets/content_card_widgets.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

class LessonPage extends StatelessWidget {
  static const route = '/lesson';
  final int lessonIndex;

  const LessonPage({
    @required this.lessonIndex,
  });

  Widget displayCard(ContentCard card) {
    if (card is TitleCard)
      return TitleCardView(card);
    else if (card is BodyCard)
      return BodyCardView(card);
    else if (card is VocabCard && !card.hidden)
      return VocabCardView(card);
    else if (card is ReviewCard && !card.hidden)
      return ReviewView(card);
    else if (card is SentenceReviewCard && !card.hidden)
      return SentenceReviewView(card);
    else
      return Text('ayooo');
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Lessons>(context);
    final lesson = provider.lessons[lessonIndex];
    final cards = lesson.cards;
    return Scaffold(
      appBar: AppBar(
        title: Text(lesson.title),
      ),
      body: PageView.builder(
        itemCount: cards.length,
        itemBuilder: (BuildContext context, int cardIndex) {
          return displayCard(cards[cardIndex]);
        },
      ),
    );
  }
}
