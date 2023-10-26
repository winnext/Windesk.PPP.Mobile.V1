import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../constants/style/border_radius.dart';

class AddJustPhotoModalBottomSheet extends StatelessWidget {
  const AddJustPhotoModalBottomSheet(this.saveImageFunction, {super.key});
  final Function saveImageFunction;
  

  @override
  Widget build(BuildContext context) {
    return _bodyWidget(context);
  }

  _bodyWidget(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
        child: Column(
          children: [
            _PhotoStack(saveImageFunction: saveImageFunction),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class _PhotoStack extends StatelessWidget {
  _PhotoStack({required this.saveImageFunction});
  final Function saveImageFunction;

  File? _image;

  final ImagePicker _imagePicker = ImagePicker();

  Future getImage() async {
    final image = await _imagePicker.pickImage(source: ImageSource.camera);
    if (image != null) {
      _image = File((image).path);
      return _image;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 40,
      child: Stack(
        children: [
          Container(color: Colors.grey),
          _image == null
              ? const SizedBox()
              : SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Image.file(_image!, fit: BoxFit.fitWidth),
                ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: FloatingActionButton(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.white, width: 1.0),
                  borderRadius: CustomBorderRadius.circularBorderRadius,
                ),
                onPressed: () {
                  getImage().then((value) {
                    saveImageFunction(value);
                  });
                },
                child: const Icon(Icons.add, size: 36),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
