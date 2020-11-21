import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:getx_test/controllers/global_controller.dart';
import 'package:getx_test/controllers/home_controller.dart';
import 'package:getx_test/pages/home_page_widgets/home_list.dart';
import 'package:getx_test/widgets/product_list.dart';

class HomePage extends StatelessWidget {

  //final HomeController _controller = HomeController(); Desnecessário porque passo no init

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        //id: (opcional) para unicamente renderizar as partes necessarias
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              actions: [
                GetBuilder<GlobalController>(
                  id: 'favorites',
                    builder: (_) => FlatButton(
                        onPressed: () {},
                        child: Text("Favorites  (${_.favorites.length})")
                    )
                )
              ],
            ),
            //body: HomeList(),
            body: ProductList(),
            floatingActionButton: FloatingActionButton(
                onPressed: () {  _.increment();  },
                child: Icon(Icons.add)
            ),
          );
        }
    );
  }
}
