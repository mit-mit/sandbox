// Demonstrates using the Dart 3 records feature
// to return a pair of values from a function.
// Individual values are desctuctured.
void main(List<String> arguments) {
  var (lat, long) = getLocation('Aarhus');
  print('Location: $lat, $long.');

  var (l, _) = getLocation('Other');
  print('Latitude: $l.');
}

(double lat, double long) getLocation(String name) {
  if (name == 'Aarhus') {
    return (56.1629, 10.2039);
  } else {
    return (42.0, 12.0);
  }
}
