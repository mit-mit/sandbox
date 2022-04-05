final factorials = List<int>.generate(
  10,
  growable: true,
  (int i) {
    if (i == 0) {
      return 1;
    } else {
      var result = 1;
      for (var r = 2; r <= i; ++r) {
        result *= r;
      }
      return result;
    }
  },
);

main() {
  print(factorials);
}
