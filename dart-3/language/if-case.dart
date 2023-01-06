// Experimental feature. Run with:
// dart run --enable-experiment=records,patterns if-case.dart

import 'dart:convert';

const jsonString = '''
  ["year", 1942, "count", 56]
''';

main() {
  final json = jsonDecode(jsonString);

  if (json case [String _, int year, String _, int count]) {
    print('Parsed year $year and count $count.');
  } else if (json case [String _, int year, String _, int count, ...rest]) {
    print('Parsed year $year and count $count plus: $rest.');
  } else {
    print('Failed to parse $jsonString.');
  }
}