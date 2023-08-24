import 'package:flutter/material.dart';

void main() {
	runApp(const MyApp());
}

class MyApp extends StatelessWidget {
	const MyApp({super.key});

	// This widget is the root of your application.
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'I Am Rich',
			theme: ThemeData(
				primarySwatch: Colors.blue,
			),
			home: const MyHomePage(title: 'I Am Rich'),
		);
	}
}

class MyHomePage extends StatefulWidget {
	const MyHomePage({super.key, required this.title});
	final String title;

	@override
	State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
	@override
	Widget build(BuildContext context) {

		return Scaffold(
			appBar: AppBar(
				title: Text(widget.title),
				backgroundColor: Colors.blueGrey[900],
			),
			backgroundColor: Colors.blueGrey,
			body: const Center(
				child: Image(
					image: AssetImage('assets/images/diamond.png')
				),
			),
		);
	}
}
