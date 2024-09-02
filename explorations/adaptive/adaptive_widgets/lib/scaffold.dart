import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart' hide Icon;
import 'package:flutter/material.dart' as material;
import 'package:flutter/cupertino.dart' as cupertino;

import 'icon.dart';
import 'icon_button.dart';

class Scaffold extends StatelessWidget {
  final Widget title;
  final Widget? body;
  final ScaffoldAction? primaryAction;
  final ScaffoldAction? secondaryAction;

  const Scaffold({
    super.key,
    required this.title,
    required this.body,
    this.primaryAction,
    this.secondaryAction,
  });

  @override
  Widget build(BuildContext context) {
    IconButton? trailing;
    if (secondaryAction != null) {
      trailing = IconButton(
        icon: secondaryAction!.icon,
        onPressed: secondaryAction!.onPressed,
      );
    }

    switch (defaultTargetPlatform) {
      case TargetPlatform.iOS || TargetPlatform.macOS:
        final main = <Widget>[
          Expanded(child: body ?? Placeholder()),
        ];
        if (primaryAction != null) {
          main.add(
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: cupertino.CupertinoButton.filled(
                onPressed: primaryAction!.onPressed,
                child: Text(primaryAction!.label),
              ),
            ),
          );
        }

        return cupertino.CupertinoPageScaffold(
          key: key,
          navigationBar: cupertino.CupertinoNavigationBar(
            middle: title,
            trailing: trailing,
          ),
          child: Column(children: main),
        );
      default:
        return material.Scaffold(
          key: key,
          appBar: material.AppBar(
            key: key,
            title: title,
            actions: (trailing != null) ? [trailing] : null,
          ),
          body: body,
          floatingActionButton: material.FloatingActionButton(
            onPressed: primaryAction!.onPressed,
            child: material.Icon(primaryAction!.icon.icon),
          ),
        );
    }
  }
}

class ScaffoldAction {
  final VoidCallback? onPressed;
  final Icon icon;
  final String label;

  ScaffoldAction({this.onPressed, required this.icon, required this.label});
}
