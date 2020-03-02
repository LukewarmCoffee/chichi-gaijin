//routes
import 'package:chichi_gaijin_two/pages/home.dart';
import 'package:chichi_gaijin_two/pages/lesson_page.dart';
//providers
import 'package:chichi_gaijin_two/providers/main/agenda.dart';
import 'package:chichi_gaijin_two/providers/main/deck.dart';
import 'package:chichi_gaijin_two/providers/main/hidden_lessons.dart';
//external imports
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Agenda>(create: (_) => Agenda()),
        ChangeNotifierProvider<Deck>(
          create: (_) => Deck(),
        ),
        ChangeNotifierProvider<HiddenLessons>(
          create: (_) => HiddenLessons(),
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
