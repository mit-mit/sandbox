# Nextgen js interop support for Dart
 
This is a small example of the **experimental** next-gen major version of JS
interop for Dart.

Unlike current interop which is very dynamic, this next version offers strong,
statically typed APIs. This enables better code completions and catches
potential issues during development.

In this example, we're wrapping the JS Date class in `lib/js/date.dart`.

The new support is built on top of the Dart language feature 
['inline classes'](https://github.com/dart-lang/language/issues/2727). This is
an experimental language feature, which enables creating strongly typed wrappers
around existing types -- in this case the JSObject type -- withput the runtime
overhead of a traditional class.

## Running the example

The example is a Flutter web app. Running it requires passing a a Dart
experiment flag to enable the experimental Inline Classes feature.

1. Make sure you have flutter.dev installed

2. In a terminal, cd to the root of this example

3. Run the commadn `flutter run --enable-experiment=inline-class`