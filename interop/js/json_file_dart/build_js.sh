#!/bin/sh -x

./clean.sh
dart pub get
dart pub global run webdev build --release
