import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage>
    with SingleTickerProviderStateMixin {
  var counter = 0;
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
        setState(() => counter = event.data()!['counter']);
      }
    });
  }

  void _incrementCounter() => updateCounter(counter + 1);
  void _decrementCounter() => updateCounter(counter - 1);
  void _resetCounter() => updateCounter(0);

  void updateCounter(int count) {
    db.runTransaction((transaction) {
      final fireDoc = db.collection('demo').doc('demo');
      return transaction.get(fireDoc).then((doc) {
        transaction.update(fireDoc, {'counter': count});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: colors.inversePrimary,
            title: const Text('Flutter Counter'),
            actions: null,
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: SizedBox.expand(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: CounterWidget(counter: counter),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton.small(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 10),
          FloatingActionButton.small(
            onPressed: counter == 0 ? null : _decrementCounter,
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

class CounterWidget extends StatelessWidget {
  const CounterWidget({
    super.key,
    required this.counter,
  });

  final int counter;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final numberDescriptionStyle = textTheme.bodyLarge!.copyWith(
      fontWeight: FontWeight.bold,
    );
    final numberStyle = textTheme.displaySmall?.copyWith(
      fontWeight: FontWeight.bold,
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          'Distributed Counter:',
          style: numberDescriptionStyle,
        ),
        Text(
          '$counter',
          style: numberStyle,
        ),
      ],
    );
  }
}
