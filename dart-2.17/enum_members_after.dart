enum Water {
  frozen(32),
  cold(43),
  boiling(212);

  final int tempInFahrenheit;
  const Water(this.tempInFahrenheit);

  @override
  String toString() => "The $name water is $tempInFahrenheit F.";
}

void main(List<String> arguments) {
  print(Water.frozen);
}
