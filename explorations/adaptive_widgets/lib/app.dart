import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/cupertino.dart' as cupertino;

class App extends StatelessWidget {
  final Widget? home;

  const App({super.key, this.home});

  @override
  Widget build(BuildContext context) {
    return switch (defaultTargetPlatform) {
      TargetPlatform.iOS || TargetPlatform.macOS => cupertino.CupertinoApp(
          title: 'Flutter Demo',
          theme: cupertino.CupertinoThemeData(
              brightness: cupertino.Brightness.light),
          home: home,
        ),
      _ => material.MaterialApp(
          title: 'Flutter Demo',
          theme: material.ThemeData(
            colorScheme: material.ColorScheme.fromSeed(
                seedColor: material.Colors.deepPurple),
            useMaterial3: true,
          ),
          home: home,
        ),
    };
  }
}
