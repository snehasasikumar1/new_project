import 'dart:convert';

import 'package:emp/Usermodel.dart';
import 'package:http/http.dart' as http;


class FetchUserList {
  var data = [];
  List<Userlist> results = [];
  String urlList = 'https://www.mocky.io/v2/5d565297300000680030a986';

  Future<List<Userlist>> getuserList({String? query}) async {
    var url = Uri.parse(urlList);
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
      
        data = json.decode(response.body);
        results = data.map((e) => Userlist.fromJson(e)).toList();
        if (query!= null){
          results = results.where((element) => element.name!.toLowerCase().contains((query.toLowerCase()))).toList();
        }
      } else {
        print("fetch error");
      }
    } on Exception catch (e) {
      print('error: $e');
    }
    return results;
  }
}