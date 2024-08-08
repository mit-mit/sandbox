import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/cupertino.dart' as cupertino;

class IconButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData icon;

  const IconButton({
    super.key,
    this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return switch (defaultTargetPlatform) {
      TargetPlatform.iOS || TargetPlatform.macOS => cupertino.CupertinoButton(
          onPressed: onPressed,
          padding: EdgeInsets.all(0),
          child: Icon(icon),
        ),
      _ => material.IconButton(
          onPressed: onPressed,
          icon: Icon(icon),
        ),
    };
  }
}
