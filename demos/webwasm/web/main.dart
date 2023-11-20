import 'package:web/helpers.dart';

void main() {
  final now = DateTime.now();
  print('now: ${now.hour}:${now.minute}');

  final element = document.querySelector('#output') as HTMLDivElement;
  element.text = 'The time is ${now.hour}:${now.minute} '
      'and your Dart web app is running using Wasm GC!';
}
