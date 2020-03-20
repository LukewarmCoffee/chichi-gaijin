import 'package:chichi_gaijin_two/providers/providers.dart';
import 'package:chichi_gaijin_two/services/services.dart';
import 'package:chichi_gaijin_two/widgets/content_card_widgets/content_card_widgets.dart';
import 'package:chichi_gaijin_two/widgets/content_card_widgets/english_sentence_review_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/*class LessonPage extends StatelessWidget {
  static const route = '/lesson';
  final int lessonIndex;

  const LessonPage({
    @required this.lessonIndex,
  });
  @override
  Widget build(BuildContext context) {
    final agenda = Provider.of<Agenda>(context);
    final lesson = agenda.lessons[lessonIndex];
    final cards = lesson.cards;
    return Scaffold(
      appBar: AppBar(
        title: Text(lesson.title),
      ),
      body: MultiProvider(
        providers: [
          ProxyProvider3<Agenda, HiddenLessons, Deck, FinishLesson>(
            update: (_, agenda, hiddenLessons, deck, __) => FinishLesson(
              agenda,
              deck,
              hiddenLessons,
            ),
          ),
        ],
        child: PageView(
          children: <Widget>[
            for (int cardIndex = 0; cardIndex < cards.length; cardIndex++)
              if (cards.length != cardIndex)
                if (cards[cardIndex] is TitleCard)
                  TitleCardView(
                    cardIndex: cardIndex,
                    lessonIndex: lessonIndex,
                  )
                else if (cards[cardIndex] is BodyCard)
                  BodyCardView(
                    cardIndex: cardIndex,
                    lessonIndex: lessonIndex,
                  )
                else if (cards[cardIndex] is VocabCard &&
                    !(cards[cardIndex] as VocabCard).hidden)
                  VocabCardView(
                    lessonIndex: lessonIndex,
                    cardIndex: cardIndex,
                  )
                else if (cards[cardIndex] is EnglishReview)
                  EnglishReviewView(
                    lessonIndex: lessonIndex,
                    cardIndex: cardIndex,
                  )
                else if (cards[cardIndex] is EnglishSentenceReview &&
                    !(cards[cardIndex] as EnglishSentenceReview).hidden)
                  EnglishSentenceReviewView(
                    lessonIndex: lessonIndex,
                    cardIndex: cardIndex,
                  ),
            EndCard(lessonIndex: lessonIndex),
          ],
        ),
      ),
    );
  }
}*/
