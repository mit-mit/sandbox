A Dart app which:
- enables null safety in the pubspec (lower SDK constraint >=2.12)
- has a library that is not null safety (@dart=2.9 marker in lib)

This app relies on unsound null safety, and is incompatible with Dart 3.

It should resolve (pub get), but fail analysis, run, and and build.
