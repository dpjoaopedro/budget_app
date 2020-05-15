import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'components/budgetCard.dart';
import 'models/budget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [Locale('pt')],
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
  final _budgets = [
    Budget(
        id: '1',
        title: 'Reforma Danilo',
        data: DateTime.now(),
        price: 150565.00),
    Budget(
        id: '2',
        title: 'Nome muito grandeeeeeee',
        data: DateTime.now(),
        price: 10365.00),
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
      _budgets.removeWhere((budget) => budget.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
      ),
      body: ListView(
          children: _budgets.map(
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
                title: Text('Cálculos'),
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
