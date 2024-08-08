import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/cupertino.dart' as cupertino;

class AlertDialog extends StatelessWidget {
  final Widget? title;
  Widget? content;
  final List<AlertAction> actions;

  AlertDialog({
    super.key,
    this.title,
    this.content,
    required this.actions,
  });

  @override
  Widget build(BuildContext context) {
    Widget widget;

    if (defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.macOS) {
      final cupertionoActions = <cupertino.CupertinoDialogAction>[];
      for (AlertAction action in actions) {
        cupertionoActions.add(cupertino.CupertinoDialogAction(
          onPressed: action.onPressed,
          child: Text(action.text),
        ));
      }
      widget = cupertino.CupertinoAlertDialog(
        title: title,
        content: content,
        actions: cupertionoActions,
      );
    } else {
      final materialActions = <material.TextButton>[];
      for (AlertAction action in actions) {
        materialActions.add(material.TextButton(
          onPressed: action.onPressed,
          child: Text(action.text),
        ));
      }

      widget = material.AlertDialog(
        title: title,
        content: content,
        actions: materialActions,
      );
    }

    return widget;
  }
}

void showDialog({
  required BuildContext context,
  required AlertDialog dialog,
}) {
  switch (defaultTargetPlatform) {
    case TargetPlatform.iOS || TargetPlatform.macOS:
      cupertino.showCupertinoDialog(
        context: context,
        builder: (context) => dialog,
      );
    default:
      material.showDialog(
        context: context,
        builder: (context) => dialog,
      );
  }
}

class AlertAction {
  final String text;
  final VoidCallback? onPressed;
  final Icon? icon;

  AlertAction({this.text = '', this.onPressed, this.icon});
}
