import 'dart:developer';
import 'package:fuctional_codeblocs/Rest_Api_Example/user_model.dart';
import 'api_constants.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<UsersModel>?> getUsers() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<UsersModel> _model = usersModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}