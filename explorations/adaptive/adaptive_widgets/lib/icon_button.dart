import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart' hide Icon;
import 'package:flutter/material.dart' as material;
import 'package:flutter/cupertino.dart' as cupertino;

import 'icon.dart';

class IconButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Icon icon;

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
          child: cupertino.Icon(icon.icon),
        ),
      _ => material.IconButton(
          onPressed: onPressed,
          icon: material.Icon(icon.icon),
        ),
    };
  }
}
