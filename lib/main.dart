import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plurals Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Plurals Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int qty = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(showCartMessage(qty)),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {
              qty++;
              setState(() {});
            },
            child: Icon(Icons.add),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              onPressed: () {
                qty--;
                if (qty < 0) qty = 0;

                setState(() {});
              },
              child: Icon(Icons.remove),
            ),
          ),
        ],
      ),
    );
  }

  String showCartMessage(int quantity) {
    return Intl.plural(
      quantity,
      zero: 'EMPTY CART',
      one: '$quantity ITEM',
      other: '$quantity ITEMS',
      name: "ITEM",
      args: [quantity],
      examples: const {'quantity': 4},
      desc: "Food quantity to order from cart",
    );
  }
}
