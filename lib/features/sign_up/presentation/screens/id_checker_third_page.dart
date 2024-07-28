import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kidbank/features/sign_up/presentation/widgets/image_picker.dart';

import '../widgets/id_checker.dart';

class ThirdIdCheckerPage extends StatefulWidget {
  const ThirdIdCheckerPage({super.key});

  @override
  State<ThirdIdCheckerPage> createState() => _ThirdIdCheckerPageState();
}

class _ThirdIdCheckerPageState extends State<ThirdIdCheckerPage> {
  File? _imageCamera;
  File? _imageGallery;
  bool gallaryPicked = false;
   bool cameraPicked = false;

//Picked photo from gallary
  Future<bool> _pickImageFromGallary() async {
    final picker = ImagePicker();
    final pickedFileGallery =
        await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFileGallery != null) {
        _imageGallery = File(pickedFileGallery.path);
        gallaryPicked = true;
      }
    });
    return true;
  }

  //Picked photo from camera
  Future<bool> _pickImageFromCamera() async {
  
      final picker = ImagePicker();
      final pickedFileGallery =
          await picker.pickImage(source: ImageSource.camera);

      setState(() {
        if (pickedFileGallery != null) {
          _imageCamera = File(pickedFileGallery.path);
          cameraPicked =true;
        } 
      });
      return true;
  }

  void _clearGallaryImage() {
    setState(() {
      _imageGallery = null;
    });
  }

  void _clearCameraImage() {
    setState(() {
      _imageCamera = null;
    });
  }

  void next() {
    context.push('/auth/id_check_success_page');
  }

  @override
  Widget build(BuildContext context) {
    return IdCheker(
      currentStep: 2,
      title: 'ID checker',
      onNext: gallaryPicked|| cameraPicked? next : null,
      child: Padding(
        padding: const EdgeInsets.only(top: 25.0),
        child: Column(
          children: [
            const Row(
              children: [
                Text('Upload a photo of your passport'),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Row(
                children: [
                  ImagePickerPage(
                    clear: _clearCameraImage,
                    image: _imageCamera,
                    title: 'Take photo',
                    onTap: _pickImageFromCamera,
                  ),
                  const SizedBox(width: 10),
                  ImagePickerPage(
                    clear: _clearGallaryImage,
                    image: _imageGallery,
                    title: 'Take photo from gallary',
                    onTap: _pickImageFromGallary,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
