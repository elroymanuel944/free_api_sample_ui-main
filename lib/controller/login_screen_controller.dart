import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:token_test/model/login_res_model.dart';

class LoginScreenController with ChangeNotifier {

bool isLoading = false;

  Future onLogin({
    required String email,
    required String passwrod,
  }) async {
    // setup url

    final url = Uri.parse("https://freeapi.luminartechnohub.com/login");

    try {
      // call http method
      final response = await http.post(url, body: {
        "email": email,
        "password": passwrod,
      });

      if (response.statusCode == 200) {
        //convert data

        LoginResponeModel loginResponeModel =
            loginResponeModelFromJson(response.body);
            if (loginResponeModel.access != null && loginResponeModel.access!.isNotEmpty) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString("access", loginResponeModel.access.toString());
          await prefs.setString("refresh", loginResponeModel.refresh.toString());
        }
            

        // token data
      }
    } catch (e) {}
  }
}
