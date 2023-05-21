import 'dart:convert';
import 'package:clean_archtecture_base/core/service_locator.dart';
import 'package:clean_archtecture_base/data/model/user/user_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class FlutterStorageSecureService {
  final String _USER_CACHE_KEY = 'usercache';

  User? _user;
  User? get user => _user;

  FlutterSecureStorage get flutterSecureStorage =>
      serviceLocator<FlutterSecureStorage>();

  Future<bool> saveUser(User user) async {
    bool saved = false;
    var map = user.toJson();
    await flutterSecureStorage
        .write(key: _USER_CACHE_KEY, value: jsonEncode(map))
        .then((value) => saved = true);

    if (saved) {
      _user = await getUser();
    }

    return saved;
  }

  Future<User?> getUser() async {
    User usr;
    var userMap = await flutterSecureStorage.read(key: _USER_CACHE_KEY);
    if (userMap == null) {
      return null;
    }
    usr = User.fromJson(jsonDecode(userMap));
    _user = usr;
    return usr;
  }

  Future<bool> deleteUser() async {
    bool deleted = false;
    _user = null;
    await flutterSecureStorage
        .delete(key: _USER_CACHE_KEY)
        .then((value) => deleted = true);
    return deleted;
  }
}
