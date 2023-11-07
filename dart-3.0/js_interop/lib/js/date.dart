import 'dart:js_interop';

@JS()
external Date get date;

@JS()
inline class Date {
  final JSObject _obj;
  // external Date();

  @JS()
  external Date(JSString date);

  @JS('Date()')
  external Date.current();

  @JS()
  external static JSNumber now();

  String asString() => toPrimitive.toString();

  @JS('toPrimitive()')
  external JSString toPrimitive;

  @JS()
  external JSNumber getTime();
  @JS()
  external JSNumber getMinutes();
  @JS()
  external JSNumber getHours();
  @JS()
  external JSNumber getDay();
  @JS()
  external JSNumber getMonth();
  @JS()
  external JSNumber getFullYear();
  @JS()
  external JSNumber getTimezoneOffset();
}
