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
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 33, 18, 206)),
        useMaterial3: true,
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _imageFile == null
                ? const Text('No Image Selected!')
                : Image.file(
                    _imageFile!,
                    height: 300,
                  ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _getImage,
              child: const Text('Click a Photo'),
            ),
          ],
        ),
      ),
    );
  }
}
