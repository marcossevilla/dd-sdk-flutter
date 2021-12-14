import 'package:flutter/material.dart';

import 'integration_scenarios/integration_scenarios_screen.dart';
import 'logging_screen.dart';

typedef SimpleWidgetConstructor = Widget Function();

class NavItem {
  final String label;
  final SimpleWidgetConstructor navItem;

  NavItem({required this.label, required this.navItem});
}

class ExampleApp extends StatefulWidget {
  const ExampleApp({Key? key}) : super(key: key);

  @override
  State<ExampleApp> createState() => _ExampleAppState();
}

class _ExampleAppState extends State<ExampleApp> {
  final items = <NavItem>[
    NavItem(label: 'Logging', navItem: LoggingScreen.new),
    NavItem(
        label: 'Integration Scenarios', navItem: IntegrationScenariosScreen.new)
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Datadog SDK Example App'),
        ),
        body: Center(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, i) {
              var item = items[i];
              return ListTile(
                title: Text(item.label),
                trailing: const Icon(Icons.arrow_right_sharp),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => item.navItem()),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
