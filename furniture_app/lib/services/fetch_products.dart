import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/product.dart';

//Fetch products from Api
Future<List<Product>> fetchProduct() async {
  const String apiUrl =
      "https://5f210aa9daa42f001666535e.mockapi.io/api/products";
  final reponse = await http.get(Uri.parse(apiUrl));
  if (reponse.statusCode == 200) {
    List<Product> products = (json.decode(reponse.body) as List)
        .map((data) => Product.fromJson(data))
        .toList();
    return products;
  } else {
    //
    throw Exception('Failed to load');
  }
}
