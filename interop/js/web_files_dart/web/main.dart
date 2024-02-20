import 'package:web/web.dart';
import 'dart:js_interop';
import 'dart:convert';

main() {
  document.getElementById('import')!.onClick.listen((_) {
    final element = document.getElementById('selectedFiles');
    final files = (element as HTMLInputElement)
        .files!; // Note: no dynamic access, extra casts needed
    console.log(files);
    if (files.length <= 0) return;
    final reader = FileReader();
    reader.onload = (e) {
      // Note: onLoad stream helper missing, but callback style works.
      final result = json.decode((reader.result as JSString)
          .toDart); // Note: extra conversion needed on types are are often polymorphic (like result). We can always add helpers as needed
      final formatted = JsonEncoder.withIndent("  ").convert(result);
      final area = document.getElementById('result')
          as HTMLTextAreaElement; // Note: cast needed
      area.value = formatted;
    }.toJS;
    reader.readAsText(files.item(0)!);
  });
}
