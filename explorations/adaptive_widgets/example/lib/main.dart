import 'package:adaptive_widgets/widgets.dart';

void main() {
  runApp(App(home: MyHomePage()));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool enabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      title: Text('Adaptive demo'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Counter is ${enabled ? 'enabled' : 'disabled'}'),
            Switch(
              value: enabled,
              onChanged: toggle,
            ),
          ],
        ),
      ),
      primaryAction: PrimaryAction(
        icon: material.Icons.add_outlined,
        onPressed: () {
          showDialog(
            context: context,
            dialog: AlertDialog(
              title: Text('Add'),
              content: Text('Sorry, adding not implemented yet :-('),
              actions: [
                AlertAction(
                  text: 'Got it!',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }

  void toggle(bool value) {
    setState(() {
      enabled = value;
    });
  }
}
