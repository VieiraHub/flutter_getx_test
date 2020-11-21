import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:getx_test/controllers/splash_controller.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      //dispose: (_) => print("normal dispose"), está comentado porque tem onclose no controller
      init: SplashController(),
        builder: (_) => Scaffold(
          body: Center( child: CircularProgressIndicator() ),
        )
    );
  }
}
