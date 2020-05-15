import 'package:flutter/foundation.dart';

class Budget {
  String id;
  String nome;
  DateTime data;
  double preco;

  Budget({
    @required this.id,
    @required this.nome,
    @required this.data,
    @required this.preco
  });

}