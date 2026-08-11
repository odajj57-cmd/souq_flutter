import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:souq_application_1/Modile/modile.dart';

Future<List<Product>> getProducts() async {
  final response =
      await http.get(Uri.parse('https://dummyjson.com/products'));

  final data = jsonDecode(response.body);

  return (data['products'] as List)
      .map((item) => Product.fromJson(item))
      .toList();
}