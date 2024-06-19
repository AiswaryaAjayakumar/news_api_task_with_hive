// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:news_api/repository/model/api_res_model.dart';

class HomeScreenController with ChangeNotifier {
  List<Article> newArticles = [];
  static List favKeys = [];

  var myBox = Hive.box('fav');

  void addFav({
    required String title,
    required String imgUrl,
    required String author,
  }) {
    myBox.add({
      "title": title,
      "img": imgUrl,
      "price": author,
    });
    notifyListeners();
  }

  void deleteData(int index) {
    myBox.deleteAt(index);
    favKeys = myBox.keys.toList();
    notifyListeners();
  }


  Future<void> fetchNews() async {
    final url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=in&apiKey=6ce4f289ab0845ce946c96e79c8ef442");

    final resData = await http.get(url);
    // print(resData.statusCode);
    // print(resData.body);

    if (resData.statusCode == 200) {
      var decodedData = jsonDecode(resData.body);
      ApiResModel apires = ApiResModel.fromJson(decodedData);
      newArticles = apires.articles ?? [];
    }
    notifyListeners();
  }
}
