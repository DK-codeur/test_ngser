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
     
      
    } catch (e) {
      throw e;
    }

  }


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
