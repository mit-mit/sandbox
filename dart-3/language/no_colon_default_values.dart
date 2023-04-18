// This syntax will trigger an error.
// Must be changed to `int x = 0`.
// A `dart fix` is provided.
int someInt({int x: 0}) => x;
