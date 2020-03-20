//routes
import 'package:chichi_gaijin_two/pages/home.dart';

//external imports
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import 'data/data.dart';
import 'models/models.dart';


void main() {
  Hive.registerAdapter(WordAdapter());

  Hive.registerAdapter(LessonAdapter());

  Hive.registerAdapter(LessonTypesAdapter());
  //content cards
  Hive.registerAdapter(TitleCardAdapter());
  Hive.registerAdapter(BodyCardAdapter());
  Hive.registerAdapter(ReviewCardAdapter());
  Hive.registerAdapter(SentenceReviewCardAdapter());

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
        ChangeNotifierProvider<Words>(
          create: (_) => Words(),
        ),
        ChangeNotifierProxyProvider<Words, Cards>(
          create: (_) => Cards(),
          update: (_, words, cards) {
            words.hiveList.then((hiveList) => cards.words = hiveList);
            return cards;
          },
        ),
        ChangeNotifierProxyProvider<Cards, Lessons>(
          create: (_) => Lessons(),
          update: (_, cards, lessons) {
            cards.hiveList.then((hiveList) => lessons.cards = hiveList);
            return lessons;
          },
        ),
        /*ChangeNotifierProvider<Deck>(
          create: (_) => Deck(),
        ),*/
        /*ChangeNotifierProvider<HiddenLessons>(
          create: (_) => HiddenLessons(),
        ),
        ProxyProvider2<Deck, Lessons, Agenda>(
          update: (_, deck, lessons, __) => Agenda(
            deck,
            lessons,
          ),
        ),*/
      ],
      child: MaterialApp(
        title: 'ChiChi Gaijin',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: (RouteSettings settings) {
          /*if (settings.name == LessonPage.route)
            return MaterialPageRoute(
              builder: (_) {
                return LessonPage(
                  lessonIndex: settings.arguments,
                );
              },
            );*/
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
