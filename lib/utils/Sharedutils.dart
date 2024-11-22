import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedUtils {
  var userdetail="Userdetails";
  var token="token";
  var address="address";
  var username="name";
  var useremail="email";
  var userimage="image";
  var login_type="login_type";

  save_user_data(String data) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(userdetail, data);
  }

  save_address_data(String data) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(address, data);
  }

  save_token(String data) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(token, data);
  }

  save_username(String data) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(username, data);
  }
  save_useremail(String data) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(useremail, data);
  }
  save_userimage(String data) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(userimage, data);
  }
  save_logintype(String data) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(login_type, data);
  }

  Future<String?> get_logintype() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(login_type);
  }

  Future<String?> get_token() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(token);
  }

  Future<String?> get_user_data() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(userdetail);
  }

  Future<String?> get_address_data() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(address);
  }

  Future<String?> get_username() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(username);
  }
  Future<String?> get_useremail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(useremail);
  }
  Future<String?> get_userimage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(userimage);
  }

  cleardata() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

}