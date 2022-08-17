import 'dart:ffi';
import 'foundation_bindings.dart';

void main(List<String> args) async {
  const dylibPath =
      '/System/Library/Frameworks/Foundation.framework/Versions/Current/Foundation';
  final lib = TimeZone(DynamicLibrary.open(dylibPath));

  var timeZone = NSTimeZone.getLocalTimeZone(lib);
  if (timeZone != null) {
    print('\nTimezone name: ${timeZone.name}');
    print('Offset from GMT: ${timeZone.secondsFromGMT / 60 / 60} hours');
  }

  timeZone = NSTimeZone.timeZoneForSecondsFromGMT_(lib, 0);
  print('\nTimezone name: ${timeZone.name}');
  print('Offset from GMT: ${timeZone.secondsFromGMT / 60 / 60} hours');
}
