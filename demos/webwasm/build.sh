#!/bin/sh -x

echo "Running with dart command in: $1"

rm -rf build
mkdir build

$1 compile wasm web/main.dart

cp web/main.* build
cp web/index.html build
cp web/styles.css build
cp web/favicon.ico build
