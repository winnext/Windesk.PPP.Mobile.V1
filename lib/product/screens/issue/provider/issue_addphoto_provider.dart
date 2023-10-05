import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wm_ppp_4/feature/database/shared_manager.dart';
import 'package:wm_ppp_4/feature/enums/shared_enums.dart';
import 'package:wm_ppp_4/product/screens/issue/service/issue_service_repo_impl.dart';

class IssueAddPhotoProvider extends ChangeNotifier {
  final IssueServiceRepoImpml _issueServiceRepository = IssueServiceRepoImpml();
  final ImagePicker picker = ImagePicker();

  late File _image;
  File get image => _image;

  String _desc = '';
  String get desc => _desc;

  bool isLoading = false;
  bool isSuccess = false;
  bool errorAccur = false;

  void setDesc(String val) {
    _desc = val;
    notifyListeners();
  }

  void setFile(File file) {
    _image = file;
    notifyListeners();
  }

  void addImage(String issueCode) async {
    if (image.toString() != '') {
      isLoading = true;
      notifyListeners();

      Uint8List imagebytes = await image.readAsBytes(); //convert to bytes
      String base64string = base64.encode(imagebytes); //convert bytes to base64 string

      String userToken = await SharedManager().getString(SharedEnum.deviceId);
      String userName = await SharedManager().getString(SharedEnum.userName);
      final response = await _issueServiceRepository.addIssueAttachmentMethod(userToken, userName, issueCode, base64string, desc);

      response.fold(
        (l) => {
          if (l)
            {
              isSuccess = true,
            }
          else
            {
              errorAccur = true,
            }
        },
        (r) => {
          errorAccur = true,
        },
      );
    }
    isLoading = false;
    notifyListeners();

    Future.delayed(const Duration(seconds: 2), () {
      isSuccess = false;
      errorAccur = false;
    });
  }
}
