// Experimental feature. Run with:
// dart run --enable-experiment=records,patterns,sealed-class algebraic-datatypes.dart

import 'dart:math' as math;

sealed class Shape {
}

class Square extends Shape {
  final double length;
  Square(this.length);
}

class Circle extends Shape {
  final double radius;
  Circle(this.radius);
}

// Uncommenting this should trigger an error in the switch below.
// class Foo implements Shape { }

double calculateArea(Shape shape) =>
  switch (shape) {
    Square(length: var l) => l * l,
    Circle(radius: var r) => math.pi * r * r
  };
  
main() {
  Shape s = Circle(5);
  print('Area of Circle(5): ${calculateArea(s)}.');

  s = Square(4);
  print('Area of Square(4): ${calculateArea(s)}.');
}
