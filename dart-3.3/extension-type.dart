// Experimental feature. Run with:
// dart run --enable-experiment=inline-class extension-type.dart

// Create a type `IdNumber` which has `int` as the underlying representation.
// The representation type is defined with a default constructor.
extension type IdNumber(int i) {
  // Compare IdNumbers; larger means assigned more recently.
  operator <(IdNumber other) => i < other.i;

  // Verify that the IdNumber is allocated to a person of given age.
  bool verify({required int age}) {
    final birthYear = DateTime.now().year - age;
    return i.toString().startsWith(birthYear.toString());
  }
}

void main() {
  var safeId = IdNumber(20004242);
  print(safeId.verify(age: 23)); // OK, age 23 matches.

  print(safeId as int); // OK: Type casting is allowed.
  print(safeId.i); // OK: Representation value can be read.

  // var myId = 0;
  // myId = safeId; // Compile-time error, type mismatch.

  // var myId2 = safeId + 10; // Compile-time error, IdNumber has no operator `+`.

  // dynamic otherId = safeId;
  // print(otherId.i); // Runtime error: Class 'int' has no instance getter 'i'
}
