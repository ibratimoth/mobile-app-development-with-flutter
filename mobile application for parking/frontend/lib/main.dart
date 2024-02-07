import 'dart:html';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image and Location Upload',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ImageCaptureScreen(),
    );
  }
}

class ImageCaptureScreen extends StatefulWidget {
  @override
  _ImageCaptureScreenState createState() => _ImageCaptureScreenState();
}

class _ImageCaptureScreenState extends State<ImageCaptureScreen> {
  File? _image;
  LocationData? locationData;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Capture Image and Location'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _image == null ? Text('No image selected.') : Image.file(_image!),
            ElevatedButton(
              onPressed: _captureImage,
              child: Text('Capture Image'),
            ),
            ElevatedButton(
              onPressed: _getLocation,
              child: Text('Get Location'),
            ),
            ElevatedButton(
              onPressed: () async {
                await _uploadData();
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Data uploaded successfully')));
              },
              child: Text('Upload Data'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _captureImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> _getLocation() async {
    var locationService = Location();
    locationData = await locationService.getLocation();
  }

  Future<void> _uploadData() async {
    if (_image != null && locationData != null) {
      String imageUrl = await _uploadImage();
      await _sendData(
          imageUrl, locationData!.latitude!, locationData!.longitude!);
    } else {
      print('Image or location data missing');
    }
  }

  Future<String> _uploadImage() async {
    return "https://example.com/image.jpg";
  }

  Future<void> _sendData(
      String imageUrl, double latitude, double longitude) async {
    var url = Uri.parse('http://your-node-server.com/upload');
    var response = await http.post(url, body: {
      'imageUrl': imageUrl,
      'latitude': latitude.toString(),
      'longitude': longitude.toString(),
    });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }
}

mixin camera {}

class ImageSource {
  static var camera;
}

class ImagePicker {
  getImage({required source}) {}
}

class LocationData {
  get longitude => null;

  get latitude => null;
}
