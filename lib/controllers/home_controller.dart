import 'package:get/state_manager.dart';
import 'package:getx_test/api/users_api.dart';
import 'package:getx_test/models/user.dart';
import 'package:get/route_manager.dart';
import 'package:getx_test/pages/profile_page.dart';

class HomeController extends GetxController {
  int _counter = 0;
  List<User> _users = [];
  bool _loading = true;

  int get counter => _counter;
  List<User> get users => _users;
  bool get loading => _loading;

  @override
  void onInit() {
    super.onInit();
    print("same as initState");
  }

  @override
  void onReady() {
    super.onReady();
    // executa só uma vez quando o widget ja foi rendarizado na tela
    print("onReady");
    this.loadUsers();
  }

  Future<void> loadUsers() async {
    final data = await UsersApi.instance.getUsers(1);
    this._users = data;
    this._loading = false;
    update(['users']);
  }

  void increment() {
    this._counter++;
    update(['text'], _counter >= 10);
    // isto significa uma array de id e no builder na homepage apenas
    //renderiza os ids também posso por uma condição como segundo parametro
    // aqui so rendariza se o counter for >= 10
  }

  Future<void> showUserProfile(User user) async {
    final result = await Get.to<String> (
        ProfilePage(),
        arguments: user
    );
    if(result != null) {
      print("result $result");
    }
  }
}