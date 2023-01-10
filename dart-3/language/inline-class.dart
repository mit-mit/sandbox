// Experimental feature. Run with:
// dart run --enable-experiment=inline-class inline-class.dart

// Create a type `IdNumber` which has `int` as the underlying representation.
inline class IdNumber {
  // Define the representation type.
  final int i;

  // Default constructor.
  IdNumber(this.i);

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

  // myId = safeId + 10; // Compile-time error, IdNumber has no operator `+`.
  // myId = safeId; // Compile-time error, type mismatch.

  // dynamic otherId = safeId.
  // print(otherId.i); // Runtime error: otherId has runtime type int, which has no .i
}
