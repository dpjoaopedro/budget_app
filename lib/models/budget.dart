import 'package:flutter/foundation.dart';

class Budget {
  String id;
  String title;
  DateTime data;
  double price;

  Budget({
    @required this.id,
    @required this.title,
    @required this.data,
    @required this.price
  });

}