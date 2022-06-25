import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class tab2 extends StatefulWidget {
  const tab2({Key? key}) : super(key: key);

  @override
  State<tab2> createState() => _tab2State();
}

class _tab2State extends State<tab2> {
  int counter2 = 0;

  void _incrementCounter() {
    setState(() {
      counter2++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Tab 2',
            ),
            Text(
              '$counter2',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
