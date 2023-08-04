// Create a type `IdNumber` which has `int` as the underlying representation.
extension type IdNumber(int i) implements Comparable<IdNumber> {
  // Implement the less-than operator; smaller means assigned before.
  bool operator <(IdNumber other) => i < other.i;

  // Implement the Comparable contract.
  @override int compareTo(IdNumber other) => i - other.i;

  // Verify that the IdNumber is allocated to a person of given age.
  bool verify({required int age}) => true; // TODO: Implement.
}

class Foo implements Comparable<Foo> {
  @override int compareTo(Foo other) => 1;
}

void main() {
  int myId = 42424242; // Storing an id as a regular int.
  myId = myId + 10;    // Allowed; myId is just a regular int.

  var safeId = IdNumber(20004242); // Storing an id using IdNumber.
  myId = safeId + 10; // Compile-time error, IdNumber has no operator `+`.
  myId = safeId;      // Compile-time error, type mismatch.

  print(safeId.verify(age: 22)); // Prints true; age 22 matches.
  myId = safeId as int; // Extension types support type casting.
  print(safeId.i);      // Prints 20004242; the representation value can be read.

  final ids = [IdNumber(20001), IdNumber(200042), IdNumber(200017)];
  ids.sort();
  print(ids);

  dynamic otherId = safeId;
  print(otherId.i); // Causes runtime error: extension types are entirely static,
                    // the static type is dynamic, and dynamic has no .i
}