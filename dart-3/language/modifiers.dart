/// ===========================================================================
/// interface
/// - describes a contract that other classes can implement
/// - can also be instantiated, unless combined with abstract
/// ===========================================================================

interface class Pet {
  String get sound => '[unknown]';
}

class Dog implements Pet {
  String get sound => 'woof';
}

abstract interface class Comparable<T> {
  /// Returns a negative integer if `this` is ordered before [other],
  /// a positive integer if `this` is ordered after [other],
  /// and zero if `this` and [other] are ordered together.
  int compareTo(T other);
}

class Size implements Comparable<Size> {
  int s;
  Size(this.s);
  int compareTo(Size other) => s.compareTo(other.s);
  String toString() => 'size $s';
}

void demoInterfaces() {
  // Interface.
  Pet p = Pet();
  print('Pet says ${p.sound}');
  p = Dog();
  print('Dog says ${p.sound}');

  // Abstract interface.
  final m1 = Size(12);
  final m2 = Size(42);
  print('$m1 compared to $m2: ${m1.compareTo(m2)}');
}

/// ===========================================================================
/// abstract
/// - describes a a type that cannot be instantiated/constructed,
///   but which may still be extended (to create a subtype)
///   or implemented (to create a non-abstract class).
/// ===========================================================================

abstract class Greeter {
  String get hi;
  int get greetiness => hi.length;
}

class USGreeter extends Greeter {
  String get hi => 'Hi';
}

class DanishGreeter implements Greeter {
  String get hi => 'Hej';
  int get greetiness => 0;
}

demoAbstract() {
  // Uncommenting the line below causes an error.
  // final f = foo();

  Greeter g = DanishGreeter();
  print('Danish greeter says ${g.hi}; greetiness ${g.greetiness}');

  g = USGreeter();
  print('US greeter says ${g.hi}; greetiness ${g.greetiness}');
}

/// ===========================================================================
/// FINAL
/// - final classes cannot be subtyped
/// ===========================================================================

final class Number {
  final int value;
  const Number(this.value);
}

final class PositiveNumber extends Number {
  const PositiveNumber(super.value) : super.value = 1;
}

class Number2 {
  final value;
  const Number2(this.value);
}

class Number3 extends Number2 {
  const Number3(super.value);
}

void demoFinal() {
  Number2 n = Number2(42);

  if (n is Number3) {}
}

/// ===========================================================================
/// MIXIN
/// - mixin types are unchanged
/// - classes that are to be mixed in must add the `mixin` modifier
/// ===========================================================================

class Performer {}

class Person {
  String name;
  Person(this.name);
}

class Maestro extends Person with Musical, Aggressive {
  Maestro(super.name) {
    canConduct = true;
  }
}

mixin Musical {
  bool canPlayPiano = false;
  bool canCompose = false;
  bool canConduct = false;

  void entertainMe() {
    if (canPlayPiano) {
      print('Playing piano');
    } else if (canConduct) {
      print('Waving hands');
    } else {
      print('Humming to self');
    }
  }
}

// Removing `mixin` from here  an error:
// "The class 'Aggressive' can't be used as a mixin because it isn't a mixin class nor a mixin."
mixin class Aggressive {
  void entertainMe() {
    print('No!');
  }
}

void demoMixins() {
  print('Will the Maestro entertain us?');
  Maestro('Franz').entertainMe();
}

/// ===========================================================================

void main() {
  seperator('Abstract');
  demoAbstract();
  seperator('Interfaces');
  demoInterfaces();
  seperator('Mixins');
  demoMixins();
}

void seperator(String message) {
  print('\n ***** $message\n');
}
