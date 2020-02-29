import 'package:flutter/foundation.dart';
//Contains all the types of cards a user might see
//The meat and potatoes of this app
abstract class ContentCards {}
//Displays a centered title with an optional subtitle
class TitleCard implements ContentCards {
  final String title;
  final String subtitle;

  const TitleCard({
    @required this.title,
    this.subtitle,
  });
}
