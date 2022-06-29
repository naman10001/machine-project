import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePick extends StatefulWidget {
  ImagePick({
    Key? key,
    required this.image1,
    required this.image2,
    required this.image3,
  }) : super(key: key);
  String image1;
  String image2;
  String image3;
  @override
  State<ImagePick> createState() => _ImagePickState();
}

class _ImagePickState extends State<ImagePick> {
  File? _imageFile1;
  File? _imageFile2;
  File? _imageFile3;

  Future<void> _pickImage() async {
    final imagefile = await ImagePicker.platform
        .getImage(source: ImageSource.camera, maxWidth: 600);

    if (imagefile == null) {
      return;
    }
    setState(() {
      _imageFile1 = File(imagefile.path);
      widget.image1 = imagefile.path;
    });
  }

  Future<void> _pickImage2() async {
    final imagefile = await ImagePicker.platform
        .getImage(source: ImageSource.camera, maxWidth: 600);

    if (imagefile == null) {
      return;
    }
    setState(() {
      _imageFile2 = File(imagefile.path);
      widget.image2 = imagefile.path;
    });
  }

  Future<void> _pickImage3() async {
    final imagefile = await ImagePicker.platform
        .getImage(source: ImageSource.camera, maxWidth: 600);

    if (imagefile == null) {
      return;
    }
    setState(() {
      _imageFile3 = File(imagefile.path);
      widget.image3 = imagefile.path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _clickPick(
            image: _imageFile1,
            onTap: _pickImage,
          ),
          _clickPick(image: _imageFile2, onTap: _pickImage2),
          _clickPick(image: _imageFile3, onTap: _pickImage3),
        ],
      ),
    );
  }

  Widget _clickPick({required File? image, required Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(9)),
        child: Container(
          //padding: const EdgeInsets.all(2),
          height: 80,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 1,
              color: Colors.black,
            ),
          ),
          child: image != null
              ? Image.file(
                  image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : const Center(
                  child: Icon(
                  Icons.camera_alt_outlined,
                  size: 40,
                )),
        ),
      ),
    );
  }
}
