import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mvvmapp1/users_list/models/users_list_model.dart';
import 'package:mvvmapp1/users_list/repo/api_status.dart';
import 'package:mvvmapp1/utils/constants.dart';

class UserServices {
  static Future<Object> getUsers() async {
    try {
      final response = await http.get(Uri.parse(USERS_LIST));
      if (response.statusCode == 200) {
        return Success(code: 200, response: usersListModelFromJson(response.body));
      } 
      return Failure(code: 100, errorResponse: "invalid response");

    } on HttpException {
      return Failure(code: 102 , errorResponse: "No Internet Connection");
    } 
      catch (e) {
      return 'Failed to load data';
    }
  }
}
