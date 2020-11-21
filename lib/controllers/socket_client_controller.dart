import 'dart:async';
import 'package:get/get.dart';
import 'package:faker/faker.dart';

class SocketClientController extends GetxController {

  RxString _message = "".obs;
  RxString get message => _message;

  RxInt _counter = 0.obs;
  RxString _searchText = "".obs;

  Timer _timer, _timerCounter;
  final _faker = Faker();

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  _init() {
    // ever(_counter, (_) {
    //   print("_counter has been changed ${_counter.value}");
    // });

    ever(_searchText, (_) {
      print("_searchText EVER has been changed");
    });

    // once(_counter, (_) {
    //   print("_counter has changed ${_counter.value}");
    // });

    // debounce(_searchText, (_) {
    //   print("DEBOUNCE " + _searchText.value);
    // }, time: Duration(milliseconds: 500)
    // );

    interval(_searchText, (_) {
      print("INTERVAL " + _searchText.value);
    }, time: Duration(milliseconds: 500)
    );

    _timer = Timer.periodic(
        Duration(seconds: 5),
        (timer) {
          _message.value = _faker.lorem.sentence();
        }
    );

    _timerCounter = Timer.periodic(
        Duration(seconds: 1),
            (timer) {
          _counter.value++;
        }
    );
  }

  @override
  void onClose() {
    if(_timer != null) {
      _timer.cancel();
    }
    if(_timerCounter != null) {
      _timerCounter.cancel();
    }
    super.onClose();
  }

  setSearchText(String text) {
    _searchText.value = text;
  }
}