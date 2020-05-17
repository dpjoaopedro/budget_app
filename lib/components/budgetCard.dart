import 'package:budgetcreator/models/budget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BudgetCard extends StatelessWidget {
  final Budget budget;
  final void Function(Budget budget) onEditBudget;
  final void Function(String id) onDeleteBudget;

  BudgetCard({
    @required this.budget,
    @required this.onEditBudget,
    @required this.onDeleteBudget,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(5),
      child: Container(
        height: 55,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 80,
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          'R\$ ' + budget.price.toStringAsFixed(2),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Flexible( //Problema - Vc está dando elipsis num width não especificado, logo ele não sabe dar elipsis. Vc pode estar confuso porque vê o resultado na tela já pronto, mas no momento em que o cálculo do width é feito, nessa linha aqui ele ainda não sabe, porque o width é especificado pelos filhos, então a largura total desse container só será conhecida depois dos filhos renderizados. Aí que está o problema.
                          child: Container( //Encapsulei com container para conseguir especificar um width
                            width: 180.0, // ajusta para quanto vc quiser
                            child: Text(
                              budget.title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                        Text(
                          DateFormat('d MMMM y', 'pt-br').format(budget.data),
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    IconButton(
                      onPressed: () => onEditBudget(budget),
                      icon: Icon(
                        Icons.edit,
                        color: Colors.black,
                        size: 24.0,
                        semanticLabel: 'Edit',
                      ),
                    ),
                    IconButton(
                      onPressed: () => onDeleteBudget(budget.id),
                      icon: Icon(
                        Icons.delete,
                        color: Colors.black,
                        size: 24.0,
                        semanticLabel: 'Edit',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
