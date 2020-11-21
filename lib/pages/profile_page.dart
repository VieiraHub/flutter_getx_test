import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:getx_test/controllers/profile_controller.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
        builder: (_) => Scaffold(
          appBar: AppBar(
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => Get.back() //Igual a navigator.pop
            ),
          ),
          body: Center(
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("${_.user.firstName} ${_.user.lastName}"),
                  SizedBox(height: 15),
                  TextField(
                    onChanged: _.onInputTextChanged,
                  ),
                  SizedBox(height: 15),
                  RaisedButton(
                    child: Text("Accept"),
                      onPressed: _.goToBackWithData
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}
