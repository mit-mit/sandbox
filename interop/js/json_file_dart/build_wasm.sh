#!/bin/sh -x

./clean.sh

dart pub get
dart compile wasm web/main.dart

cp web/main-wasm.js     build_wasm/main.dart.js
cp web/main.mjs         build_wasm
cp web/main.wasm        build_wasm
cp web/main.wasm.js     build_wasm/main.js
cp web/index.html       build_wasm
cp web/styles.css       build_wasm
cp web/favicon.ico      build_wasm