import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/core/enums/view_state.dart';
import 'package:flutter_antonx_boilerplate/core/models/body/signup_body.dart';
import 'package:flutter_antonx_boilerplate/core/models/responses/auth_response.dart';
import 'package:flutter_antonx_boilerplate/core/others/base_view_model.dart';
import 'package:flutter_antonx_boilerplate/core/services/file_picker_service.dart';

import '../../../../locator.dart';

class SignUpViewModel extends BaseViewModel {
  final FilePickerService _imagePickerService = locator<FilePickerService>();
  int? selectedGenderIndex;
  SignUpBody signUpBody = SignUpBody();
  late AuthResponse response;

  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  bool passwordVisibility = true;

  togglePasswordVisibility() {
    setState(ViewState.busy);
    passwordVisibility = !passwordVisibility;
    setState(ViewState.idle);
  }

  updateIndex(val) {
    selectedGenderIndex = val;
    notifyListeners();
  }

  pickImage() async {
    signUpBody.image = await _imagePickerService.pickImage();
    notifyListeners();
  }
}
