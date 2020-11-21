import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:getx_test/models/user.dart';

class ProfileController extends GetxController {

  User _user;
  User get user => _user;

  String _inputText = '';

  @override
  void onInit() {
    super.onInit();
    this._user = Get.arguments as User;
  }

  void onInputTextChanged(String text) {
    this._inputText = text;
    // nao ponho update pois não quero rebuildar a vista
  }

  void goToBackWithData() {
    if(this._inputText.trim().length > 0) {
      Get.back(result: this._inputText);
    } else {
      // este get substitui o showDialog() e não é preciso assim passar o context nem o builder
      // com o cupertino tem que usar o showCupertinoModalPopup
      Get.dialog(
        AlertDialog(
          title: Text("ERROR"),
          content: Text("Enter a valid Value"),
          actions: [
            FlatButton(onPressed: () => Get.back(), child: Text("OK")),
          ],
        )
      );
    }
  }
}