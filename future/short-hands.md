Related to https://github.com/dart-lang/language/issues/357, exploring what would be useful beyond enums.

## Enums

### Example 1: BoxFit

Use current:
```dart
Image(
  image: collectible.icon,
  fit: BoxFit.contain,
)
```

Use desired:
```dart
Image(
  image: collectible.icon,
  fit: .contain,
)
```

Definitions:

```dart
class Image extends StatefulWidget {
  final BoxFit? fit;

  const Image({
    super.key,
    required this.image,
    ...
    this.fit,
  });
}

enum BoxFit {
  fill,
  contain,
  ...
}
```

Example:
[`Image(fit: BoxFit.contain)`](https://github.com/gskinnerTeam/flutter-wonderous-app/blob/main/lib/ui/common/collectible_item.dart#L51)

### Example 2: Alignment

Use current:
```dart
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  mainAxisSize: MainAxisSize.min,
  children: [ ... ],
)
```

Use desired:
```dart
Row(
  mainAxisAlignment: .center,
  mainAxisSize: .min,
  children: [ ... ],
)
```

Definitions:

```dart
class Row extends Flex {
  const Row({
    ...
    super.mainAxisAlignment,
    ...
  }) : super(
    ...
  );
}

class Flex extends MultiChildRenderObjectWidget {
  final MainAxisAlignment mainAxisAlignment;

  const Flex({
    ...
    this.mainAxisAlignment = MainAxisAlignment.start,
    ...
  }) : ...
}

enum MainAxisAlignment {
  start,
  end,
  center,
  ...
}
```

Example:
[`mainAxisAlignment: MainAxisAlignment.center`](https://github.com/gskinnerTeam/flutter-wonderous-app/blob/main/lib/ui/common/controls/buttons.dart#L57)

## Named constructors

### Example 1: BackdropFilter

Use current:
```dart
BackdropFilter(
  filter: ImageFilter.blur(sigmaX: x, sigmaY: y),
  child: myWidget,
)
```

Use desired:
```dart
BackdropFilter(
  filter: .blur(sigmaX: x, sigmaY: y),
  child: myWidget,
)
```

Definitions:
```dart
class BackdropFilter extends SingleChildRenderObjectWidget {
  final ui.ImageFilter filter;

  const BackdropFilter({
    required this.filter,
    ...
  });
}

abstract class ImageFilter {
  ImageFilter._(); // ignore: unused_element
  factory ImageFilter.blur({ double sigmaX = 0.0, double sigmaY = 0.0, TileMode tileMode = TileMode.clamp }) { ... }
}
```

Example:
[`filter: ImageFilter.blur`](https://github.com/gskinnerTeam/flutter-wonderous-app/blob/main/lib/ui/common/app_backdrop.dart#L21)

### Example 2: Padding

Use current:
```dart
Padding(
  padding: EdgeInsets.all(32.0),
  child: myWidget,
),
```

Use desired:
```dart
Padding(
  padding: .all(32.0),
  child: myWidget,
),
```

Definitions:

```dart
class Padding extends SingleChildRenderObjectWidget {
  final EdgeInsetsGeometry padding;

  const Padding({
    super.key,
    required this.padding,
    super.child,
  });
}

class EdgeInsets extends EdgeInsetsGeometry {
  ...
  const EdgeInsets.all(double value)
   : left = value,
      top = value,
      right = value,
      bottom = value;
}
```

Example: [`padding: EdgeInsets.all(32.0)`](https://github.com/gskinnerTeam/flutter-wonderous-app/blob/main/lib/_tools/artifact_search_helper.dart#L51)


## Static members

Use current:
```dart
Image(
  image: collectible.icon,
  fit: BoxFit.contain,
)
```

Use desired:
```dart
Image(
  image: collectible.icon,
  fit: .contain,
)
```

Definitions:

```dart
class Image extends StatefulWidget {
  final BoxFit? fit;

  const Image({
    super.key,
    required this.image,
    ...
    this.fit,
  });
}

enum BoxFit {
  fill,
  contain,
  ...
}
```

Example:
[`Image(fit: BoxFit.contain)`](https://github.com/gskinnerTeam/flutter-wonderous-app/blob/main/lib/ui/common/collectible_item.dart#L51)
