// Experimental feature. Run with:
// dart run --enable-experiment=inline-class extension-type-simple.dart

extension type Foo(int i) {
  int get doubleUp => 2 * i;
}

void main() {
  final f = Foo(42);

  // Print the object; this prints the representation.
  print(f);

  // Print the representation.
  print(f.i);

  // Call a function.
  print(f.doubleUp);
}
