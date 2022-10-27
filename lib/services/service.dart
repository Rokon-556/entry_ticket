import 'package:entry_ticket/models/my_ticket_model.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/user_ticket_model.dart';

class ApiServiceData {
  Future<UserTicketModel?> getAllDataFromApi() async {
    try {
      var url = Uri.parse(
          "http://apps.babuland.org/bblapi/babuland/v1/mock_ticket_ms");

      final response =
          await http.get(url, headers: {"MOBILE_NUMBER": "01717956094"});
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        if (response.body != null) {
          return UserTicketModel.fromJson(jsonData);
        } else {
          return null;
        }
      }
    } catch (e) {
      print("error ! $e");
    }
  }

  Future<MyTicketModel?> getAllMyData(String orderId) async {
    try {
      var url = Uri.parse(
          "http://apps.babuland.org/bblapi/babuland/v1/mock_ticket_dt");

      final response = await http.get(url, headers: {"ORDER_ID": "$orderId"});
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        if (response.body != null) {
          return MyTicketModel.fromJson(jsonData);
        } else {
          return null;
        }
      }
    } catch (e) {
      print("error ! $e");
    }
  }
}
