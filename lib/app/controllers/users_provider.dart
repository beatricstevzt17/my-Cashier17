import 'package:flutter/cupertino.dart';

import '../models/users_model.dart';
import '../services/users_service.dart';

class UserProvier with ChangeNotifier {
  final UserService _userService = UserService();

  Future<void> register({
    String? username,
    String? email,
    String? password,
    BuildContext? context,
  }) async {
    _userService.register(
      email: email,
      username: username,
      password: password,
      context: context,
    );
  }

  void login({
    String? email,
    String? password,
    BuildContext? context,
  }) {
    _userService.login(
      email: email,
      password: password,
      context: context,
    );
  }
  //MODELS
  Users? _userModel;

  set setData(Users val) {
    _userModel = val;
    notifyListeners();
  }

  Users? get getData => _userModel;
  String? _token;
  set setToken(String val) => _token = val;
  String? get getToken => _token;
}
