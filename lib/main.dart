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
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Multiple ListView in Column'),
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
  final animals = List.generate(100, (index) => "Animal $index");
  final plants = List.generate(100, (index) => "Plant $index");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: const Text(
                'Animals List',
                style: TextStyle(fontSize: 24),
              ),
            ),
            Expanded(
                child: ListView.builder(
              itemCount: animals.length,
              itemBuilder: (context, index) => Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  color: index % 2 == 0
                      ? Colors.amber.shade100
                      : Colors.amber.shade200,
                  child: Text(animals[index])),
            )),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: const Text(
                'Plants List',
                style: TextStyle(fontSize: 24),
              ),
            ),
            Expanded(
                child: ListView.builder(
              itemCount: plants.length,
              itemBuilder: (context, index) => Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  color: index % 2 == 0
                      ? Colors.blue.shade100
                      : Colors.blue.shade200,
                  child: Text(plants[index])),
            )),
          ],
        ),
      ),
    );
  }
}
