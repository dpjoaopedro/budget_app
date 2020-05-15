import 'package:flutter/material.dart';
import 'components/budgetCard.dart';
import 'models/budget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Budget App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Orçamentos'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _orcamentos = [
    Budget(id: '1', nome: 'Obra Danilo', data: DateTime.now(), preco: 1565.00),
    Budget(
        id: '2', nome: 'Obra Vanderlei', data: DateTime.now(), preco: 1565.00),
  ];

  void newBudget() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FirstPage()),
    );
  }

  void editBudget(Budget budget) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FirstPage(budget: budget)),
    );
  }

  void deleteBudget(String id) {
    setState(() {
      _orcamentos.removeWhere((budget) => budget.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
      ),
      body: ListView(
          children: _orcamentos.map(
        (budget) {
          return BudgetCard(
            budget: budget,
            onEditBudget: editBudget,
            onDeleteBudget: deleteBudget,
          );
        },
      ).toList()),
      drawer: Drawer(
        child: Container(
          color: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/logo.jpg"),
                        fit: BoxFit.scaleDown)),
                child: null,
              ),
              ListTile(
                title: Text('Orçamentos'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Calculos'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: newBudget,
        tooltip: 'Novo orçamento',
        child: Icon(Icons.add),
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  final Budget budget;

  FirstPage({this.budget});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: budget != null
            ? Text('Editando o orçamento')
            : Text('Novo orçamento'),
      ),
    );
  }
}
