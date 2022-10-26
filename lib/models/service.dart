// http://apps.babuland.org/bblapi/babuland/v1/mock_ticket_ms

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import './models.dart';


Map<String, dynamic> headerForAllData = {
    'MOBILE_NUMBER':'01717956094'
  };

class ApiServiceData{

  Future<ListModel?> getAllDataFromApi() async{
  try{
    var url = Uri.parse("http://apps.babuland.org/bblapi/babuland/v1/mock_ticket_ms");
    //var response = await http.get(url,headers:headerForAllData);
    final response = await http.get(url, headers: {"MOBILE_NUMBER": "01717956094"});
    if (response.statusCode == 200) {
var jsonData = json.decode(response.body);
        if (response.body != null) {


          //List<ListModel> _model = memberModelFromJson(response.body);
          return ListModel.fromJson(jsonData);
        } else {
          print("3--");
          return null;
        }
      }
  }
  catch(e){
    print("error ! $e");
  }
    
  }

  Future<ListModel?> getAllDataFromApi2(String orderId) async{
  try{
    var url = Uri.parse("http://apps.babuland.org/bblapi/babuland/v1/mock_ticket_dt");
    //var response = await http.get(url,headers:headerForAllData);
    final response = await http.get(url, headers: {"ORDER_ID": "$orderId"});
    if (response.statusCode == 200) {
var jsonData = json.decode(response.body);
        if (response.body != null) {


          //List<ListModel> _model = memberModelFromJson(response.body);
          return ListModel.fromJson(jsonData);
        } else {
          print("3--");
          return null;
        }
      }
  }
  catch(e){
    print("error ! $e");
  }
    
  }

}