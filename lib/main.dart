import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final dollarTextField = TextEditingController();
  final euroTextField = TextEditingController();

  double _dollars = 0;
  double _euros = 0;
  double _converstionRate = 1.19;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text("CIS 3334 Currency Converter"),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Dollars", style: Theme.of(context).textTheme.headline4),
            TextField(controller: dollarTextField),
            ElevatedButton(
              onPressed: () {
                _dollars = double.parse(dollarTextField.text);
                _euros = _dollars * _converstionRate;
                euroTextField.text = _euros.toStringAsFixed(2);
              },
              child: Text("Convert to Euros")
            ),
            Text("Euros", style: Theme.of(context).textTheme.headline4),
            TextField(controller: euroTextField),
            ElevatedButton(
                onPressed: (){
                  _euros = double.parse(euroTextField.text);
                  _dollars = _euros / _converstionRate;
                  dollarTextField.text = _dollars.toStringAsFixed(2);
                },
                child: Text("Convert to Dollars")
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
