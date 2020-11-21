import 'dart:async';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:getx_test/pages/home_page.dart';

class SplashController extends GetxController {

  @override
  void onReady() {
    super.onReady();
    Future.delayed(Duration(seconds: 2), () {
      Get.off(// To para navegar e da para voltar a trás
        // Off não da para voltar faz tipo dispose é o mesmo que navigator.pushReplacement()
        // offUntil é o mesmo que navigator.PushAndRemoveUntil(newRoute, predicate)
        HomePage(),
        transition: Transition.zoom,
      );
    });
  }

  @override
  void onClose() {
    print("same as dispose");
    super.onClose();
  }
}