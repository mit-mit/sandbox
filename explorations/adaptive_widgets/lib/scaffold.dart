import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/cupertino.dart' as cupertino;
import 'icon_button.dart';

class Scaffold extends StatelessWidget {
  final Widget title;
  final Widget? body;
  final PrimaryAction? primaryAction;

  const Scaffold({
    super.key,
    required this.title,
    required this.body,
    this.primaryAction,
  });

  @override
  Widget build(BuildContext context) {
    switch (defaultTargetPlatform) {
      case TargetPlatform.iOS || TargetPlatform.macOS:
        IconButton? primary;
        if (primaryAction != null) {
          primary = IconButton(
            icon: primaryAction!.icon,
            onPressed: primaryAction!.onPressed,
          );
        }

        return cupertino.CupertinoPageScaffold(
          key: key,
          navigationBar: cupertino.CupertinoNavigationBar(
            middle: title,
            trailing: primary,
          ),
          child: body ?? Placeholder(),
        );
      default:
        return material.Scaffold(
          key: key,
          appBar: material.AppBar(key: key, title: title),
          body: body,
          floatingActionButton: material.FloatingActionButton(
            onPressed: primaryAction!.onPressed,
            child: material.Icon(primaryAction!.icon),
          ),
        );
    }
  }
}

class PrimaryAction {
  final VoidCallback? onPressed;
  final IconData icon;

  PrimaryAction({this.onPressed, required this.icon});
}
