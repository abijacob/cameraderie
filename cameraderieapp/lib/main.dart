import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cameraderie Photo App',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 33, 18, 206)),
        useMaterial3: true,
      ),
      home: const CameraderieApp(title: 'Cameraderie App Home Page'),
    );
  }
}

class CameraderieApp extends StatelessWidget {
  final String title;
  const CameraderieApp({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('No Image Selected!'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: null,
              child: Text('Click a Photo'),
            ),
          ],
        ),
      ),
    );
  }
}
