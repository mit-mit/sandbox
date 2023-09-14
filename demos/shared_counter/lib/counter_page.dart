import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key, required this.title});

  final String title;

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;
  final db = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    _initFirebase();
  }

  Future<void> _initFirebase() async {
    final fireDoc = db.collection('demo').doc('demo');
    fireDoc.snapshots().listen((event) {
      if (event.exists) {
        setState(() => _counter = event.data()!['counter']);
      }
    });
  }

  void _incrementCounter() {
    setState(() => updateCounter(++_counter));
  }

  void _decrementCounter() {
    setState(() => updateCounter(--_counter));
  }

  void updateCounter(int count) {
    db.runTransaction((transaction) {
      final fireDoc = db.collection('demo').doc('demo');
      return transaction.get(fireDoc).then((doc) {
        if (doc.exists) {
          transaction.update(fireDoc, {'counter': count});
        } else {
          transaction.set(fireDoc, {'counter': 0});
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          MenuItemButton(
            onPressed: () => updateCounter(0),
            child: const Icon(Icons.restart_alt),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Current count:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton.small(
            onPressed: _counter == 0 ? null : _decrementCounter,
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 16),
          FloatingActionButton.small(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
