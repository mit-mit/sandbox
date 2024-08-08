// ignore_for_file: avoid_print, unused_local_variable

import 'dart:async';
import 'dart:convert';
import 'dart:isolate';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MyHomePage()));
}

String str = _generateString();

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() async {
    final List<Operation> operationAndDuration = [];
    const int frameFrequencyHz = 120;
    const int frameLengthIsMS = 1000 ~/ frameFrequencyHz;

    /// Records every time the periodic timer gets to run.
    /// If the periodic timer skips a run, the tick increments by more than one.
    final List<int> frames = [];
    final Timer timer = Timer.periodic(
        const Duration(milliseconds: frameLengthIsMS),
        (timer) => frames.add(timer.tick));

    Future<T> runAsyncOperation<T>(
        String description, Future<T> Function() operation) async {
      final startTick = timer.tick;
      final s = Stopwatch()..start();
      final value = await operation();
      var frameCount = s.elapsedMilliseconds * frameFrequencyHz ~/ 1000;
      await Future(() {}); // Update ticks.
      var endTick = timer.tick;
      operationAndDuration
          .add(Operation(description, frameCount, Range(startTick, endTick)));
      return value;
    }

    Future<T> runSyncOperation<T>(
        String description, T Function() operation) async {
      final s = Stopwatch()..start();
      final startTick = timer.tick;
      final value = operation();
      var frameCount = s.elapsedMilliseconds * frameFrequencyHz ~/ 1000;
      await Future(() {}); // Update ticks.
      final endTick = timer.tick;
      operationAndDuration
          .add(Operation(description, frameCount, Range(startTick, endTick)));
      return value;
    }

    print("${str.length} bytes, please wait ~10 seconds.");

    await Future(() {});
    final map = await runSyncOperation(
      "Decode",
      () => decode(),
    );

    await Future(() {});
    final map2 = await runAsyncOperation(
      "Decode in Isolate w/ send",
      () => runInIsolate(() => decode()),
    );
    await Future(() {});

    await Future(() {});
    final map3 = await runAsyncOperation(
      "Decode in Isolate w/ exit",
      () => runInIsolate(() => decode(), exit: true),
    );
    await Future(() {});

    timer.cancel();

    var skippedFrames = findSkippedFrames(frames);
    for (var operation in operationAndDuration) {
      print(operation.description);
      print(
          "  * Total time         : ${operation.frames} (${operation.ticks})");
      var totalSkip = 0;
      for (var skip in skippedFrames) {
        if (skip.overlaps(operation.ticks)) {
          skip = skip.intersection(operation.ticks);
          var dif = skip.length;
          if (dif > 0) {
            totalSkip += dif;
            print(
                "       - Skipped frames: $dif (Frame ${skip.start} to ${skip.end})");
          }
        }
      }
      print("  * SkippedFrames total: $totalSkip\n\n");
    }

    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Concurrency')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text('$_counter', style: Theme.of(context).textTheme.headline4),
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

class Operation {
  final String description;
  final int frames;
  final Range ticks;

  const Operation(this.description, this.frames, this.ticks);

  @override
  String toString() =>
      "Operation '$description' took $frames frames at ticks $ticks";
}

List<Range> findSkippedFrames(List<int> frames) => [
      for (var i = 1; i < frames.length; i++)
        if (frames[i] != frames[i - 1] + 1) Range(frames[i - 1], frames[i])
    ];

Map<dynamic, dynamic> decode() {
  final str = _generateString();
  return json.decode(str) as Map<dynamic, dynamic>;
}

String _generateString() {
  final Random rnd = Random();

  final Map<dynamic, dynamic> map = <dynamic, dynamic>{};
  for (int i = 0; i < 500000; i++) {
    map[i.toString()] = [
      rnd.nextInt(1000),
      (int length) {
        final rand = Random();
        final codeUnits = List.generate(length, (index) {
          return rand.nextInt(33) + 89;
        });

        return String.fromCharCodes(codeUnits);
      }(10)
    ];
  }

  return json.encode(map);
}

class Range {
  final int start;
  final int end;
  Range(this.start, this.end) : assert(start <= end);

  bool overlaps(Range other) => start <= other.end && end >= other.start;

  Range intersection(Range other) {
    assert(other.overlaps(this));
    if (start >= other.start && end <= other.end) return this;
    if (other.start >= start && other.end <= end) return other;
    return Range(max(start, other.start), min(end, other.end));
  }

  int get length => end - start;

  @override
  String toString() => "$start-$end";
}

Future<T> runInIsolate<T>(T Function() function, {bool exit = false}) async {
  var port = ReceivePort();
  Isolate.spawn(exit ? _runExit : _run, [function, port.sendPort]);
  return (await port.first) as T;
}

void _run(List<dynamic> parameters) {
  Object? Function() function = parameters[0];
  SendPort port = parameters[1];
  var result = function();
  port.send(result);
}

void _runExit(List<dynamic> parameters) {
  Object? Function() function = parameters[0];
  SendPort port = parameters[1];
  var result = function();
  Isolate.exit(port, result);
}
