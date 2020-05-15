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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    budget.nome,
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    DateFormat('d MMM y').format(budget.data),
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
              Row(
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
            ],
          ),
        ),
      ),
    );
  }
}
