import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePick extends StatefulWidget {
  const ImagePick({Key? key}) : super(key: key);

  @override
  State<ImagePick> createState() => _ImagePickState();
}

class _ImagePickState extends State<ImagePick> {
  File? _imageFile;

  Future<void> _pickImage() async {
    final imagefile = await ImagePicker.platform
        .getImage(source: ImageSource.camera, maxWidth: 600);

    if (imagefile == null) {
      return;
    }
    setState(() {
      _imageFile = File(imagefile.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            height: 100,
            width: 150,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Colors.grey,
              ),
            ),
            child: _imageFile != null
                ? Image.file(
                    _imageFile!,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  )
                : Text(
                    'No Image Found',
                    textAlign: TextAlign.center,
                  ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: ElevatedButton.icon(
              onPressed: _pickImage,
              icon: Icon(Icons.camera),
              label: Text('Take Image'),
            ),
          )
        ],
      ),
    );
  }
}
