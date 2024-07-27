import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:kidbank/core/colors.dart';

// ignore: must_be_immutable
class ImagePickerPage extends StatefulWidget {
  ImagePickerPage({
    super.key,
    required this.title,
    required this.onTap,
    this.image,
    this.clear,
  });
  final String title;
  final void Function()? onTap;
  File? image;
  final void Function()? clear;

  @override
  _ImagePickerPageState createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: widget.onTap,
            child: Container(
              width: 171,
              height: 171,
              color: Colors.white100,
              child: Stack(
                children: [
                  if (widget.image == null)
                    Center(
                      child: Icon(
                        CupertinoIcons.photo_camera,
                        color: Colors.grey300,
                        size: 50,
                      ),
                    )
                  else
                    Image.file(
                      widget.image!,
                      width: 171,
                      height: 171,
                      fit: BoxFit.cover,
                    ),
                  if (widget.image != null)
                    Positioned(
                      top: 5,
                      right: 5,
                      child: GestureDetector(
                        onTap: widget.clear,
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
          Text(
            widget.title,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
