import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../constants/other/app_strings.dart';
import '../../constants/style/border_radius.dart';
import '../buttons/custom_half_buttons.dart';

class AddJustPhotoModalBottomSheet extends StatelessWidget {
  const AddJustPhotoModalBottomSheet(this.saveImageFunction,  {super.key});
  final Function saveImageFunction;

  @override
  Widget build(BuildContext context) {
    return _bodyWidget(context);
  }

  _bodyWidget(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: Column(
          children: [
            _PhotoStack(saveImageFunction: saveImageFunction),
            const Spacer(flex: 10),
          ],
        ),
      ),
    );
  }

}

class _PhotoStack extends StatefulWidget {
  const _PhotoStack({required this.saveImageFunction});
  final Function saveImageFunction;

  @override
  State<_PhotoStack> createState() => _PhotoStackState();
}

class _PhotoStackState extends State<_PhotoStack> {
  _PhotoStackState();
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
      flex: 50,
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
                    widget.saveImageFunction(value);
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
