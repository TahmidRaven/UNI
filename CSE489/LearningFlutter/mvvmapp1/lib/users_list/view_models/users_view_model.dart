import 'package:flutter/material.dart';
import 'package:mvvmapp1/users_list/models/users_list_model.dart';
import 'package:mvvmapp1/users_list/services/user_services.dart';

class UsersViewModel extends ChangeNotifier {
  bool _loading = false;
  List<UserModel> _userListModel = [];
  UserError _userError;

  bool get loading => _loading;
  List<UserModel> get userListModel => _userListModel;
  UserError get userError => _userError;

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setUserListModel(List<UserModel> userListModel) async {
    _userListModel = userListModel;
    notifyListeners();
  }

  setUserError(UserError userError) async {
    _userError = userError;
    notifyListeners();
  }

  getUsers() async {
    setLoading(true);
    var response = await UserServices.getUsers();
    // Use the response variable here.
  }
}