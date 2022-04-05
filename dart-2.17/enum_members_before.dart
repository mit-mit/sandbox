enum Water {
  frozen,
  cold,
  boiling;
}

extension Members on Water {
  int waterToTemp(Water water) {
    switch (water) {
      case Water.frozen:
        return 32;
      case Water.cold:
        return 43;
      case Water.boiling:
        return 212;
    }
  }

  String convertToString() => "The $name water is ${waterToTemp(this)} F.";
}

void main() {
  print(Water.frozen.convertToString());
}
