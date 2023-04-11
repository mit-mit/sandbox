import 'dart:js_interop';

/// Returns a reference to the Window object.
@JS()
external Window get window;

/// Represents a window containing a DOM document.
@JS()
inline class Window {
  // ignore: unused_field
  final JSObject _obj;
  Window(this._obj);

  /// Returns a reference to the Navigator object.
  @JS()
  external Navigator get navigator;
}

/// Represents the state and the identity of the user agent.
@JS()
inline class Navigator {
  // ignore: unused_field
  final JSObject _obj;
  Navigator(this._obj);

  /// Returns true meaning online or false meaning offline.
  external JSBoolean get onLine;

  /// Returns the approximate amount of device memory in gigabytes.
  external JSNumber get deviceMemory;
}
