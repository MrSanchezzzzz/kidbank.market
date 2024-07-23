import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kidbank/core/colors.dart';

class ImagePickerExample extends StatefulWidget {
  const ImagePickerExample({super.key});

  @override
  _ImagePickerExampleState createState() => _ImagePickerExampleState();
}

class _ImagePickerExampleState extends State<ImagePickerExample> {
  File? _image;

  Future<void> _pickImage() async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      setState(() {
        if (pickedFile != null) {
          _image = File(pickedFile.path);
        } else {
          if (kDebugMode) {
            print('No image selected.');
          }
        }
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
    }
  }

  void _clearImage() {
    setState(() {
      _image = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: _pickImage,
            child: Container(
              width: 171,
              height: 171,
              color: Colors.white100,
              child: Stack(
                children: [
                  if (_image == null)
                    Center(
                      child: Icon(
                        CupertinoIcons.photo_camera,
                        color: Colors.grey300,
                        size: 50,
                      ),
                    )
                  else
                    Image.file(
                      _image!,
                      width: 171,
                      height: 171,
                      fit: BoxFit.cover,
                    ),
                  if (_image != null)
                    Positioned(
                      top: 5,
                      right: 5,
                      child: GestureDetector(
                        onTap: _clearImage,
                        child: Container(
                          color: Colors.grey500,
                          child: Icon(
                            CupertinoIcons.clear,
                            color: Colors.white100,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Take photo',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}