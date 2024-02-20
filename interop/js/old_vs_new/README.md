# Nextgen js interop support for Dart
 
This is a small example of the next-gen version of JS interop for Dart.

Unlike current interop which is very dynamic, this next version offers strong,
statically typed APIs. This enables better code completions and catches
potential issues during development.

In this example, we're working with a few APIs on the js `navigator` object.

The next-gen version is built on top of the new 
[Dart web APIs in `package:web`](https://dart.dev/interop/js-interop/package-web).
Behind the scenes this relies on the new Dart language feature 
['extension types'](https://dart.dev/language/extension-types). 
This enables creating strongly typed wrappers around existing types -- in this
case the JSObject type -- without the runtime overhead of a traditional class.

## Code comparison

Here's some classic `dart:js` code for using the navigator object to get the online status and device memory properties of the agent:

```dart
final window = dart_js.JsObject.fromBrowserObject(dart_js.context['window']);
final navigator = window['navigator'];
final onlineStatus = navigator['onLine'];
final agent = navigator['userAgent'];
```

This code is untyped and relies on property lookups in maps and method calls
by-name. Calling APIs with the wrong names (note e.g. the odd spelling of
`onLine` in the API) lead to run-time crashes, and there are no code completions
when using the APIs.

With the new JS interop style the inline classes define strongly typed APIs.
That leads to this strongly typed client code:

```dart
final navigator = web.window.navigator;
final onlineStatus = navigator.onLine;
final agent = navigator.userAgent;
```

## Running the example

The example is a Flutter web app, so simply run the command:
```console
flutter run -d chrome
```
