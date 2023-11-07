// Demonstrates the Dart 3 support for patterns
// in if-statements.

import 'dart:convert';

const jsonString = '''
  ["year", 1942, "count", 56, "data1", 42, "data2"]
''';

main() {
  final json = jsonDecode(jsonString);

  if (json case ["year", int year, "count", int count, ...var rest]) {
    print('Parsed year $year and count $count plus: $rest.');
  } else {
    print('Failed to parse $jsonString.');
  }
}
