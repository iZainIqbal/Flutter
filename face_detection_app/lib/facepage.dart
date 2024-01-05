// ignore_for_file: unused_field

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';

class FacePage extends StatefulWidget {
  const FacePage({super.key});

  @override
  State<FacePage> createState() => _FacePageState();
}

class _FacePageState extends State<FacePage> {
  late File _imageFile;
  late List<Face> _faces;

  void _getImageAndDetectFaces() async {
    final picker = ImagePicker();
    final imageFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    final inputImage = InputImage.fromFilePath(imageFile!.path);
    final faceDetector = GoogleMlKit.vision.faceDetector(FaceDetectorOptions(
      performanceMode: FaceDetectorMode.accurate,
      enableLandmarks: true,
    ));
    final faces = await faceDetector.processImage(inputImage);
    setState(() {
      _imageFile = File(imageFile.path);
      _faces = faces;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Face Detection'),
      ),
      body: _imageFile == null
          ? Container()
          : ImageAndFaces(
              imageFile: _imageFile,
              faces: _faces,
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getImageAndDetectFaces,
        tooltip: 'Pick an Image',
        child: const Icon(Icons.add_a_photo_outlined),
      ),
    );
  }
}

class ImageAndFaces extends StatelessWidget {
  const ImageAndFaces(
      {super.key, required this.imageFile, required this.faces});
  final File imageFile;
  final List<Face> faces;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 2,
          child: Container(
            constraints: const BoxConstraints.expand(),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: FileImage(imageFile),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Flexible(
            flex: 1,
            child: ListView(
              children:
                  faces.map((face) => FaceCoordinates(face: face)).toList(),
            ))
      ],
    );
  }
}

class FaceCoordinates extends StatelessWidget {
  const FaceCoordinates({super.key, required this.face});
  final Face face;

  @override
  Widget build(BuildContext context) {
    final pos = face.boundingBox;
    return ListTile(
      title: Text('(${pos.left}, ${pos.top})'),
      subtitle: Text('(${pos.right}, ${pos.bottom})'),
    );
  }
}
