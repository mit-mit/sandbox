// Experimental feature. Run with:
// dart run --enable-experiment=records basic-record.dart
void main(List<String> arguments) {
  var loc = getLocation('Aarhus');
  print('Current location: ${loc.$0}, ${loc.$1}!');
}

(double lat, double long) getLocation(String name) {
  if (name == 'Aarhus') {
    return (56.1629, 10.2039);
  } else {
    return (0.0,0.0);
  }
}
