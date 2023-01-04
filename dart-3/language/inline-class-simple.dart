// Experimental feature. Run with:
// dart run --enable-experiment=inline-class inline-class-simple.dart

inline class Foo {
  final int i;
  Foo(this.i);
  int get double => 2*i;
}

void main() {
  final f = Foo(42);
  print(f);
  print(f.i);
  print(f.double);
}
