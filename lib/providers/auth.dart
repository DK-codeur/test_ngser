import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_ngser/utils/constant.dart';

class Auth with ChangeNotifier {
  //login
  Future<void> login(String email, String password) async {
    final url = "$API_ENDPOINT/rest/check_compte/$email/$password";

    Map<String, String> headers = {
      'Content-Type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8'
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode({
          'email': email,
          'password': password
        }),
        headers: headers
      );

      final responseData = json.decode(response.body);
      print("######### $responseData");
      // if (responseData['etat'] == false) {
      //   throw(HttpException(responseData['response']));
      // }
      
      // _isAuth = responseData['etat'];
      // _userId = responseData['response']['_id'];
      // _chantierId = responseData['response']['chantier'];
      

      //sharesPreferences
      // final prefs = await SharedPreferences.getInstance();
    
      // final userData = json.encode({
      //   'isAuth': _isAuth,
      //   'userId': _userId,
      //   'chantierId': _chantierId
      // });

      // prefs.setString('userData', userData);
      
    } catch (e) {
      throw e;
    }

  }


  //tryAutologin
  // Future<bool> tryAutoLogin() async{
  //   final prefs = await SharedPreferences.getInstance();

  //   if (!prefs.containsKey('userData')) {
  //     return false;
  //   }

  //   final extractedUserData = json.decode(prefs.getString('userData')) as Map<String, Object>;

  //    _isAuth = extractedUserData['isAuth']; //key etat of json (tru or false)
  //   _userId = extractedUserData['userId'];
  //   _chantierId = extractedUserData['chantierId'];
  //   notifyListeners();

  //   return true;

  // }

  //   Future<void> logout() async {
  //   _isAuth = null;
  //   _userId = null;

  //   notifyListeners();
  //   final prefs = await SharedPreferences.getInstance();
  //   // prefs.remove('userId');
  //   prefs.clear();
  // }


  //Register
  Future<String> register(String username, String userfirstname, String userdatenaiss, String useremail, String usermsidn) async {
    final url = "$API_ENDPOINT/rest/create_compte/IDOXJalA/$username/$userfirstname/$userdatenaiss/$useremail/null/$usermsidn/null/null/null/null/null";

    Map<String, String> headers = {
      'Content-Type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8'
    };

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: headers
      );

      final responseData = json.decode(response.body);
      print("######### $responseData");
      
      if (responseData['compteNumero'] == null) {
        return "error";
      }

      return "success";
      
      
    } catch (e) {
      throw e;
    }

  }
}