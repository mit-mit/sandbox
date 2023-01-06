// Experimental feature. Run with:
// dart run --enable-experiment=records,patterns algebraic-datatypes.dart

import 'dart:math' as math;

abstract class Shape {
}

class Square implements Shape {
  final double length;
  Square(this.length);
}

class Circle implements Shape {
  final double radius;
  Circle(this.radius);
}

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
