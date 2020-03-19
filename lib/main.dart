//routes
import 'package:chichi_gaijin_two/models/content_card.dart';
import 'package:chichi_gaijin_two/models/pontent.dart';
import 'package:chichi_gaijin_two/pages/home.dart';
import 'package:chichi_gaijin_two/pages/lesson_page.dart';
import 'package:chichi_gaijin_two/providers/cards.dart';
import 'package:chichi_gaijin_two/providers/lessons.dart';
import 'package:chichi_gaijin_two/providers/words.dart';
//providers

//external imports
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import 'models/word.dart';
import 'providers/deck.dart';
import 'providers/providers.dart';

void main() {
  Hive.registerAdapter(WordAdapter());
  Hive.registerAdapter(PontenterAdapter());
  Hive.registerAdapter(PontentedAdapter());
  Hive.registerAdapter(ContentCardAdapter());
  Hive.registerAdapter(TitleCardsAdapter());

  runApp(MyApp());
}

Future _initHive() async {
  var dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Deck>(
          create: (_) => Deck(),
        ),
        ChangeNotifierProvider<Words>(
          create: (_) => Words(),
        ),
        ChangeNotifierProxyProvider<Words, Cards>(
          create: (_) => Cards(),
          update: (_, words, cards){
            words.list.then((list) => cards.words = list);
            return cards;
          },
        ),
        ChangeNotifierProvider<Lessons>(
          create: (_) => Lessons(),
        ),
        ChangeNotifierProvider<HiddenLessons>(
          create: (_) => HiddenLessons(),
        ),
        ProxyProvider2<Deck, Lessons, Agenda>(
          update: (_, deck, lessons, __) => Agenda(
            deck,
            lessons,
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
          '/': (context) => FutureBuilder(
                future: _initHive(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.error != null) {
                      print(snapshot.error);
                      return (Scaffold(
                        body: Center(
                          child: Text('hive data store error'),
                        ),
                      ));
                    } else {
                      return Home();
                    }
                  } else {
                    return Scaffold();
                  }
                },
              ),
        },
      ),
    );
  }
}
