import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class tab3 extends StatefulWidget {
  const tab3({Key? key}) : super(key: key);

  @override
  State<tab3> createState() => _tab3State();
}

class _tab3State extends State<tab3> {
  int counter3 = 0;

  void _incrementCounter() {
    setState(() {
      counter3++;
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
              'Tab 3',
            ),
            Text(
              '$counter3',
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
