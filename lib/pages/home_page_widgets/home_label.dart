import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:getx_test/controllers/home_controller.dart';

class HomeLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Como é filho do getbuilder na classe que o chama ele tem o init do pai
    return GetBuilder<HomeController>(
        id: 'text',
        builder: (_) => Text(_.counter.toString())
    );
  }
}
