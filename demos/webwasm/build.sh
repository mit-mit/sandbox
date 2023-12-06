#!/bin/sh -x

rm -rf build
mkdir build

dart pub get
dart compile wasm web/main.dart

cp web/main.* build
cp web/index.html build
cp web/styles.css build
cp web/favicon.ico build
