void main() {
  // *** Switch statement ***
  // A switch statement that matches and then executes a statememt.
  //
  // Each case has "case" in front, then a pattern, and a colon after.
  // Inside each case there is a statement (including an ending semicolon).
  // Using "break" after the case is no longer needed.

  Object i = 42;
  switch (i) {
    case 10:
      print('i is the value 10');
    case 42:
      print('i is the value 42');
    case int _:
      print('i is an int!');
    case List _:
      print('i is a List!');
    default:
      print('i is something else');
  }

  // *** Switch expression ***
  // A switch expression that matches and then evaluates.
  //
  // Each case has just the pattern, then a fat arrow,
  // and then an expression, all seperated by commas.

  var descriptionOfI = switch (i) {
    10 => 'i is the value 10',
    42 => 'i is the value 42',
    int _ => 'i is an int!',
    _ => 'i is something else'
  };
  print(descriptionOfI);

// *** If-case statement ***
// A conditional match and destructure statement against a single pattern.

  final json = [
    'Items',
    ['Apples', 'Bananas', 'Pears'],
    'Other stuff',
    'Even more stuff',
    ['A', 'B', 'C']
  ];
  if (json case ['Items', List items, ...]) {
    print('Available items: ${items.join(', ')}');
  } else {
    print('No items are available.');
  }
}

// *** If-case element ***
// Building elements with conditional matches.

class Column {
  List children;
  Column({required this.children});
}

List build() {
  final json = [
    'Items',
    ['Apples', 'Bananas', 'Pears'],
    'Other stuff',
    'Even more stuff',
    ['A', 'B', 'C']
  ];

  return [
    '# Goods on sale',
    if (json case ['Items', List items, ...])
      {
        'Available items:',
        Column(children: items),
      }
    else
      {'No items are available.'}
  ];
}
