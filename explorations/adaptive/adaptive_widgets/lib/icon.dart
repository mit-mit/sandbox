import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart' show IconData;
import 'package:flutter/material.dart' as material;
import 'package:flutter/cupertino.dart' as cupertino;

class Icon {
  final IconData materialIcon;
  final IconData cupertinoIcon;
  const Icon(this.materialIcon, this.cupertinoIcon);
  IconData get icon => switch (defaultTargetPlatform) {
        TargetPlatform.iOS || TargetPlatform.macOS => cupertinoIcon,
        _ => materialIcon,
      };
}

class Icons {
  static const add = Icon(
    material.Icons.add_outlined,
    cupertino.CupertinoIcons.add,
  );
  static const reset = Icon(
    material.Icons.restart_alt_outlined,
    cupertino.CupertinoIcons.restart,
  );
}
