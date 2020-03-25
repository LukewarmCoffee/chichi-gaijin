import 'package:chichi_gaijin_two/data/cards.dart';
import 'package:chichi_gaijin_two/data/lessons.dart';
import 'package:chichi_gaijin_two/models/models.dart';
import 'package:chichi_gaijin_two/providers/providers.dart';
import 'package:chichi_gaijin_two/services/services.dart';
import 'package:chichi_gaijin_two/widgets/content_card_widgets/content_card_widgets.dart';
import 'package:chichi_gaijin_two/widgets/content_card_widgets/english_sentence_review_view.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

class LessonPage extends StatelessWidget {
  static const route = '/lesson';
  final int lessonIndex;

  const LessonPage({
    @required this.lessonIndex,
  });
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
          final card = cards[cardIndex];
          if (cards[cardIndex] is TitleCard)
            return TitleCardView(card);
          else if (cards[cardIndex] is BodyCard)
            return BodyCardView(card);
          else if (cards[cardIndex] is VocabCard &&
              !(cards[cardIndex] as VocabCard).hidden)
            return VocabCardView(card);
          else if (cards[cardIndex] is ReviewCard &&
              !(cards[cardIndex] as ReviewCard).hidden)
            return ReviewView(card);
          else if (cards[cardIndex] is SentenceReviewCard &&
              !(cards[cardIndex] as SentenceReviewCard).hidden)
            return Text((cards[cardIndex] as SentenceReviewCard).words.isEmpty
                ? 'empty'
                : (cards[cardIndex] as SentenceReviewCard).words[0].japanese);
          else
            return Text(
                (cards[cardIndex] as SentenceReviewCard).words[0].romaji);

          /*EnglishSentenceReviewView(
                    lessonIndex: lessonIndex,
                    cardIndex: cardIndex,
                  ),*/
        },

        /*MultiProvider(
        providers: [
          /*ProxyProvider3<Agenda, HiddenLessons, Deck, FinishLesson>(
            update: (_, agenda, hiddenLessons, deck, __) => FinishLesson(
              agenda,
              deck,
              hiddenLessons,
            ),
          ),*/
        ],
        child: 
        ),*/

        /*PageView(
          children: <Widget>[
            for (int cardIndex = 0; cardIndex < cards.length; cardIndex++)
              if (cards.length != cardIndex)
                if (cards[cardIndex] is TitleCard)
                  Text((cards[cardIndex] as TitleCard).title)
                  /*TitleCardView(
                    cardIndex: cardIndex,
                    lessonIndex: lessonIndex,
                  )*/
                else if (cards[cardIndex] is BodyCard)
                  Text((cards[cardIndex] as BodyCard).body)
                  /*BodyCardView(
                    cardIndex: cardIndex,
                    lessonIndex: lessonIndex,
                  )*/
                else if (cards[cardIndex] is VocabCard &&
                    !(cards[cardIndex] as VocabCard).hidden)
                                      Text('sss')//(cards[cardIndex] as VocabCard).word[0].romaji)

                  /*VocabCardView(
                    lessonIndex: lessonIndex,
                    cardIndex: cardIndex,
                  )*/
                else if (cards[cardIndex] is ReviewCard && !(cards[cardIndex] as ReviewCard).hidden)
                                                      Text('ddd')//(cards[cardIndex] as ReviewCard).word[0].romaji)

                  /*EnglishReviewView(
                    lessonIndex: lessonIndex,
                    cardIndex: cardIndex,
                  )*/
                else if (cards[cardIndex] is SentenceReviewCard &&
                    !(cards[cardIndex] as SentenceReviewCard).hidden)
                                                          Text('cc')//(cards[cardIndex] as SentenceReviewCard).words[0].romaji)

                  /*EnglishSentenceReviewView(
                    lessonIndex: lessonIndex,
                    cardIndex: cardIndex,
                  ),*/
            //EndCard(lessonIndex: lessonIndex),
          ],
        ),*/
      ),
    );
  }
}
