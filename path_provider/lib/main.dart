import 'package:flutter/material.dart';
import 'package:path_provider_demo/file_manager.dart';

void main() {
  runApp(MainApp(
    fileManager: FileManager(),
  ));
}

class MainApp extends StatefulWidget {
  final FileManager fileManager;

  const MainApp({
    super.key,
    required this.fileManager,
  });

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int count = 0;

  @override
  void initState() {
    widget.fileManager.readData().then((String data) {
      setState(() {
        count = int.parse(data);
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Path Provider Demo')),
        body: Center(
          child: Text('Button pressed $count time${count == 1 ? '' : 's'}.'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              count++;
            });
            widget.fileManager.writeData(count.toString());
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
