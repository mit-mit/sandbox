import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/cupertino.dart' as cupertino;

class Button extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final ButtonStyle style;

  const Button({
    super.key,
    required this.onPressed,
    required this.child,
    this.style = ButtonStyle.filled,
  });

  @override
  Widget build(BuildContext context) {
    return switch (defaultTargetPlatform) {
      TargetPlatform.iOS || TargetPlatform.macOS => cupertino.CupertinoButton(
          onPressed: onPressed,
          child: child,
        ),
      _ => material.FilledButton(
          onPressed: onPressed,
          child: child,
        ),
    };
  }
}

enum ButtonStyle {
  hollow,
  filled,
}
