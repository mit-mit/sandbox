// Experimental feature. Run with:
// dart run --enable-experiment=records basic-record.dart
void main(List<String> arguments) {
  var (lat, long) = getLocation('Aarhus');
  print('Location: $lat, $long.');

  var (l, _) = getLocation('Other');
  print('Location: $l.');
}

(double lat, double long) getLocation(String name) {
  if (name == 'Aarhus') {
    return (56.1629, 10.2039);
  } else {
    return (0.0,0.0);
  }
}
