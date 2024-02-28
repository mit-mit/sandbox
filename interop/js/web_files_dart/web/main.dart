import 'package:web/web.dart';
import 'dart:js_interop';
import 'dart:convert';

main() {
  document.getElementById('import')!.onClick.listen((_) {
    final input = document.getElementById('selectFiles') as HTMLInputElement;
    if (input.files == null || input.files!.length <= 0) return;

    final reader = FileReader();
    reader.onload = (JSAny e) {
      final jsonString = measure(
        () => (reader.result as JSString).toDart,
        'convert JSString to Dart',
      );
      final json = measure(
        () => jsonDecode(jsonString),
        'decode json',
      );
      log('read json array with length ${json.length}');
      final jsonString2 = measure(
        () => jsonEncode(jsonString),
        'encode json',
      );
      log('created json string with length ${jsonString2.length}');
    }.toJS;
    reader.readAsText(input.files!.item(0)!);
  });
}

void log(String content) {
  final result = document.getElementById('result') as HTMLTextAreaElement;
  result.textContent = '${result.textContent ?? ''}\n$content';
}

R measure<R>(R Function() f, String what) {
  final sw = Stopwatch()..start();
  final result = f();
  final duration = sw.elapsedMilliseconds;
  log("$what in $duration ms");
  return result;
}
