import 'package:adaptive_widgets/widgets.dart' hide Action;

void main() {
  runApp(App(home: MyHomePage()));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool countFast = true;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      title: Text('Counter app'),
      body: Center(
        child: Text('Current count: $count'),
      ),
      primaryAction: ScaffoldAction(
        icon: Icons.add,
        label: 'Increment',
        onPressed: () => setState(() => count += 1),
      ),
      secondaryAction: ScaffoldAction(
        icon: Icons.reset,
        label: 'Reset',
        onPressed: () async {
          bool reset = await showDialog(
            context: context,
            dialog: buildAlertDialog(context),
          );
          if (reset) {
            setState(() => count = 0);
          }
        },
      ),
    );
  }
}

AlertDialog buildAlertDialog(BuildContext context) => AlertDialog(
      title: Text('Reset'),
      content: Text('Reset counter to 0?'),
      actions: [
        AlertAction(
          text: 'No',
          onPressed: () => Navigator.pop(context, false),
        ),
        AlertAction(
          text: 'Yes',
          onPressed: () => Navigator.pop(context, true),
        )
      ],
    );
