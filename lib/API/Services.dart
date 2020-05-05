import 'dart:convert' as convert;
import 'package:http/http.dart' as http; // add the http plugin in pubspec.yaml file.

class Services {
  static const ROOT = 'https://tollgateproject.000webhostapp.com/toll_actions.php';
  static const _LOGIN = 'LOGIN';
  static const _GET_BALANCE = 'GET_BALANCE';
  static const _RECHARGE = 'RECHARGE';
  static const _GET_PROFILE = 'GET_PROFILE';
  static String carOwnerName = "";
  static String walletBalance;
  static String numberPlate;

  // Method to create the table Employees.
  Future<String> login(String carNumber, String password) async {
    try {
      // add the parameters to pass to the request.
      numberPlate= carNumber;
      var map = Map<String, dynamic>();
      map['action'] = _LOGIN;
      map['numberPlate'] = carNumber;
      map['password'] = password;
      http.Response response = await http.post(ROOT,body:map);
      print('Login Response: ${response.statusCode}');
      if (200 == response.statusCode) {
        print(response.body);
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }
 Future<void> getBalance() async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _GET_BALANCE;
      map['numberPlate'] = numberPlate;
      var response = await http.post(ROOT, body: map);
      print('getBalance Response: ${response.body}');
      if (200 == response.statusCode) {
        var jsonResponse = convert.jsonDecode(response.body);
        walletBalance = jsonResponse[0]['Wallet_Balance'];
      } else {
        return "Error Getting Balance";
      }
    } catch (e) {
      return e; // return an empty list on exception/error
    }
  }

// Recharge
   Future<void> recharge(int recharge) async {
    try {
      var map = Map<String, dynamic>();
      map.clear();
      map['action'] = _RECHARGE;
      map['numberPlate'] = numberPlate;
      map['amount'] = recharge.toString();
      print("test");
      final response2 = await http.post(ROOT, body: map);
      print('Recharge Response: ${response2.statusCode}');
      print('Recharge Response: ${response2.body}');

    } catch (e) {
      return "error";
    }
  }

   static Future<void> getProfile(String carNumber) async {
    try {
      var map = Map<String, dynamic>();
      map.clear();
      map['action'] = _GET_PROFILE;
      map['numberPlate'] = carNumber;
      final response = await http.post(ROOT, body: map);
      print('Profile Response: ${response.body}');
      if (200 == response.statusCode) {
        var jsonResponse = convert.jsonDecode(response.body);
        carOwnerName = jsonResponse[0]['Name'];
        walletBalance = jsonResponse[0]['Wallet_Balance'];
        print(carOwnerName);
      } else {
        return "Profile Not Found";
      }
    } catch (e) {
      return e; // return an empty list on exception/error
    }
  }
}