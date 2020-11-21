import 'dart:async';
import 'package:get/get.dart';
import 'package:getx_test/controllers/socket_client_controller.dart';
import 'package:getx_test/models/pet.dart';

class ReactiveController extends GetxController {

  RxInt counter = 0.obs;
  RxString currentDate = ''.obs;

  RxList<String> items = List<String>().obs;
  RxMap<String, dynamic> mapItems = Map<String, dynamic>().obs;

  //Rx<Pet> myPet = Pet(name: "Bolinhas",age: 1).obs;
  // já não se usa porque foi criada a classe observable
  Pet myPet = Pet(name: "Bolinhas",age: 1);

  StreamSubscription<String> _subscription;

  @override
  void onInit() {
    super.onInit();
    final socketClientController = Get.find<SocketClientController>();

    _subscription = socketClientController.message.listen((String data) {
      // print("MESSAGE:::: $data");
    });
  }

  @override
  void onClose() {
    _subscription?.cancel();
    super.onClose();

  }

  void increment() {
    counter.value++;
  }

  void getDate() {
    currentDate.value = DateTime.now().toString();
  }

  void addItem() {
    items.add(DateTime.now().toString());
  }

  void addMapItem() {
    final String key = DateTime.now().toString();
    mapItems[key] = key;
  }

  void removeItem(int index) {
    items.removeAt(index);
  }

  void removeMapItem(String key) {
    mapItems.remove(key);
  }

  void setPetAge(int age) {
    // myPet.value = myPet.value.copyWith(age: age);
    myPet.age = age;
  }

}