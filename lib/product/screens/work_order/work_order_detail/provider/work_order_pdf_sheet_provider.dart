import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class WorkOrderPdfSheetProvider extends ChangeNotifier {
  File? doc;

  Future<void> getPDF() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc'],
    );

    if (result != null) {
      doc = File(result.paths.first!);
      notifyListeners();
    }
  }
}
