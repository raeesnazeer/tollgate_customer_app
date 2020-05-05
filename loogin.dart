import 'dart:convert';
import 'package:http/http.dart' as http; // add the http plugin in pubspec.yaml file.

class Services {
  static const ROOT = 'http://192.168.1.172/tollDB/config/toll_actions.php';
  static const _LOGIN = 'LOGIN';
  static const _GET_BALANCE = 'GET_BALANCE';
  static const _RECHARGE = 'RECHARGE';
  static const _GET_PROFILE = 'GET_PROFILE';

  // Method to create the table Employees.
  Future<String> login() async {
    try {
      // add the parameters to pass to the request.
//      var map = Map<String, dynamic>();
//      map['action'] = _LOGIN;
      http.Response response = await http.get(ROOT,);
      print('Login Response: ${response.body}');
      if (200 == response.statusCode) {
        String data =  response.body;
//        return jsonDecode(data);
      print(data);
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }
// Future getBalance() async {
//    try {
//      var map = Map<String, dynamic>();
//      map['action'] = _GET_BALANCE;
//      final response = await http.post(ROOT, body: map);
//      print('getBalance Response: ${response.body}');
//      if (200 == response.statusCode) {
//        List<Toll> list = parseResponse(response.body);
//        return list;
//      } else {
//        return List<Toll>();
//      }
//    } catch (e) {
//      return List<Toll>(); // return an empty list on exception/error
//    }
//  }
//
//  static List<Toll> parseResponse(String responseBody) {
//    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
//    return parsed.map<Toll>((json) => Toll.fromJson(json)).toList();
//  }
//
//// Method to add employee to the database...
//  static Future<String> recharge(String name) async {
//    try {
//      var map = Map<String, dynamic>();
//      map['action'] = _RECHARGE;
////      map['name'] = name;
//      final response = await http.post(ROOT, body: map);
//      print('recharge Response: ${response.body}');
//      if (200 == response.statusCode) {
//        return response.body;
//      } else {
//        return "error";
//      }
//    } catch (e) {
//      return "error";
//    }
//  }
//
//  static Future<List<Toll>> getProfile() async {
//    try {
//      var map = Map<String, dynamic>();
//      map['action'] = _GET_PROFILE;
//      final response = await http.post(ROOT, body: map);
//      print('Profile Response: ${response.body}');
//      if (200 == response.statusCode) {
//        List<Toll> list = parseResponse(response.body);
//        return list;
//      } else {
//        return List<Toll>();
//      }
//    } catch (e) {
//      return List<Toll>(); // return an empty list on exception/error
//    }
//  }
}