import 'package:digichar/services/services.dart';
import 'package:flutter/material.dart';

import '../api/server_api.dart';
import '../models/models.dart';

class AuthService extends ChangeNotifier {
  // Si retornamos algo, es un error, si no, todo bien!

  User? user;

  Future<String?> createUser(
      String username, String email, String password) async {
    final Map<String, dynamic> authData = {
      "Username": username,
      "Email": email,
      "Password": password
    };
    try {
      final json = await ServerApi.httpPost('/register', authData);
      final authResp = AuthResponse.fromJson(json);
      user = authResp.user;
      await Preferences.prefs.setString('refreshToken', authResp.refreshtoken);
      return null;
    } catch (e) {
      final error = MessageResponse.fromJson(e as Map<String, dynamic>);
      return error.msg;
    }
  }

  Future<String?> login(String email, String password) async {
    final Map<String, dynamic> authData = {
      'Username': email,
      'Password': password
    };
    try {
      final json = await ServerApi.httpPost('/login', authData);
      final authResp = AuthResponse.fromJson(json);
      user = authResp.user;
      await Preferences.prefs.setString('refreshToken', authResp.refreshtoken);
      return null;
    } catch (e) {
      final error = MessageResponse.fromJson(e as Map<String, dynamic>);
      return error.msg;
    }
  }

  Future logout() async {
    await Preferences.prefs.clear();
    return;
  }

  // Future<String> refreshToken() async {

  //   // return await storage.read(key: 'token') ?? '';

  // }
}
