import 'dart:ffi';
import 'foundation_bindings.dart';

void main(List<String> args) async {
  const dylibPath =
      '/System/Library/Frameworks/Foundation.framework/Versions/Current/Foundation';
  final lib = TimeZone(DynamicLibrary.open(dylibPath));

  var timeZone = NSTimeZone.getLocalTimeZone(lib);
  if (timeZone != null) {
    print('Timezone name: ${timeZone.name}');
    // print('Timezone offset: ${timeZone.secondsFromGMT} hours');
  }

  timeZone = NSTimeZone.timeZoneForSecondsFromGMT_(lib, 0);
  print('Timezone name: ${timeZone.name}');
}
