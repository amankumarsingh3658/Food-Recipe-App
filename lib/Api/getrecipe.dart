import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:foodrecipeapp/Model/RecipeModel.dart';
import 'package:http/http.dart' as http;

String Recipeurl =
    "https://api.edamam.com/search?q=ladoo&app_id=4adc09ca&app_key=edddb742706c02d48b32948ab36827fe";
Future<RecipeModel> getRecipe() async {
  http.Response response = await http.get(Uri.parse(Recipeurl));
  var data = jsonDecode(response.body.toString());
  // log(data.toString());
  if (response.statusCode == 200) {
    return RecipeModel.fromJson(data);
  } else {
    return RecipeModel.fromJson(data);
  }
}
