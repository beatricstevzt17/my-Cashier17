import 'package:flutter/material.dart';
import 'package:app_kasir/app/screens/beranda/beranda.dart';
import 'package:app_kasir/app/screens/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:dio/dio.dart';

//MODELS
import 'package:app_kasir/app/models/users_model.dart';

//PROVIDERS (controller)
import 'package:provider/provider.dart';
import '../controllers/users_provider.dart';

class UserService {
  final Dio _dio = Dio();
  final root = "https://my-cashier17.herokuapp.com/api/v1";
  
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>REGISTER
  Future<void> register({
    String? username,
    String? email,
    String? password,
    BuildContext? context,
  }) async {
    try {
      final url = root + "/users/register";
      final postData = {
        "username": username,
        "email": email,
        "password": password,
      };

      final response = await _dio.post(
        url,
        data: postData,
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
      );

      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context!).showSnackBar(
          SnackBar(
            content: Text(
              response.data["message"],
              style: const TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const LoginPage()),
        );
        return;
      }
    } on DioError catch (e) {
      ScaffoldMessenger.of(context!).showSnackBar(
        SnackBar(
          content: Text(
            e.response?.data["message"],
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
        ),
      );

      return;
    }
  }

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>LOGIN
  Future<void> login({
    String? email,
    String? password,
    BuildContext? context,
  }) async {
    final user = Provider.of<UserProvier>(context!, listen: false);
    try {
      final url = root + "/users/login";
      final postData = {
        "email": email,
        "password": password,
      };

      final response = await _dio.post(
        url,
        data: postData,
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
      );
      final pref = await SharedPreferences.getInstance();
      if (response.statusCode == 200) {
        //MODELS
        user.setData = Users.fromJson(response.data["data"][0]);
        user.setToken = response.data["token"].toString();
        pref.setString("token", response.data["token"].toString());
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              response.data["message"],
              style: const TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const BerandaPage()),
        );
        return;
      }
    } on DioError catch (e) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.response?.data["message"],
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
  }

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>UPDATE PROFILE
  Future<void> getUser({BuildContext? context, int? id}) async {
    final user = Provider.of<UserProvier>(context!, listen: false);
    final url = root + "/user";
    final pref = await SharedPreferences.getInstance();
    try {
      final response = await _dio.post(
        url,
        data: {'id': id},
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
      );

      if (response.statusCode == 200) {
        //MODELS
        user.setData = Users.fromJson(response.data["data"]);
        user.setToken = pref.getString("token").toString();
        return;
      }
    } on DioError catch (e) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.response?.data["message"],
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
  }

  Future<void> update({
    String? username,
    String? email,
    BuildContext? context,
    String? token,
    int? id,
  }) async {
    final user = Provider.of<UserProvier>(context!, listen: false);
    try {
      final url = root + "/user";
      final postData = {
        "username": username,
        "email": email,
        "id": id,
      };

      final response = await _dio.put(
        url,
        data: postData,
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": token,
          },
        ),
      );
      final pref = await SharedPreferences.getInstance();
      if (response.statusCode == 200) {
        //MODELS
        user.setData = Users.fromJson(response.data["data"]);
        user.setToken = response.data["token"].toString();
        pref.setString("token", response.data["token"].toString());
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              response.data["message"],
              style: const TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.green,
          ),
        );
        return;
      }
    } on DioError catch (e) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.response?.data["message"],
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
  }
}
