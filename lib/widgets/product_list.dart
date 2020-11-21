import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test/controllers/global_controller.dart';
import 'package:getx_test/models/product.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final controller = Get.find<GlobalController>();
    // não preciso usar o controller pois uso no diamond do getBuilder
    return GetBuilder<GlobalController>(
      id: 'products',
        builder: (_) => ListView.builder(
          // Aqui é 2_ para buildcontext fica __
            itemBuilder: (__, index) {
              final Product product = _.products[index];
              return ListTile(
                title: Text(product.name),
                subtitle: Text("USD ${product.price}"),
                trailing: IconButton(
                    icon: Icon(Icons.favorite,
                      color: product.isFavorite ? Colors.blue : Colors.grey,
                    ),
                    onPressed: () => _.onFavorite(index, !product.isFavorite)
                ),
              );
            },
          itemCount: _.products.length,
        ),
    );
  }
}
