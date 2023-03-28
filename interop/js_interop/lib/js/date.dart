import 'dart:js_interop';

/// Wraps the JavaScript Date, which represents a single moment in time in a
/// platform-independent format.
@JS()
inline class Date {
  // ignore: unused_field
  final JSObject _obj;

  /// Creates a new Date by parsing the value in [date].
  /// Prefer passing a value in the ISO 8601 format.
  @JS()
  external Date(JSString date);

  /// Creates a new Date with the current date and time.
  @JS('Date()')
  external Date.current();

  /// Returns the number of milliseconds elapsed since the epoch;
  /// midnight at the beginning of January 1, 1970, UTC.
  @JS()
  external static JSNumber now();

  /// Returns a string with a language-sensitive representation of the date.
  @JS()
  external JSString toLocaleString(JSString locale);

  /// Returns a string with a language-sensitive representation of the date
  /// portion of the date.
  @JS()
  external JSString toLocaleDateString(JSString locale);

  /// Returns a string with a language-sensitive representation of the time
  /// portion of the date.
  @JS()
  external JSString toLocaleTimeString(JSString locale);
}
