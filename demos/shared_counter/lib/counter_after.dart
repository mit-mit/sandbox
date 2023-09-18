import 'dart:math';
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

  (Offset offset, double size, double speed) calculateLocation(
      Offset maxSize, int index) {
    final random = Random(index);
    final size = max(30.0, 90.0 * random.nextDouble());
    final speed = random.nextDouble();
    final offset = Offset(random.nextDouble(), random.nextDouble());
    final normalizedOffset = offset.scale(maxSize.dx - size, maxSize.dy - size);
    return (normalizedOffset, size, speed);
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final gridColor = colors.outline.withOpacity(0.50);

    final size = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;
    final maxSize = (size - padding.collapsedSize) as Offset;

    final logos = List<Widget>.generate(counter, (index) {
      final (offset, radius, speed) = calculateLocation(maxSize, index);
      return AnimatedPositioned.fromRect(
        duration: kThemeAnimationDuration,
        rect: offset & Size.square(radius),
        child: LogoWidget(speed: speed),
      );
    });

    final resetButton = IconButton(
      tooltip: 'Reset Counter',
      icon: const Icon(Icons.restore),
      onPressed: () => showDialog(
        context: context,
        builder: (context) => AlertDialog.adaptive(
          title: const Text('Reset Counter'),
          content: const Text('Are you sure?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _resetCounter();
              },
              child: const Text('Reset'),
            ),
          ],
        ),
      ),
    );

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            backgroundColor: colors.inversePrimary,
            title: const Text('Flutter Counter'),
            actions: [resetButton],
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: SizedBox.expand(
              child: Stack(
                children: [
                  Positioned.fill(child: GridPaper(color: gridColor)),
                  ...logos,
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
    final shadow = Shadow(
      blurRadius: 0.1,
      color: Theme.of(context).colorScheme.surface,
      offset: const Offset(1.0, 1.0),
    );
    final numberDescriptionStyle = textTheme.headlineMedium!.copyWith(
      shadows: [shadow],
    );
    final numberStyle = textTheme.displaySmall?.copyWith(
      fontWeight: FontWeight.bold,
      fontSize: 96,
      shadows: [shadow],
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

class LogoWidget extends StatefulWidget {
  const LogoWidget({super.key, required this.speed});

  final double speed;

  @override
  State<LogoWidget> createState() => _LogoWidgetState();
}

class _LogoWidgetState extends State<LogoWidget> {
  double turns = Random().nextDouble();
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(
      Duration(milliseconds: max(300, 500 * widget.speed).round()),
      (_) => _changeRotation(),
    );
  }

  void _changeRotation() {
    setState(() => turns += 1.0 / 8.0);
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedRotation(
      turns: turns,
      duration: const Duration(seconds: 1),
      child: const FlutterLogo(),
    );
  }
}
