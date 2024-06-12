import 'package:json/json.dart';

@JsonCodable()
class Vehicle {
  final String description;
  final int wheels;
  Vehicle(this.description, this.wheels);
}

void main() {
  Map<String, Object?> json = Vehicle('bicycle', 2).toJson();
  print(json.keys);
}
