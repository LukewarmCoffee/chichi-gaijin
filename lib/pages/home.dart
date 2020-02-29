import 'package:chichi_gaijin_two/providers/main/agenda.dart';
//external
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//first touch for the user
class Home extends StatelessWidget {
  static const route = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agenda'),
      ),
      body: Consumer<Agenda>(
        builder: (_, agenda, __) {
          final lessons = agenda.lessons;
          //list of currently available lessons
          return ListView.builder(
            itemCount: lessons.length,
            itemBuilder: (BuildContext context, int lessonIndex) {
              //TODO: lesson types
              return Text('heyoo');
            },
          );
        },
      ),
    );
  }
}
