import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

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
        primarySwatch: Colors.orange,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
            minimumSize: MaterialStateProperty.all<Size>(const Size(250, 48)),
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.orange,
        ),
      ),
      home: const CameraderieApp(title: 'Cameraderie App Home Page'),
    );
  }
}

class CameraderieApp extends StatefulWidget {
  final String title;
  const CameraderieApp({super.key, required this.title});

  @override
  State<CameraderieApp> createState() => _CameraderieAppState();
}

class _CameraderieAppState extends State<CameraderieApp> {
  File? _imageFile;

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/whitetexturebg.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _imageFile == null
                  ? const Text(
                      'No Image Selected!',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    )
                  : Image.file(
                      _imageFile!,
                      height: 300,
                    ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _getImage,
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                ),
                child: const Text(
                  'Click a Photo',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
