//routes
import 'package:chichi_gaijin_two/pages/home.dart';
import 'package:chichi_gaijin_two/pages/lesson_page.dart';
import 'package:chichi_gaijin_two/providers/lessons.dart';
//providers

//external imports
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/deck.dart';
import 'providers/providers.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Deck>(
          create: (_) => Deck(),
        ),
        ChangeNotifierProvider<Lessons>(
          create: (_) => Lessons(),
        ),
        //TODO: whats the difference between this and proxy
        ChangeNotifierProvider<HiddenLessons>(
          create: (_) => HiddenLessons(deck: Deck().deck),
        ),
        ProxyProvider3<Deck, Lessons, HiddenLessons, Agenda>(
          //create: (deck) => Agenda(deck: deck), //unsure if best way to do
          update: (_, deck, lessons, hiddenLessons, __) => Agenda(
            deck,
            lessons,
            hiddenLessons,
          ),
        ),
      ],
      child: MaterialApp(
        title: 'ChiChi Gaijin',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: (RouteSettings settings) {
          if (settings.name == LessonPage.route)
            return MaterialPageRoute(
              builder: (_) {
                return LessonPage(
                  lessonIndex: settings.arguments,
                );
              },
            );
          return MaterialPageRoute(
            builder: (_) {
              return Home();
            },
          );
        },
        routes: {
          '/': (_) => Home(),
        },
      ),
    );
  }
}
