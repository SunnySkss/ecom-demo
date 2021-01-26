import 'dart:convert';
import 'package:flutter_app/util/api.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_app/model/request_product.dart';
import 'package:flutter_app/pojo/model.dart';

class MyNotifier extends ChangeNotifier{
  Result result;
  List<String> tabNames=new List();

  getAllCategories(RequestClass requestClass) async{
    //tabNames=new List();
    final response =await http.post(API.dashBord,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(requestClass));
    if(response.statusCode==200){
      print("success");
      MyModel responseData=MyModel.fromJson(json.decode(response.body.toString()));
      result=responseData.result;
      print(result.category.length);
      for(int i=0;i<result.category.length;i++){
        if(result.category[i].subCategories==null){
          tabNames.add(result.category[i].name);
        }
      }
      notifyListeners();
    }
    else{
      print("something is wrong");
    }
  }
  int get tabLength => tabNames.length;

}