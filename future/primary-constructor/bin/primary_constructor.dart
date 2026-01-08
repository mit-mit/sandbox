void main(List<String> arguments) {
  //
  // Point.
  //

  final p = Point(12,42);
  print('Point p: $p');

  //
  // Vehicle.
  //

  var cart = Vehicle('My red cart', 2);
  print(cart.describe);

  // This currently fails, skip for now.
  // cart.name = 'My old cart';
  // print(cart.describe);

  final rocket = Vehicle.unwheeled('My spaceship');
  print(rocket.describe);
}

class Point(final int x, final int y);

class Vehicle(var String name, final int wheels) {
  Vehicle.unwheeled(String name) : this(name, -1);

  String get describe {
    String description = name;
    description+= ' has ${ wheels == -1 ? 'no wheels' : '$wheels wheels' }';
    return description;
  }
}
