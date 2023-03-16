// Demonstrates using the Dart 3 records feature
// to return a pair of values from a function.
// Individual values are read using positional access.
void main(List<String> arguments) {
  var l = getLocation('Aarhus');
  print('Current location: ${l.$1}, ${l.$2}.');
}

(double lat, double long) getLocation(String name) {
  if (name == 'Aarhus') {
    return (56.1629, 10.2039);
  } else {
    return (0.0, 0.0);
  }
}
