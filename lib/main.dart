import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test/controllers/global_controller.dart';
import 'package:getx_test/controllers/socket_client_controller.dart';
import 'package:getx_test/pages/home_page.dart';
import 'package:getx_test/pages/reactive_page.dart';
import 'package:getx_test/pages/splash_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(GlobalController());
    Get.put(SocketClientController());
    // Get.put insere esse controlador como global podemos aceder de qualquer lado da app
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ReactivePage(),
    );
  }
}